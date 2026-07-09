#!/usr/bin/env python3
"""
Applies docs/spec/overlay.yaml to docs/spec/openapi.json.

Run this after 'bal openapi flatten' and before 'bal openapi align' and code generation
to inject missing descriptions into the spec without editing it directly.

Usage:
    python scripts/apply_overlay.py
"""

import json
import os
import re
import yaml

SPEC_PATH = os.path.join(os.path.dirname(__file__), "../docs/spec/openapi.json")
OVERLAY_PATH = os.path.join(os.path.dirname(__file__), "../docs/spec/overlay.yaml")


def load_spec():
    with open(SPEC_PATH) as f:
        return json.load(f)


def save_spec(spec):
    with open(SPEC_PATH, "w") as f:
        json.dump(spec, f, indent=2)


def load_overlay():
    with open(OVERLAY_PATH) as f:
        return yaml.safe_load(f)


def resolve_path(spec, parts):
    """Walk the spec dict following a list of key parts. Returns (parent, last_key) or (None, None)."""
    node = spec
    for part in parts[:-1]:
        if not isinstance(node, dict) or part not in node:
            return None, None
        node = node[part]
    last = parts[-1]
    if not isinstance(node, dict) or last not in node:
        return None, None
    return node, last


def parse_target(target):
    """
    Parse a JSONPath-style target like:
        $.components.schemas.Foo.properties.bar
    Returns a list of path segments. Handles dot-notation only.
    """
    if target.startswith("$."):
        target = target[2:]
    elif target.startswith("$"):
        target = target[1:]
    return target.split(".")


def apply_action(spec, action):
    """Apply a single overlay action to the spec. Returns True if applied."""
    target = action.get("target", "")
    update = action.get("update", {})

    parts = parse_target(target)
    if not parts:
        return False

    parent, last_key = resolve_path(spec, parts)
    if parent is None:
        return False

    prop = parent[last_key]

    # In OpenAPI 3.0, description cannot sit alongside $ref on the same object
    # (the $ref replaces the entire object). Wrap pure $ref properties in allOf
    # so the description is valid and picked up by code generators.
    if "$ref" in prop and set(prop.keys()) <= {"$ref", "x-ballerina-name"}:
        ref = prop.pop("$ref")
        prop["allOf"] = [{"$ref": ref}]

    prop.update(update)
    return True


def strip_backtick_refs(spec):
    """
    Remove backtick-quoted words from all description strings in the spec.
    Ballerina's doc comment parser treats `word` as a type reference and warns
    when the type doesn't exist. Replacing `word` with just word avoids these
    'invalid reference in documentation' warnings in the generated code.
    """
    count = 0

    def clean(obj):
        nonlocal count
        if isinstance(obj, dict):
            for key, val in obj.items():
                if key == "description" and isinstance(val, str):
                    cleaned = re.sub(r"`([^`]+)`", r"\1", val)
                    if cleaned != val:
                        obj[key] = cleaned
                        count += 1
                else:
                    clean(val)
        elif isinstance(obj, list):
            for item in obj:
                clean(item)

    clean(spec)
    return count


def apply_path_param_actions(spec, path_params):
    """
    Apply descriptions to inline path/query parameters that have no description.
    Each entry: {path, method, param, description}
    """
    applied = 0
    skipped = 0
    for entry in path_params:
        path = entry.get("path", "")
        method = entry.get("method", "").lower()
        param_name = entry.get("param", "")
        description = entry.get("description", "")

        op = spec.get("paths", {}).get(path, {}).get(method)
        if not isinstance(op, dict):
            skipped += 1
            continue

        matched = False
        for param in op.get("parameters", []):
            if isinstance(param, dict) and param.get("name") == param_name:
                if "description" not in param:
                    param["description"] = description
                    applied += 1
                matched = True
                break

        if not matched:
            skipped += 1

    return applied, skipped


def main():
    if not os.path.exists(OVERLAY_PATH):
        print(f"Overlay file not found: {OVERLAY_PATH}")
        print("Run 'python scripts/generate_field_docs.py' first.")
        return

    print("Loading spec...")
    spec = load_spec()

    print("Loading overlay...")
    overlay = load_overlay()
    actions = overlay.get("actions", [])
    print(f"Overlay contains {len(actions)} actions.")

    applied = 0
    skipped = 0
    for action in actions:
        if apply_action(spec, action):
            applied += 1
        else:
            skipped += 1

    path_params = overlay.get("path_params", [])
    if path_params:
        pp_applied, pp_skipped = apply_path_param_actions(spec, path_params)
        print(f"Path param actions: applied {pp_applied}, skipped {pp_skipped}.")

    cleaned = strip_backtick_refs(spec)
    print(f"Stripped backtick references from {cleaned} descriptions.")

    save_spec(spec)
    print(f"Done. Applied {applied} schema actions, skipped {skipped} (target not found in spec).")


if __name__ == "__main__":
    main()
