#!/usr/bin/env python3
"""Generate ballerina/ui-schema.json (the low-code palette index) from
docs/spec/display-metadata.json.

The ui-schema file is bundled into the bala (via `include` in Ballerina.toml) so the
low-code editor can render grouping, ranking, filter chips, search keywords and
disambiguation hints without parsing the 17k-line generated client.

Operations are keyed by OpenAPI operationId (stable identity, aligns with the WSO2 MI
uischema `operationName` convention). Operations absent from the current spec
(sunset Projects classic endpoints) fall back to "METHOD path" keys and are flagged
`deprecated`.

Run scripts/derive_display_metadata.py first.
"""

import json
import re
from collections import Counter
from pathlib import Path

import taxonomy

ROOT = Path(__file__).resolve().parent.parent
METADATA = ROOT / "docs" / "spec" / "display-metadata.json"
OUTPUT = ROOT / "ballerina" / "ui-schema.json"

GROUP_LABELS = {
    "repos": "Repositories",
    "orgs": "Organizations",
    "user": "Authenticated User",
    "users": "Users",
    "teams": "Teams",
    "projects": "Projects (classic)",
    "gists": "Gists",
    "app": "GitHub App",
    "apps": "GitHub Apps",
    "app-manifests": "GitHub App",
    "repositories": "Repositories (by ID)",
    "search": "Search",
    "notifications": "Notifications",
    "marketplace_listing": "Marketplace",
    "applications": "OAuth Applications",
    "assignments": "Classroom",
    "classrooms": "Classroom",
    "advisories": "Security Advisories",
    "codes_of_conduct": "Codes of Conduct",
    "enterprises": "Enterprises",
    "gitignore": "Gitignore Templates",
    "installation": "App Installation",
    "licenses": "Licenses",
    "markdown": "Markdown",
    "meta": "Meta",
    "rate_limit": "Rate Limit",
    "octocat": "Meta",
    "zen": "Meta",
    "emojis": "Meta",
    "versions": "Meta",
    "feeds": "Activity",
    "events": "Activity",
    "networks": "Activity",
    "issues": "Issues",
    "organizations": "Organizations",
}

SUBGROUP_LABELS = {
    "pulls": "Pull Requests",
    "issues": "Issues",
    "actions": "Actions",
    "git": "Git Database",
    "code-scanning": "Code Scanning",
    "secret-scanning": "Secret Scanning",
    "security-advisories": "Security Advisories",
    "check-runs": "Check Runs",
    "check-suites": "Check Suites",
    "dependency-graph": "Dependency Graph",
    "personal-access-tokens": "Personal Access Tokens",
    "personal-access-token-requests": "PAT Requests",
    "public_members": "Public Members",
    "failed_invitations": "Failed Invitations",
    "outside_collaborators": "Outside Collaborators",
    "interaction-limits": "Interaction Limits",
    "(root)": "General",
}


def humanize(name: str) -> str:
    return name.replace("-", " ").replace("_", " ").title()


def group_label(name: str) -> str:
    return GROUP_LABELS.get(name, humanize(name))


def subgroup_label(name: str) -> str:
    return SUBGROUP_LABELS.get(name, humanize(name))


# GitHub API scope (operationId prefix) -> readable noun used to disambiguate colliding
# labels, e.g. "List organization secrets (Actions)" vs "... (Codespaces)" vs "... (Dependabot)"
SCOPE_LABELS = {
    "orgs": "Organizations", "repos": "Repositories", "pulls": "Pull Requests",
    "users": "Users", "apps": "Apps", "git": "Git", "checks": "Checks",
    "activity": "Activity", "actions": "Actions", "issues": "Issues",
}

METHOD_VERB = {"GET": "Get", "POST": "Create", "PUT": "Set", "PATCH": "Update", "DELETE": "Remove"}


def scope_label(scope: str) -> str:
    return SCOPE_LABELS.get(scope, humanize(scope))


def fallback_label(method: str, path: str) -> str:
    """Human phrase for the handful of operations with neither a client.bal doc comment nor
    a spec match (sunset Projects-classic endpoints) — the label would otherwise be a raw
    path like 'teams/{}/projects/{}'."""
    segments = [s for s in path.split("/") if s and s != "{}"]
    noun = " ".join(humanize(s).lower() for s in segments[:-1] if s not in ("repos", "orgs")) or humanize(segments[-1]).lower()
    verb = "list" if method == "GET" and not path.endswith("{}") else METHOD_VERB[method].lower()
    return f"{verb.capitalize()} {noun}".strip()


def disambiguate_label(label: str, operation_id: str, method: str, path: str) -> str:
    """On collision, append the API scope as a parenthetical, e.g. 'List organization
    secrets (Actions)'. Keeps the label a plain phrase rather than a technical suffix."""
    if operation_id and "/" in operation_id:
        scope = operation_id.split("/", 1)[0]
        return f"{label} ({scope_label(scope)})"
    # No operationId (deprecated ops): the method distinguishes GET/PUT/DELETE variants
    return f"{label} ({METHOD_VERB[method]})"


def clean_description(raw: str, max_len: int = 220) -> str:
    """Turn a raw OpenAPI operation description into short, tooltip-ready UI copy: strip
    markdown links/images, take the first paragraph, and trim to a sentence boundary.

    Vendor guidance (Zapier, Microsoft) treats tooltip text as authored UI copy, not a
    pass-through of API documentation prose — GitHub's raw descriptions carry markdown,
    doc links, and multi-paragraph caveats that read as noise in a hover tooltip.
    """
    if not raw:
        return None
    text = re.sub(r"!\[[^\]]*\]\([^)]*\)", "", raw)  # images
    text = re.sub(r"\[([^\]]*)\]\([^)]*\)", r"\1", text)  # [text](url) -> text
    text = re.sub(r"https?://\S+", "", text)
    text = re.sub(r"\*\*([^*]+)\*\*", r"\1", text)  # **bold** -> bold
    text = re.sub(r"(?<!\w)_([^_]+)_(?!\w)", r"\1", text)  # _italic_ -> italic
    paragraphs = [p.strip() for p in re.split(r"\n\s*\n", text) if p.strip()]
    # Skip a leading "Note:"/"Deprecation Notice:" callout paragraph in favor of the actual
    # description, unless it's the only paragraph
    body = next((p for p in paragraphs if not re.match(r"^(Note|Deprecation Notice):", p)),
                paragraphs[0] if paragraphs else "")
    body = re.sub(r"\s+", " ", body).strip()
    if len(body) <= max_len:
        return body
    truncated = body[:max_len]
    sentence_end = max(truncated.rfind(". "), truncated.rfind(".\n"))
    if sentence_end > max_len * 0.4:
        return truncated[: sentence_end + 1]
    last_space = truncated.rfind(" ")
    return truncated[:last_space].rstrip(",;:") + "…"


def main() -> None:
    ops = json.loads(METADATA.read_text())

    # Task-oriented taxonomy: replace raw REST-path groups with user-facing categories
    for op in ops:
        group, subgroup = taxonomy.classify(op["method"], op["path"])
        op["group"] = group
        op["subgroup"] = subgroup

    operations = {}
    for op in ops:
        deprecated = op["operationId"] is None
        key = op["operationId"] or f"{op['method']} {op['path']}"
        label = op["label"]
        if "/" in label or "{}" in label:  # no doc comment or spec summary matched
            label = fallback_label(op["method"], op["path"])
        entry = {
            "method": op["method"],
            "path": op["path"],
            "label": label,
            "group": op["group"],
            "actionTags": op["actionTags"],
        }
        if op.get("operationId"):
            entry["operationId"] = op["operationId"]
        if op.get("subgroup"):
            entry["subgroup"] = op["subgroup"]
        if op.get("description"):
            entry["description"] = clean_description(op["description"])
        for field in ("docsUrl", "recommended", "rank", "hint"):
            if op.get(field):
                entry[field] = op[field]
        keywords = list(op.get("keywords") or [])
        if op.get("operationId"):
            keywords.append(op["operationId"])
        if keywords:
            entry["keywords"] = keywords
        if deprecated:
            entry["deprecated"] = True
        operations[key] = entry

    # Resolve label collisions (same phrase landing in the same palette folder) with a
    # parenthetical API-scope suffix, e.g. "List organization secrets (Actions)"
    name_counts = Counter(e["label"] for e in operations.values())
    collisions = 0
    for key, entry in operations.items():
        if name_counts[entry["label"]] > 1:
            entry["label"] = disambiguate_label(entry["label"], entry.get("operationId"),
                                                entry["method"], entry["path"])
            collisions += 1
    residual = [n for n, c in Counter(e["label"] for e in operations.values()).items() if c > 1]
    print(f"labels: {collisions} collisions disambiguated, {len(residual)} residual duplicates")
    if residual:
        for n in residual[:10]:
            dups = [k for k, e in operations.items() if e["label"] == n]
            print(f"  DUP {n}: {dups}")

    group_counts = Counter(op["group"] for op in ops)
    groups = []
    for name, description in taxonomy.GROUPS:
        count = group_counts.get(name, 0)
        if count == 0:
            continue
        g = {"name": name, "label": name, "description": description, "operations": count}
        sub_counts = Counter(op["subgroup"] for op in ops if op["group"] == name and op["subgroup"])
        if sub_counts:
            declared = taxonomy.SUBGROUP_ORDER.get(name, [])
            ordered = [s for s in declared if s in sub_counts]
            ordered += [s for s in sub_counts if s not in ordered]
            g["subgroups"] = [
                {
                    "name": s,
                    "label": s,
                    "description": taxonomy.SUBGROUP_DESCRIPTIONS.get((name, s), ""),
                    "operations": sub_counts[s],
                }
                for s in ordered
            ]
        groups.append(g)

    common_tasks = [
        op["operationId"]
        for op in sorted(
            (o for o in ops if o.get("recommended")), key=lambda o: o.get("rank", 999)
        )
    ]

    schema = {
        "schemaVersion": "1.0",
        "connector": "github",
        "commonTasks": common_tasks,
        "groups": groups,
        "operations": operations,
    }
    OUTPUT.write_text(json.dumps(schema, indent=2) + "\n")
    dep = sum(1 for o in operations.values() if o.get("deprecated"))
    print(
        f"{len(operations)} operations, {len(groups)} groups, "
        f"{len(common_tasks)} common tasks, {dep} deprecated -> {OUTPUT.relative_to(ROOT)}"
    )


if __name__ == "__main__":
    main()
