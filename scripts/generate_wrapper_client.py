#!/usr/bin/env python3
"""Generate the root daneshk/githubx Client as a thin delegating wrapper over the
generated ballerina/modules/oas client, plus splice in the hand-maintained composite
operations from scripts/composites.bal.

Design (see project discussion): `oas` is 100% `bal openapi` output, safe to blindly
regenerate. The wrapper layer here is mechanical (pure passthrough, no type
transformation needed for GitHub) so it is script-generated too, every time `oas`
regenerates - the only genuinely hand-maintained surface is scripts/composites.bal.

Run after regenerating ballerina/modules/oas (bal openapi ... -o ballerina/modules/oas).
Writes ballerina/client.bal.
"""

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
OAS_CLIENT = ROOT / "ballerina" / "modules" / "oas" / "client.bal"
COMPOSITES = ROOT / "scripts" / "composites.bal"
OUTPUT = ROOT / "ballerina" / "client.bal"
LICENSE = ROOT / "docs" / "license.txt"

FUNC_RE = re.compile(
    r"^\s*resource isolated function (?P<method>get|post|put|patch|delete) (?P<path>[^(]+?)\((?P<params>.*)\) returns (?P<ret>.+) \{$"
)

# Always use the explicit method accessor - omitting it for GET compiles fine only
# when the path is unambiguous (no other method shares it), which is not true across
# this API (e.g. get+patch both on repos/{}/{}/pulls/{}). Explicit is always valid.
METHOD_SUFFIX = {"get": ".get", "post": ".post", "put": ".put", "patch": ".patch", "delete": ".delete"}

# Builtin/keyword type tokens that must NOT be qualified with `oas:`
BUILTIN_TYPES = {
    "string", "int", "boolean", "float", "decimal", "byte", "json", "xml", "error",
    "map", "table", "future", "never", "anydata", "any", "record", "readonly", "true", "false",
}

PRIMITIVE_PATH_TYPES = {"string", "int", "boolean", "float", "decimal", "byte"}


def qualify_types(type_expr: str) -> str:
    """Prefix every PascalCase identifier (a generated oas type) with `oas:`, but leave
    identifiers already qualified with a module prefix untouched (e.g. `http:Response`
    must not become `http:oas:Response`)."""
    def repl(m):
        word = m.group(0)
        if word in BUILTIN_TYPES or not word[0].isupper():
            return word
        return f"oas:{word}"
    return re.sub(r"(?<!:)\b[A-Za-z_][A-Za-z0-9_]*\b", repl, type_expr)


def qualify_path_types(raw_path: str) -> str:
    """Qualify a named custom type used as a path-param type (e.g. `[AlertNumber id]`
    or `[workflowId id]` - custom type aliases aren't necessarily PascalCase) with
    `oas:`. Inline unions of string literals (e.g. `["a"|"b" name]`) and builtin
    primitives are left untouched."""
    def repl(m):
        content = m.group(1)
        idx = content.rfind(" ")
        if idx == -1:
            return f"[{content}]"
        type_part, name = content[:idx], content[idx + 1:]
        if re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", type_part) and type_part not in PRIMITIVE_PATH_TYPES:
            type_part = f"oas:{type_part}"
        return f"[{type_part} {name}]"
    return re.sub(r"\[([^\[\]]+)\]", repl, raw_path)


def split_params(params: str) -> list:
    """Split a parameter list on top-level commas (ignoring commas inside <>, [], ())."""
    parts, depth, current = [], 0, ""
    for ch in params:
        if ch in "<[(":
            depth += 1
        elif ch in ">])":
            depth -= 1
        if ch == "," and depth == 0:
            parts.append(current.strip())
            current = ""
        else:
            current += ch
    if current.strip():
        parts.append(current.strip())
    return parts


def call_path(raw_path: str) -> str:
    """Convert a resource path declaration into a call-site resource-access expression:
    strip the type from each `[type name]` bracket (keeping only the text after the
    LAST space, which is always the param name regardless of how complex the type
    expression is - handles named types, and inline unions like `["a"|"b" name]`),
    keeping literal/escaped segments as-is."""
    def repl(m):
        content = m.group(1)
        idx = content.rfind(" ")
        name = content[idx + 1:] if idx != -1 else content
        return f"[{name}]"
    return re.sub(r"\[([^\[\]]+)\]", repl, raw_path)


def path_segments(raw_path: str) -> list:
    """Split a raw resource path into segments, without touching bracket contents
    (so a `[string owner]` segment stays intact as one element)."""
    segments, depth, current = [], 0, ""
    for ch in raw_path:
        if ch == "[":
            depth += 1
        elif ch == "]":
            depth -= 1
        if ch == "/" and depth == 0:
            segments.append(current)
            current = ""
        else:
            current += ch
    segments.append(current)
    return [s for s in segments if s]


def structural_signature(segments: list) -> tuple:
    """A path's shape for sibling-collision detection: literal segments verbatim,
    bracketed param segments collapsed to a placeholder (param name doesn't matter,
    only that it's a param, for grouping purposes)."""
    return tuple("{param}" if seg.startswith("[") else seg for seg in segments)


def find_ambiguous_operations(ops: list) -> set:
    """A resource-access call from outside the `oas` module cannot resolve a path
    whose last segment is a literal when a SIBLING resource exists with an identical
    parent path but a bracketed (param) last segment - Ballerina's compiler reports
    this as 'client resource access action is not yet supported when the
    corresponding resource method is ambiguous'. Detect it structurally so this is
    caught on every regeneration, not just by reading `bal build` errors.

    Returns the set of `id(op)`-style keys (index positions) for ops whose LITERAL
    last segment collides with a sibling param resource at the same parent path -
    these cannot be delegated and are skipped, with a clear report at the end.
    """
    parent_children = {}  # parent structural signature -> set of last-segment kinds seen
    op_by_signature = {}
    for idx, op in enumerate(ops):
        segs = path_segments(op["path"])
        if not segs:
            continue
        sig = structural_signature(segs)
        parent_sig, last = sig[:-1], sig[-1]
        parent_children.setdefault(parent_sig, set()).add(last)
        op_by_signature.setdefault((parent_sig, last), []).append(idx)

    ambiguous = set()
    for parent_sig, kinds in parent_children.items():
        has_param_sibling = "{param}" in kinds
        literal_siblings = kinds - {"{param}"}
        if has_param_sibling and literal_siblings:
            for literal in literal_siblings:
                ambiguous.update(op_by_signature[(parent_sig, literal)])
    return ambiguous


def parse_oas_client() -> list:
    text = OAS_CLIENT.read_text()
    lines = text.splitlines()
    ops = []
    for i, line in enumerate(lines):
        m = FUNC_RE.match(line)
        if not m:
            continue
        doc = []
        j = i - 1
        while j >= 0 and lines[j].strip().startswith("#"):
            doc.append(lines[j])
            j -= 1
        doc.reverse()
        ops.append({
            "method": m.group("method"),
            "path": m.group("path"),
            "params": m.group("params"),
            "ret": m.group("ret").strip(),
            "doc": doc,
        })
    return ops


def render_wrapper(op: dict) -> str:
    method, path, ret = op["method"], op["path"], op["ret"]
    params = split_params(op["params"])

    sig_params = []
    call_args = []
    for p in params:
        if p.startswith("*"):
            # rest param: *QueriesType name
            type_part, name = p[1:].rsplit(" ", 1)
            sig_params.append(f"*{qualify_types(type_part)} {name}")
            call_args.append(name)
        elif p.startswith("map<string|string[]> headers"):
            sig_params.append(p)
            call_args.append("headers")
        else:
            # payload param: TypeName name
            type_part, name = p.rsplit(" ", 1)
            sig_params.append(f"{qualify_types(type_part)} {name}")
            call_args.append(name)

    sig = ", ".join(sig_params)
    args = ", ".join(call_args)
    ret_q = qualify_types(ret)
    access = "" if path == "." else call_path(path)
    suffix = METHOD_SUFFIX[method]
    decl_path = qualify_path_types(path)

    lines = list(op["doc"])
    lines.append(
        f"    resource isolated function {method} {decl_path}({sig}) returns {ret_q} {{"
    )
    lines.append(f"        return self.genClient->/{access}{suffix}({args});")
    lines.append("    }")
    return "\n".join(lines)


def main() -> None:
    ops = parse_oas_client()
    print(f"Parsed {len(ops)} resource functions from {OAS_CLIENT.relative_to(ROOT)}")

    ambiguous = find_ambiguous_operations(ops)
    if ambiguous:
        print(f"\nSKIPPING {len(ambiguous)} operations - Ballerina cannot statically resolve a "
              f"resource-access call whose last path segment is a literal when a sibling "
              f"resource exists with a bracketed param at the same position "
              f"(e.g. 'gists/{{}}/comments' vs 'gists/{{}}/{{sha}}'). These remain reachable "
              f"via `import daneshk/githubx.oas;` directly:")
        for idx in sorted(ambiguous):
            op = ops[idx]
            print(f"  {op['method'].upper()} {op['path']}")

    included_ops = [op for i, op in enumerate(ops) if i not in ambiguous]
    wrappers = "\n\n".join(render_wrapper(op) for op in included_ops)
    composites = COMPOSITES.read_text() if COMPOSITES.exists() else ""

    license_header = LICENSE.read_text() if LICENSE.exists() else ""

    header = license_header + "\n" + (
        "import daneshk/githubx.oas;\n"
        "import ballerina/http;\n\n"
        "# GitHub's v3 REST API, with additional composite operations for common\n"
        "# multi-step workflows (see scripts/composites.bal for the hand-maintained source).\n"
        "#\n"
        "# This client is a thin delegating wrapper generated from `ballerina/modules/oas`\n"
        "# (script-generated - see scripts/generate_wrapper_client.py, do not hand-edit the\n"
        "# wrapper methods below the marker; composite operations after the second marker are\n"
        "# hand-maintained in scripts/composites.bal and spliced in by the same script).\n"
        "public isolated client class Client {\n"
        "    private final oas:Client genClient;\n\n"
        "    # Gets invoked to initialize the `connector`.\n"
        "    #\n"
        "    # + config - The configurations to be used when initializing the `connector`\n"
        "    # + serviceUrl - URL of the target service\n"
        "    # + return - An error if connector initialization failed\n"
        '    public isolated function init(oas:ConnectionConfig config, string serviceUrl = "https://api.github.com") returns error? {\n'
        "        self.genClient = check new oas:Client(config, serviceUrl);\n"
        "    }\n\n"
        "    // ============================================================\n"
        "    // GENERATED WRAPPER METHODS - do not hand-edit below this line.\n"
        "    // Regenerate with: python3 scripts/generate_wrapper_client.py\n"
        "    // ============================================================\n"
    )

    footer = (
        "\n\n"
        "    // ============================================================\n"
        "    // COMPOSITE OPERATIONS - hand-maintained in scripts/composites.bal\n"
        "    // ============================================================\n\n"
        + composites +
        "\n}\n\n"
        "// ============================================================\n"
        "// Module-level helpers for composite operations (hand-maintained\n"
        "// alongside scripts/composites.bal, spliced in here since Ballerina\n"
        "// does not allow top-level declarations inside a class body).\n"
        "// ============================================================\n\n"
        "# The combined CI status for a ref: legacy commit statuses plus Checks API runs.\n"
        "#\n"
        "# + statuses - The legacy combined commit status\n"
        "# + checkRuns - Check runs reported through the Checks API\n"
        "public type CombinedCiStatus record {|\n"
        "    oas:CombinedCommitStatus statuses;\n"
        "    oas:CheckRun[] checkRuns;\n"
        "|};\n\n"
        "# True if the given error represents an HTTP 404 response from the underlying client.\n"
        "isolated function isNotFound(error err) returns boolean {\n"
        "    map<anydata> detail = <map<anydata>> err.detail();\n"
        '    anydata statusCode = detail["statusCode"];\n'
        "    if statusCode is int {\n"
        "        return statusCode == 404;\n"
        "    }\n"
        '    return err.message().includes("404");\n'
        "}\n"
    )

    output = header + wrappers + footer
    OUTPUT.write_text(output)
    print(f"Wrote {OUTPUT.relative_to(ROOT)} ({len(included_ops)} wrapper methods + composites)")


if __name__ == "__main__":
    main()
