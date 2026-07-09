# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Ballerina REST API connector for the GitHub REST API (v2022-11-28). Most connector code (`ballerina/client.bal`, `ballerina/types.bal`) is **auto-generated** from the OpenAPI spec at `docs/spec/openapi.json`. The spec must be flattened and aligned before generating:

```bash
# 1. Flatten inline schemas into components section
bal openapi flatten -i docs/spec/openapi.json
mv flattened_openapi.json docs/spec/openapi.json

# 2. Align naming to Ballerina conventions
bal openapi align -i docs/spec/openapi.json
mv aligned_ballerina_openapi.json docs/spec/openapi.json

# 3. Apply overlay AFTER align (align strips descriptions from $ref props; overlay re-adds them)
python scripts/apply_overlay.py

# 4. Generate the client
bal openapi -i docs/spec/openapi.json --mode client --license docs/license.txt -o ballerina
```

Manually edit the spec and regenerate rather than editing generated files directly. After regeneration, update any manually-written test files if request body type names changed. Modifications to the spec are documented in `docs/spec/Sanitations.md`.

Missing property descriptions live in `docs/spec/overlay.yaml` — do **not** add them directly to `openapi.json`. To generate descriptions for newly undocumented properties after a spec update, run `ANTHROPIC_API_KEY=<key> python scripts/generate_field_docs.py`, then re-apply the overlay.

## Build & Test Commands

```bash
# Full build
./gradlew clean build

# Build without tests
./gradlew clean build -x test

# Run mock tests only (no external dependencies, uses local mock service on port 9090)
./gradlew clean test -Pgroups=mock_tests

# Run live tests (requires real GitHub PAT)
./gradlew clean test -Pgroups=live_tests
```

For live tests, set environment variables: `ACCESS_TOKEN`, `ORG_NAME`, `REPO_NAME`, `REPO_ID`, `USER_NAME`.

## Architecture

```
ballerina/
  client.bal        # Auto-generated GitHub API client (resource-based)
  types.bal         # Auto-generated type definitions
  utils.bal         # Query param serialization, URI encoding helpers
  tests/
    test.bal        # Test suite (~50 tests, uses configurable isLiveServer flag)
    mock_service.bal # Mock HTTP service on port 9090 for local testing
examples/           # Four standalone example Ballerina projects
docs/spec/
  openapi.json      # GitHub OpenAPI spec (modified for Ballerina compatibility)
  overlay.yaml      # Missing property descriptions applied before code generation
  Sanitations.md    # Documents customizations made to the OpenAPI spec
scripts/
  generate_field_docs.py  # Uses Claude API to populate overlay.yaml with missing descriptions
  apply_overlay.py        # Applies overlay.yaml to openapi.json before codegen
```

## Test Structure

Tests use a configurable flag to switch between mock and live:

```ballerina
configurable boolean isLiveServer = false;
configurable string serviceUrl = isLiveServer ? "https://api.github.com" : "http://localhost:9090";
```

Tests are organized into groups (`mock_tests`, `live_tests`) via `@test:Config` annotations. Some tests use `dependsOn` to enforce ordering (e.g., create → update → delete flows).

## Key Conventions

- **camelCase record fields** with `@jsondata:Name` annotations for JSON mapping (introduced in v6.0.0)
- **Resource-based client syntax**: `github->/repos/[owner]/[repo]` style paths
- The connector uses token-based auth (GitHub PAT) passed via `ConnectionConfig`
- Build subprojects: `github-ballerina` (main connector) and `github-examples`

## Running Examples

Each example under `examples/` requires a `config.toml`:
```toml
authToken = "<GITHUB_PAT>"
```

Then run with `bal run` from the example directory.
