# Composite Operations — Verdict

**Status: explored, not recommended.** This branch (`option-c-composite`, published as
`daneshk/githubx` on Central) is kept as a feasibility reference, not the pilot's active
recommendation. The recommendation for the Option C pilot is `option-c-metadata`
(`daneshk/github`) on its own.

## Why

**No vendor precedent.** Checked against Zapier, Microsoft Power Platform, Make, n8n,
Workato, MuleSoft, Boomi, and UiPath (see the research memo). Workato is the closest
comparison — it also auto-generates connectors from OpenAPI specs — and its answer is to
classify every operation into one of ~7 fixed action types (Create record, Search
records, etc.), each still mapping to exactly **one** underlying API call. Every vendor
checked curates and relabels individual operations; none compose multiple API calls into
a single action as standard practice. Building composites here would mean inventing a
pattern no competitor has validated, not catching up to one.

**Mostly a GitHub-specific quirk, not a generalizable pattern.** Of the 7 composites
built:
- `upsertFileContent` and `branchFromDefault` exist because GitHub's REST API genuinely
  requires an extra lookup call first (a file's SHA, a branch's commit SHA) — a real
  limitation of *this* API, not evidence other connectors need the same treatment.
- `getFullCiStatus` merges two systems that are fragmented for historical reasons
  specific to GitHub (legacy commit statuses vs. the newer Checks API).
- `mergeAndDeleteBranch`, `createWebhookAndVerify`, `ensureLabelExists`,
  `createDeploymentWithStatus` are workflow conveniences we chose to fuse, not cases
  the raw API forces into two calls — the weakest justification of the seven.

**Effort was high for a narrow, unvalidated benefit.** Delivering this required a real
architectural change (has-a wrapper over a generated `oas` submodule), discovering and
working around a genuine Ballerina compiler limitation (38 of 870 operations can't be
delegated via resource-access syntax due to literal/parameter path ambiguity), and new
hand-maintained code with its own compile-time drift protection. That's a meaningfully
bigger investment than the metadata-only pilot, for a feature no competitor offers and
that end users never asked for.

**End-user framing was also wrong.** A composite operation should look like any other
operation to a low-code user — the fact that it happens to make two HTTP calls
internally is an implementation detail, not something worth a distinct "Composite
Operations" UI section. If composites are ever revisited, they should not be visually
distinguished from regular operations.

## What's still true and working here

- The has-a wrapper architecture is real and compiles/tests clean (12/12 mock tests
  passing, including all 7 composites end-to-end).
- The generated `oas` submodule pattern (100% `bal openapi` output, script-generated
  delegating wrapper) is a legitimate alternative to the single-file generated client,
  independent of whether composites are worth adding on top of it.
- `daneshk/githubx:1.0.0` stays published on Central for anyone who wants to inspect it
  directly.

## If this comes up again

Don't restart from scratch — the discovered Ballerina limitations (path ambiguity,
`Cloneable`/`anydata` cast quirks, escaped-identifier field access) and the has-a wrapper
generator (`scripts/generate_wrapper_client.py`) are still valid reference material even
if composites specifically aren't pursued.
