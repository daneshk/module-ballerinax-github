#!/usr/bin/env python3
"""Add the hand-written composite operations to ui-schema.json with the highest
priority tier (above the existing recommended-20), and mark them "composite": true
so they can be visually distinguished later. Uses the existing recommended+rank
pinning mechanism already supported by the language server - no LS code change
needed, composites just get lower rank numbers than everything else.

Run after generate_ui_schema.py, against the daneshk/githubx (option-c-composite)
branch's ui-schema.json.
"""

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SCHEMA = ROOT / "ballerina" / "ui-schema.json"

# operationId, method, path, label, group, subgroup, actionTags, description
COMPOSITES = [
    ("composite/upsert-file-content", "POST", "repos/{}/{}/upsert-file-content",
     "Create or update file content (auto-detect)", "Files & Content", None, ["create", "update"],
     "Creates a new file, or updates it if it already exists - resolves the required "
     "SHA automatically instead of surfacing a 409 conflict to the caller."),
    ("composite/branches-from-default", "POST", "repos/{}/{}/branches-from-default",
     "Create a branch from the default branch", "Branches & Commits", "Branches", ["create"],
     "Creates a new branch from the tip of the repository's default branch, resolving "
     "the base branch name and its current commit SHA automatically."),
    ("composite/merge-and-delete-branch", "POST", "repos/{}/{}/pulls/{}/merge-and-delete-branch",
     "Merge a pull request and delete its branch", "Pull Requests", "General", ["update", "delete"],
     "Merges a pull request and deletes its source branch in one step - the two "
     "operations most PR workflows always perform together."),
    ("composite/full-ci-status", "GET", "repos/{}/{}/commits/{}/full-ci-status",
     "Get full CI status (statuses + checks combined)", "Branches & Commits", "Checks", ["read"],
     "Combines GitHub's two independent CI status systems - legacy commit statuses and "
     "the Checks API - into one result, since a commit may report through either or both."),
    ("composite/ensure-label", "POST", "repos/{}/{}/issues/{}/ensure-label",
     "Ensure a label exists and apply it", "Issues", "Labels", ["create", "update"],
     "Creates a label if it doesn't already exist on the repository, then applies it "
     "to an issue or pull request in one step."),
    ("composite/webhooks-verified", "POST", "repos/{}/{}/webhooks-verified",
     "Create a webhook and verify delivery", "Repositories", "Webhooks", ["create"],
     "Creates a repository webhook and immediately sends it a ping to verify delivery, "
     "instead of leaving verification as a separate manual step."),
    ("composite/deployments-with-status", "POST", "repos/{}/{}/deployments-with-status",
     "Create a deployment with initial status", "CI/CD (Actions)", "Deployments & Environments", ["create"],
     "Creates a deployment and immediately sets its initial status - a deployment with "
     "no status is not meaningfully usable, so this is effectively always two calls."),
]


def main() -> None:
    schema = json.loads(SCHEMA.read_text())

    # Shift every existing rank down to make room for composites at 1..7
    for op in schema["operations"].values():
        if op.get("rank") is not None:
            op["rank"] = op["rank"] + len(COMPOSITES)

    composite_ids = []
    for rank, (op_id, method, path, label, group, subgroup, tags, desc) in enumerate(COMPOSITES, start=1):
        entry = {
            "method": method,
            "path": path,
            "label": label,
            "group": group,
            "actionTags": tags,
            "operationId": op_id,
            "description": desc,
            "recommended": True,
            "rank": rank,
            "composite": True,
        }
        if subgroup:
            entry["subgroup"] = subgroup
        schema["operations"][op_id] = entry
        composite_ids.append(op_id)

    schema["commonTasks"] = composite_ids + schema["commonTasks"]

    SCHEMA.write_text(json.dumps(schema, indent=2) + "\n")
    print(f"Added {len(COMPOSITES)} composite operations at rank 1-{len(COMPOSITES)}, "
          f"shifted {len(schema['operations']) - len(COMPOSITES)} existing ranks down.")


if __name__ == "__main__":
    main()
