#!/usr/bin/env python3
"""Derive low-code display metadata for every operation in ballerina/client.bal.

Parses each `resource isolated function`, extracts HTTP method, resource path and
doc-comment summary, then derives:
  - label       : from the doc-comment summary line
  - group       : first path segment
  - subgroup    : second-level resource segment (only for large groups: repos, orgs)
  - actionTags  : create/read/update/delete/search from HTTP method + path

Manual curation (recommended flags, ranks, keywords, disambiguation hints) is merged
from scripts/display_overrides.json, keyed by "METHOD path".

Output: docs/spec/display-metadata.json — reviewed before being injected into the
OpenAPI spec as x-ballerina-display extensions.
"""

import json
import re
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CLIENT_BAL = ROOT / "ballerina" / "client.bal"
OVERRIDES = ROOT / "scripts" / "display_overrides.json"
OPENAPI = ROOT / "docs" / "spec" / "openapi.json"
OUTPUT = ROOT / "docs" / "spec" / "display-metadata.json"

# Groups large enough to need a second tier in the palette
SUBGROUPED = {"repos", "orgs"}

METHOD_ACTION = {
    "get": "read",
    "post": "create",
    "put": "update",
    "patch": "update",
    "delete": "delete",
}

FUNC_RE = re.compile(r"^\s*resource isolated function (get|post|put|patch|delete) ([^(]+)\(")


def normalize_path(raw: str) -> str:
    """Turn `repos/[string owner]/[string repo]/code\\-scanning` into
    `repos/{}/{}/code-scanning`."""
    path = raw.replace("\\", "")
    path = re.sub(r"\[[^\]]+\]", "{}", path)  # any typed path param, incl. union types
    path = path.replace("'", "")  # Ballerina escaped identifiers, e.g. 'import
    return path.strip()


def derive(path: str, method: str) -> dict:
    segments = path.split("/")
    group = segments[0]
    subgroup = None
    if group in SUBGROUPED:
        # skip the parameter placeholders: repos/{}/{}/<sub>, orgs/{}/<sub>
        rest = [s for s in segments[1:] if s != "{}"]
        subgroup = rest[0] if rest else None

    tags = [METHOD_ACTION[method]]
    if group == "search":
        tags = ["read", "search"]
    return {"group": group, "subgroup": subgroup, "actionTags": tags}


def parse_client(text: str) -> list[dict]:
    lines = text.splitlines()
    ops = []
    for i, line in enumerate(lines):
        m = FUNC_RE.match(line)
        if not m:
            continue
        method, raw_path = m.group(1), m.group(2)
        path = normalize_path(raw_path)

        # walk up through the contiguous doc-comment block; its first line is the summary
        summary = None
        j = i - 1
        block = []
        while j >= 0 and lines[j].strip().startswith("#"):
            block.append(lines[j].strip().lstrip("#").strip())
            j -= 1
        if block:
            summary = block[-1] or None

        entry = {
            "method": method.upper(),
            "path": path,
            "line": i + 1,
            "label": summary or path,
            **derive(path, method),
        }
        ops.append(entry)
    return ops


def load_operation_ids() -> dict:
    """Map 'METHOD normalized-path' -> spec operation fields from the OpenAPI spec.

    The spec's own `summary` is authoritative for the label — client.bal's doc comment is
    generator output and has been observed to be mismatched for at least one operation
    (checks/get, which get a copy-pasted security-advisory comment), so summary is preferred
    over the doc-comment-derived label wherever the spec has a match.
    """
    spec = json.loads(OPENAPI.read_text())
    ids = {}
    for spec_path, item in spec["paths"].items():
        norm = re.sub(r"\{[^}]+\}", "{}", spec_path).lstrip("/") or "."
        for method in ("get", "post", "put", "patch", "delete"):
            if method in item and "operationId" in item[method]:
                op = item[method]
                ids[f"{method.upper()} {norm}"] = {
                    "operationId": op["operationId"],
                    "summary": (op.get("summary") or "").strip() or None,
                    "description": (op.get("description") or "").strip() or None,
                    "docsUrl": (op.get("externalDocs") or {}).get("url"),
                }
    return ids


def main() -> None:
    ops = parse_client(CLIENT_BAL.read_text())

    op_ids = load_operation_ids()
    unmatched_ops = []
    for op in ops:
        spec_op = op_ids.get(f"{op['method']} {op['path']}")
        op["operationId"] = spec_op["operationId"] if spec_op else None
        op["description"] = spec_op.get("description") if spec_op else None
        op["docsUrl"] = spec_op.get("docsUrl") if spec_op else None
        if spec_op and spec_op.get("summary"):
            op["label"] = spec_op["summary"]
        if spec_op is None:
            unmatched_ops.append(op)
    if unmatched_ops:
        print(f"WARNING: {len(unmatched_ops)} client operations have no operationId match in the spec:", file=sys.stderr)
        for op in unmatched_ops[:40]:
            print(f"  {op['method']} {op['path']} (line {op['line']})", file=sys.stderr)

    overrides = {}
    if OVERRIDES.exists():
        overrides = json.loads(OVERRIDES.read_text())
    applied = 0
    for op in ops:
        key = f"{op['method']} {op['path']}"
        if key in overrides:
            op.update(overrides[key])
            applied += 1
    unmatched = [k for k in overrides if k not in {f"{o['method']} {o['path']}" for o in ops}]
    if unmatched:
        print(f"WARNING: {len(unmatched)} override keys did not match any operation:", file=sys.stderr)
        for k in unmatched:
            print(f"  {k}", file=sys.stderr)

    OUTPUT.write_text(json.dumps(ops, indent=2) + "\n")
    print(f"{len(ops)} operations -> {OUTPUT.relative_to(ROOT)} ({applied} overrides applied)")

    groups = Counter(o["group"] for o in ops)
    print("\nGroup counts:")
    for g, n in groups.most_common():
        print(f"  {g:<22}{n}")

    for big in sorted(SUBGROUPED):
        subs = Counter(o["subgroup"] or "(root)" for o in ops if o["group"] == big)
        print(f"\n'{big}' subgroup counts:")
        for s, n in subs.most_common():
            print(f"  {s:<26}{n}")


if __name__ == "__main__":
    main()
