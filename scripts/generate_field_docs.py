#!/usr/bin/env python3
"""
Uses Claude API to generate meaningful descriptions for OpenAPI schema properties
that are missing descriptions. Writes results to an overlay file instead of
patching the spec in place.

Run this once (or after a spec update) to populate docs/spec/overlay.yaml.
Then run apply_overlay.py before code generation to apply the descriptions.
"""

import argparse
import json
import os
import sys
import time
import yaml
import anthropic

SPEC_PATH = os.path.join(os.path.dirname(__file__), "../docs/spec/openapi.json")
OVERLAY_PATH = os.path.join(os.path.dirname(__file__), "../docs/spec/overlay.yaml")
MODEL = "claude-sonnet-4-6"
DEFAULT_BATCH_SIZE = 30  # schemas per API call


def load_spec():
    with open(SPEC_PATH) as f:
        return json.load(f)


def load_overlay():
    """Load existing overlay or return a fresh structure."""
    if os.path.exists(OVERLAY_PATH):
        with open(OVERLAY_PATH) as f:
            return yaml.safe_load(f) or {}
    return {
        "overlay": "1.0.0",
        "info": {
            "title": "GitHub API Missing Descriptions Overlay",
            "version": "1.0.0",
        },
        "actions": [],
    }


def save_overlay(overlay):
    with open(OVERLAY_PATH, "w") as f:
        yaml.dump(overlay, f, default_flow_style=False, allow_unicode=True, sort_keys=False)
    print("Overlay saved.")


def get_existing_targets(overlay):
    """Return set of JSONPath targets already recorded in the overlay."""
    return {action["target"] for action in overlay.get("actions", [])}


def collect_undocumented(spec, skip_targets=None):
    """Return (schema_name, prop_name) pairs missing descriptions, excluding known targets."""
    skip_targets = skip_targets or set()
    missing = []
    for schema_name, schema in spec["components"]["schemas"].items():
        for prop_name, prop in schema.get("properties", {}).items():
            target = f"$.components.schemas.{schema_name}.properties.{prop_name}"
            if "description" not in prop and target not in skip_targets:
                missing.append((schema_name, prop_name))
    return missing


def build_schema_batches(spec, missing_pairs, batch_size):
    """Group missing pairs by schema, then batch schemas together."""
    by_schema = {}
    for schema_name, prop_name in missing_pairs:
        by_schema.setdefault(schema_name, []).append(prop_name)

    schema_names = list(by_schema.keys())
    batches = []
    for i in range(0, len(schema_names), batch_size):
        batch_schemas = schema_names[i : i + batch_size]
        batch = {}
        for sname in batch_schemas:
            schema = spec["components"]["schemas"][sname]
            props_summary = {}
            for pname, prop in schema.get("properties", {}).items():
                ptype = prop.get("type") or (
                    "$ref: " + prop["$ref"].split("/")[-1]
                    if "$ref" in prop
                    else (
                        "allOf: " + prop["allOf"][0]["$ref"].split("/")[-1]
                        if "allOf" in prop and "$ref" in prop["allOf"][0]
                        else "object"
                    )
                )
                entry = {"type": ptype}
                if "description" in prop:
                    entry["description"] = prop["description"]
                if "enum" in prop:
                    entry["enum"] = prop["enum"]
                props_summary[pname] = entry
            batch[sname] = {
                "description": schema.get("description", ""),
                "properties": props_summary,
                "needs_description": by_schema[sname],
            }
        batches.append(batch)
    return batches


def generate_descriptions(client, batch):
    """Call Claude to generate descriptions for all missing fields in the batch."""
    prompt = f"""You are documenting a GitHub REST API client library. Below is a JSON object where each key is an OpenAPI schema name, containing:
- "description": the schema-level description (may be empty)
- "properties": all fields with their types and any existing descriptions
- "needs_description": the list of property names that are missing descriptions

For each property in "needs_description", generate a concise, accurate description (1 sentence, max 15 words) based on the field name, type, enum values, and schema context. Use GitHub API domain knowledge where helpful.

Return ONLY a JSON object in this exact format:
{{
  "SchemaName": {{
    "propertyName": "Description text here."
  }}
}}

Include only schemas/properties from "needs_description". No extra text.

Input:
{json.dumps(batch, indent=2)}
"""

    response = client.messages.create(
        model=MODEL,
        max_tokens=8192,
        messages=[{"role": "user", "content": prompt}],
    )
    text = response.content[0].text.strip()
    if text.startswith("```"):
        text = text.split("\n", 1)[1]
        text = text.rsplit("```", 1)[0]
    return json.loads(text)


def build_overlay_actions(descriptions):
    """Convert generated descriptions into overlay action entries."""
    actions = []
    for schema_name, props in descriptions.items():
        for prop_name, desc in props.items():
            target = f"$.components.schemas.{schema_name}.properties.{prop_name}"
            actions.append({"target": target, "update": {"description": desc}})
    return actions


def main():
    parser = argparse.ArgumentParser(description="Generate missing OpenAPI descriptions into an overlay file.")
    parser.add_argument("--batch-size", type=int, default=DEFAULT_BATCH_SIZE,
                        help=f"Number of schemas per API call (default: {DEFAULT_BATCH_SIZE}). Reduce if hitting JSON parse errors.")
    args = parser.parse_args()

    api_key = os.environ.get("ANTHROPIC_API_KEY")
    if not api_key:
        print("Error: ANTHROPIC_API_KEY environment variable not set.")
        sys.exit(1)

    client = anthropic.Anthropic(api_key=api_key)

    print("Loading spec...")
    spec = load_spec()

    print("Loading existing overlay...")
    overlay = load_overlay()
    existing_targets = get_existing_targets(overlay)
    print(f"Overlay already has {len(existing_targets)} documented properties.")

    print("Collecting undocumented properties (excluding already overlaid)...")
    missing = collect_undocumented(spec, skip_targets=existing_targets)
    print(f"Found {len(missing)} properties still missing descriptions.")

    if not missing:
        print("Nothing to do.")
        return

    batches = build_schema_batches(spec, missing, args.batch_size)
    print(f"Processing {len(batches)} batches of up to {args.batch_size} schemas each...")

    total_added = 0
    for i, batch in enumerate(batches):
        schema_count = len(batch)
        prop_count = sum(len(v["needs_description"]) for v in batch.values())
        print(
            f"  Batch {i+1}/{len(batches)}: {schema_count} schemas, {prop_count} properties...",
            end=" ",
            flush=True,
        )

        try:
            descriptions = generate_descriptions(client, batch)
            new_actions = build_overlay_actions(descriptions)
            overlay["actions"].extend(new_actions)
            total_added += len(new_actions)
            print(f"added {len(new_actions)} actions.")
        except Exception as e:
            print(f"ERROR: {e}")
            print("  Saving overlay progress and continuing...")
            save_overlay(overlay)
            time.sleep(5)
            continue

        if (i + 1) % 10 == 0:
            save_overlay(overlay)
            print(f"  Progress saved ({total_added} actions added so far).")

    print(f"\nDone. Added {total_added} overlay actions.")
    save_overlay(overlay)
    print(f"Total overlay actions: {len(overlay['actions'])}")
    print(f"Run 'python scripts/apply_overlay.py' to apply to the spec.")


if __name__ == "__main__":
    main()
