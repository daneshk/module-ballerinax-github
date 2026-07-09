# Option C Pilot — Low-Code UX Improvements for `ballerinax/github`

**Local checkout:** `/Users/danesh/ballerina-connectors/module-ballerinax-github`

**Purpose of this doc:** Handoff brief for Claude Code to prototype Option C (smarter
single-client UX — grouping, tagging, ranking, search, tooltips) on the GitHub
connector, so we can assess feasibility before committing the direction ecosystem-wide.

**Context:** We have 500+ Ballerina connectors, some exposing 100+ operations from a
single client. This is fine for pro-code but hard to navigate for low-code users, who
struggle to find the right operation in a flat list and often can't tell similar
operations apart. We considered a second "basic" client (Option B) but rejected it — it
recreates a public two-client choice that risks confusing Integrator Copilot's code
generation. We are pursuing **Option C**: keep one public client, improve
discoverability through metadata, grouping, ranking, search, and tooltips. No new
operations, no composite functions in this phase — this pilot is scoped to discovery/
selection only, not task-chaining.

---

## 1. Verified numbers for this connector (already confirmed — do not re-derive)

- **903 total operations** (`resource isolated function`), verified via:
  ```bash
  grep -cE "^\s*resource isolated function" ballerina/client.bal
  ```
- HTTP method breakdown: 480 GET, 146 POST, 143 DELETE, 83 PUT, 51 PATCH.
- Top-level resource groups (by first path segment):

  | Group | Operations |
  |---|---|
  | `repos` | 421 |
  | `orgs` | 200 |
  | `user` | 93 |
  | `users` | 34 |
  | `teams` | 34 |
  | `projects` | 19 |
  | `gists` | 19 |
  | `app` | 13 |
  | `repositories`, `search`, `notifications`, `marketplace_listing`, `applications` | ≤11 each |
  | long tail (`classrooms`, `markdown`, `licenses`, `gitignore`, `enterprises`, etc.) | 1-3 each |

- **`repos` (421 ops) is too large to be a flat group** — needs a second tier. Breakdown
  by second-level path segment under `repos/[owner]/[repo]/...`:

  | Sub-group | Operations |
  |---|---|
  | `actions` | 72 |
  | `branches` | 35 |
  | `pulls` | 29 |
  | `issues` | 28 |
  | `releases` | 14 |
  | `git` | 13 |
  | `environments` | 13 |
  | `code-scanning` | 13 |
  | `hooks` | 10 |
  | `commits` | 9 |
  | `codespaces` | 9 |
  | `dependabot` | 8 |
  | `pages`, `comments` | 6 each |
  | `stats`, `rulesets`, `deployments` | 5 each |
  | long tail (`traffic`, `security-advisories`, `secret-scanning`, `milestones`,
    `collaborators`, `check-suites`, `check-runs`, `tags`, `labels`,
    `dependency-graph`, `contents`, etc.) | 3-4 each |

  `orgs` (200 ops) likely needs the same second-tier treatment — not yet broken down,
  do this first in the pilot (same technique: split second path segment after `orgs/[org]/`).

## 2. Schema decision: two-tier grouping (revised from earlier single-level plan)

The original `@display.group` field (single string) doesn't work for this connector —
`group: "repos"` alone would still show 421 operations. Use `group` + `subgroup`:

```ballerina
@display {
    label: "List pull requests",
    group: "repos",
    subgroup: "pulls",
    actionTags: ["read"],
    rank: 3,
    recommended: false,
    keywords: ["list PRs", "view pull requests"]
}
resource isolated function get repos/[string owner]/[string repo]/pulls(...) returns PullRequest[]|error {
    ...
}
```

Palette rendering implication: top level shows `group` (repos, orgs, user...) with
counts; expanding a group with a large count (repos, orgs) shows `subgroup` folders
(pulls, issues, actions...) instead of a flat operation list; small groups (gists,
teams, app) can skip the subgroup level and show operations directly.

## 3. Auto-derivation rules (confirmed against real code — these work cleanly here)

This connector is OpenAPI-generated with `resource isolated function` signatures that
directly encode HTTP method and path — auto-derivation is straightforward, no GraphQL
naming-convention workaround needed (that was a wrong assumption in an earlier pass of
this discussion — this connector is REST-based, verified against `ballerina/client.bal`
directly).

| Signal | Derives |
|---|---|
| `resource isolated function get ...` | `action: read` (or `search` if the path is `/search/...` or takes filter query params) |
| `resource isolated function post ...` | `action: create` |
| `resource isolated function put ...` | `action: update` |
| `resource isolated function patch ...` | `action: update` |
| `resource isolated function delete ...` | `action: delete` |
| First path segment (`repos`, `orgs`, `user`, `teams`, `gists`...) | `group` |
| Second path segment after owner/repo or org placeholder | `subgroup` (only for large groups: `repos`, `orgs`) |

Extraction technique already validated:
```bash
grep -E "^\s*resource isolated function" ballerina/client.bal \
  | sed -E 's/^\s*resource isolated function (get|post|put|patch|delete) //' \
  | sed -E 's/\[string [a-zA-Z]+\]/{}/g; s/\[int [a-zA-Z]+\]/{}/g'
```
This produces clean, bracket-normalized path strings suitable for scripted parsing.

## 4. Scope for this pilot — discovery/selection only

**Do not add composite operations in this phase.** Earlier discussion considered
composite/orchestrated operations (e.g. multi-step task wrappers) to solve a *different*
problem (task-chaining), but the immediate, higher-priority problem is discovery/
selection — "100+ operations, I don't know which one to pick." Composites would also
increase the client's total operation count, working against that goal unless
rigorously scoped — so they're explicitly out of scope until grouping/ranking/search is
shipped and evaluated on its own.

This phase is pure metadata + palette UI:
1. Two-tier grouping (`group` + `subgroup`)
2. Ranking (`rank` field, manual for now)
3. `recommended: true` flag for a "Common tasks" section (~15-20 ops across the whole
   connector, not per group — pick genuinely high-frequency GitHub actions: create
   issue, list issues, create PR, merge PR, get repo, list commits, add comment, create
   release, etc.)
4. `actionTags` for filter chips (create/read/update/delete)
5. `keywords` for search matching
6. Tooltip/hint text for operations that look similar (e.g. `merge pull request` vs
   `update pull request` vs `close pull request` — GitHub's `pulls` subgroup likely has
   several of these worth disambiguating)

## 5. The risk to explicitly test in this pilot

Adding metadata doesn't grow the client's method count (good — this was a specific
concern raised and resolved: metadata-only changes are purely additive annotations,
zero new operations, zero Copilot ambiguity). But the UX win only holds if grouping is
actually consumed everywhere operations are listed. Check for this connector:

- [ ] Does the editor's palette currently read `@display` at all, or only `label`?
      This determines whether Track B (editor side) is "extend existing parsing" or
      "build grouping UI from scratch."
- [ ] Generated API docs — flat list or do they respect any existing structure?
- [ ] IDE autocomplete (pro-code) — 903 entries either way; confirm this pilot doesn't
      change pro-code experience (it shouldn't — metadata is additive).
- [ ] Copilot's context/tool description — does it consume `@display` grouping, or see
      all 903 operations flat regardless of what the palette shows?

## 6. Task list for Claude Code

Run these in `/Users/danesh/ballerina-connectors/module-ballerinax-github`.

1. **Confirm current `@display` usage** — check what fields the editor/tooling
   currently reads from existing `@display` annotations in `client.bal` (grep for
   `@display` to see current field usage across the file).
2. **Break down `orgs` (200 ops) by second-level path segment**, same technique as the
   `repos` breakdown above, to complete the subgroup picture before writing the
   derivation script.
3. **Write the auto-derivation script**: parses `client.bal`, extracts HTTP method +
   path per operation, outputs a proposed `group`/`subgroup`/`actionTags` mapping (as a
   CSV or JSON, for review before touching the source file — don't write directly into
   `client.bal` on the first pass).
4. **Manual review pass**: go through the auto-derived mapping, fix any obviously wrong
   groupings (e.g. path segments that are actually IDs/params misread as resource
   names), flag ~15-20 `recommended: true` operations, write `keywords` for those, and
   identify 3-5 look-alike operation clusters (e.g. within `pulls` or `issues`) that
   need a disambiguating hint/tooltip.
5. **Apply metadata to `client.bal`** (or wherever `@display` lives for this connector),
   run `bal build`, confirm the build is clean and nothing about existing pro-code usage
   changes.
6. **Coordinate with the editor team** (separate track — identify who owns the
   Integrator low-code palette rendering) to confirm what's needed on their side to
   consume `group`/`subgroup`/`actionTags`/`rank`/`recommended`/`keywords`. This can
   proceed in parallel with steps 1-5.
7. **Write up findings**: did the two-tier grouping actually reduce perceived
   complexity in a mocked-up palette view? Any groups that still feel too large even
   with subgroups (e.g. does `repos/actions` at 72 need a third tier)? Any auto-
   derivation misses that needed manual correction, and how many (signal for how well
   this scales to the other 499 connectors)?

## 7. Open questions to carry into the stakeholder meeting

- Does `repos/actions` (72 ops) need a third grouping tier, or does ranking within a
  72-item subgroup suffice? (Test both in the pilot if time allows.)
- Where does the `recommended` set get decided going forward — per-connector owner
  judgment, or a lightweight review process, so it doesn't drift into "everyone marks
  their favorite operation as recommended"?
- Once this pilot ships and is evaluated, is there still a case for composite
  operations for genuine multi-step GitHub workflows (e.g. create issue + add labels +
  assign)? Revisit only after discovery/selection is proven out — not before.
