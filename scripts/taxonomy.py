"""Task-oriented palette taxonomy for the GitHub connector.

Maps each operation (method + normalized path) to a user-facing (group, subgroup) pair,
replacing the raw REST-path-derived grouping (repos/orgs/user/...) with categories a
low-code integration developer would look for ("Pull Requests", "CI/CD", "Code Security").

classify() is rule-based on the non-parameter path segments; GROUPS defines display
order, labels, and descriptions.
"""

# Display order, label, description. Subgroups render as nested folders only where defined
# (encounter order of operations is preserved within).
GROUPS = [
    ("Repositories", "Create and manage repositories, access, webhooks, and insights"),
    ("Issues", "Create, update, comment on, and organize issues"),
    ("Pull Requests", "Create, review, and merge pull requests"),
    ("Branches & Commits", "Branches, protection rules, commits, and checks"),
    ("Files & Content", "Read and write repository files and archives"),
    ("Releases & Tags", "Publish and manage releases and tags"),
    ("CI/CD (Actions)", "GitHub Actions workflows, runs, secrets, and deployments"),
    ("Code Security", "Code/secret scanning, Dependabot, advisories, and rules"),
    ("Organizations & Teams", "Organization administration, members, and teams"),
    ("Users", "Look up user profiles and their public resources"),
    ("My Account", "The authenticated user's profile, keys, and settings"),
    ("Social & Activity", "Stars, watching, notifications, and event feeds"),
    ("Search", "Search repositories, issues, code, and users"),
    ("Gists", "Create and manage gists"),
    ("Codespaces", "Manage codespaces for repositories, organizations, and yourself"),
    ("Packages", "GitHub Packages for organizations and users"),
    ("Apps & Marketplace", "GitHub Apps, OAuth apps, and Marketplace"),
    ("Projects (classic)", "Deprecated classic projects API"),
    ("Platform & Misc", "Metadata, migrations, education, and other endpoints"),
]

# Explicit subgroup display order for large groups; None entries (flat groups) list nothing.
SUBGROUP_ORDER = {
    "Repositories": ["Collaborators & Invitations", "Webhooks", "Deploy Keys",
                     "Forks", "Topics & Properties", "Pages", "Insights & Stats", "Moderation"],
    "Issues": ["Comments", "Labels", "Milestones"],
    "Pull Requests": ["Reviews", "Review Comments"],
    "Branches & Commits": ["Branches", "Branch Protection", "Commits", "Commit Comments",
                           "Commit Statuses", "Checks", "Compare & Merge", "Git Database"],
    "CI/CD (Actions)": ["Workflows", "Workflow Runs", "Artifacts & Cache", "Secrets & Variables",
                        "Runners", "Permissions & OIDC", "Deployments & Environments"],
    "Code Security": ["Code Scanning", "Secret Scanning", "Dependabot", "Security Advisories",
                      "Dependencies", "Rulesets"],
    "Organizations & Teams": ["Organization", "Members & Invitations", "Teams", "Team Discussions",
                              "Webhooks", "Access Tokens", "Copilot", "Moderation"],
    "My Account": ["Profile", "Keys & Emails", "Memberships", "Moderation"],
    "Platform & Misc": ["Meta", "Migrations & Import", "Classroom", "Enterprise"],
}

ACTIONS_SUBGROUPS = {
    "workflows": "Workflows", "runs": "Workflow Runs", "jobs": "Workflow Runs",
    "artifacts": "Artifacts & Cache", "cache": "Artifacts & Cache", "caches": "Artifacts & Cache",
    "secrets": "Secrets & Variables", "variables": "Secrets & Variables",
    "organization-secrets": "Secrets & Variables", "organization-variables": "Secrets & Variables",
    "runners": "Runners", "permissions": "Permissions & OIDC", "oidc": "Permissions & OIDC",
}

SECURITY_SUBGROUPS = {
    "code-scanning": "Code Scanning", "secret-scanning": "Secret Scanning",
    "dependabot": "Dependabot", "security-advisories": "Security Advisories",
    "dependency-graph": "Dependencies", "vulnerability-alerts": "Dependencies",
    "automated-security-fixes": "Dependencies", "private-vulnerability-reporting": "Security Advisories",
    "rulesets": "Rulesets", "rules": "Rulesets", "security-managers": "Rulesets",
}


def _segments(path: str) -> list:
    return [s for s in path.split("/") if s and s != "{}"]


def classify(method: str, path: str):  # noqa: C901
    """Return (group, subgroup-or-None) for an operation."""
    segs = _segments(path)
    if not segs or segs == ["."]:
        return "Platform & Misc", "Meta"
    root = segs[0]
    s1 = segs[1] if len(segs) > 1 else None
    s2 = segs[2] if len(segs) > 2 else None

    if root == "repos":
        if s1 is None:
            return "Repositories", None
        if s1 == "pulls":
            if s2 == "comments" or (s2 is not None and "comments" in segs[2:]):
                return "Pull Requests", "Review Comments"
            if s2 in ("reviews", "requested_reviewers"):
                return "Pull Requests", "Reviews"
            if s2 == "codespaces":
                return "Codespaces", None
            return "Pull Requests", None
        if s1 in ("issues",):
            if s2 == "comments" or "comments" in segs[2:] or "reactions" in segs[2:]:
                return "Issues", "Comments"
            if s2 == "labels":
                return "Issues", "Labels"
            return "Issues", None
        if s1 == "labels":
            return "Issues", "Labels"
        if s1 == "milestones":
            if "labels" in segs[2:]:
                return "Issues", "Labels"
            return "Issues", "Milestones"
        if s1 == "assignees":
            return "Issues", None
        if s1 == "branches":
            if s2 == "protection" or "protection" in segs[2:]:
                return "Branches & Commits", "Branch Protection"
            return "Branches & Commits", "Branches"
        if s1 == "commits":
            if "comments" in segs[2:]:
                return "Branches & Commits", "Commit Comments"
            if "statuses" in segs[2:] or "status" in segs[2:]:
                return "Branches & Commits", "Commit Statuses"
            if "check-runs" in segs[2:] or "check-suites" in segs[2:]:
                return "Branches & Commits", "Checks"
            if "pulls" in segs[2:]:
                return "Pull Requests", None
            return "Branches & Commits", "Commits"
        if s1 == "comments":
            return "Branches & Commits", "Commit Comments"
        if s1 == "statuses":
            return "Branches & Commits", "Commit Statuses"
        if s1 in ("check-runs", "check-suites"):
            return "Branches & Commits", "Checks"
        if s1 in ("compare", "merges", "merge-upstream"):
            return "Branches & Commits", "Compare & Merge"
        if s1 == "git":
            return "Branches & Commits", "Git Database"
        if s1 in ("contents", "readme", "tarball", "zipball", "codeowners", "license", "community"):
            return "Files & Content", None
        if s1 == "releases":
            return "Releases & Tags", None
        if s1 == "tags":
            return "Releases & Tags", None
        if s1 == "actions":
            return "CI/CD (Actions)", ACTIONS_SUBGROUPS.get(s2, "Permissions & OIDC")
        if s1 in ("deployments", "environments"):
            return "CI/CD (Actions)", "Deployments & Environments"
        if s1 == "dispatches":
            return "CI/CD (Actions)", "Workflows"
        if s1 in SECURITY_SUBGROUPS:
            return "Code Security", SECURITY_SUBGROUPS[s1]
        if s1 == "hooks":
            return "Repositories", "Webhooks"
        if s1 == "pages":
            return "Repositories", "Pages"
        if s1 in ("collaborators", "invitations"):
            return "Repositories", "Collaborators & Invitations"
        if s1 == "keys":
            return "Repositories", "Deploy Keys"
        if s1 == "forks":
            return "Repositories", "Forks"
        if s1 in ("topics", "properties", "autolinks", "transfer", "generate"):
            return "Repositories", "Topics & Properties"
        if s1 in ("stats", "traffic", "contributors", "languages", "activity"):
            return "Repositories", "Insights & Stats"
        if s1 == "interaction-limits":
            return "Repositories", "Moderation"
        if s1 in ("stargazers", "subscribers", "subscription", "watchers", "events", "notifications"):
            return "Social & Activity", None
        if s1 == "codespaces":
            return "Codespaces", None
        if s1 == "projects":
            return "Projects (classic)", None
        if s1 == "import":
            return "Platform & Misc", "Migrations & Import"
        if s1 == "installation":
            return "Apps & Marketplace", None
        if s1 == "teams":
            return "Organizations & Teams", "Teams"
        return "Repositories", None

    if root in ("repositories",):
        if s1 == "environments":
            return "CI/CD (Actions)", "Deployments & Environments"
        return "Repositories", None

    if root == "orgs":
        if s1 is None or s1 in ("settings", "docker", "events", "installation", "installations"):
            if s1 in ("installation", "installations"):
                return "Apps & Marketplace", None
            return "Organizations & Teams", "Organization"
        if s1 == "actions":
            return "CI/CD (Actions)", ACTIONS_SUBGROUPS.get(s2, "Permissions & OIDC")
        if s1 == "codespaces":
            return "Codespaces", None
        if s1 == "packages":
            return "Packages", None
        if s1 in SECURITY_SUBGROUPS:
            return "Code Security", SECURITY_SUBGROUPS[s1]
        if s1 == "copilot":
            return "Organizations & Teams", "Copilot"
        if s1 == "teams":
            if s2 == "discussions" or (s2 is not None and "discussions" in segs[2:]):
                return "Organizations & Teams", "Team Discussions"
            return "Organizations & Teams", "Teams"
        if s1 in ("members", "memberships", "invitations", "failed_invitations",
                  "outside_collaborators", "public_members"):
            return "Organizations & Teams", "Members & Invitations"
        if s1 in ("blocks", "interaction-limits"):
            return "Organizations & Teams", "Moderation"
        if s1 == "hooks":
            return "Organizations & Teams", "Webhooks"
        if s1 in ("personal-access-tokens", "personal-access-token-requests"):
            return "Organizations & Teams", "Access Tokens"
        if s1 == "migrations":
            return "Platform & Misc", "Migrations & Import"
        if s1 == "projects":
            return "Projects (classic)", None
        if s1 == "issues":
            return "Issues", None
        return "Organizations & Teams", "Organization"

    if root == "teams":
        if s1 == "discussions" or (s1 is not None and "discussions" in segs[1:]):
            return "Organizations & Teams", "Team Discussions"
        return "Organizations & Teams", "Teams"

    if root == "user":
        if s1 is None or s1 in ("email",):
            return "My Account", "Profile"
        if s1 == "repos":
            return "Repositories", None
        if s1 == "codespaces":
            return "Codespaces", None
        if s1 == "packages":
            return "Packages", None
        if s1 in ("keys", "gpg_keys", "ssh_signing_keys", "emails", "public_emails", "social_accounts"):
            return "My Account", "Keys & Emails"
        if s1 in ("followers", "following", "starred", "subscriptions"):
            return "Social & Activity", None
        if s1 in ("blocks", "interaction-limits"):
            return "My Account", "Moderation"
        if s1 in ("memberships", "orgs", "teams"):
            return "My Account", "Memberships"
        if s1 == "migrations":
            return "Platform & Misc", "Migrations & Import"
        if s1 in ("installations", "marketplace_purchases"):
            return "Apps & Marketplace", None
        if s1 == "issues":
            return "Issues", None
        if s1 == "projects":
            return "Projects (classic)", None
        return "My Account", "Profile"

    if root == "users":
        if s1 == "packages":
            return "Packages", None
        if s1 in ("events", "received_events"):
            return "Social & Activity", None
        if s1 == "gists":
            return "Gists", None
        if s1 in ("installation",):
            return "Apps & Marketplace", None
        if s1 == "projects":
            return "Projects (classic)", None
        if s1 in ("settings", "docker", "suspended"):
            return "Platform & Misc", "Enterprise"
        return "Users", None

    if root == "gists":
        return "Gists", None
    if root == "search":
        return "Search", None
    if root in ("app", "apps", "app-manifests", "applications", "installation", "marketplace_listing"):
        return "Apps & Marketplace", None
    if root in ("notifications", "events", "feeds", "networks"):
        return "Social & Activity", None
    if root == "projects":
        return "Projects (classic)", None
    if root == "issues":
        return "Issues", None
    if root == "organizations":
        return "Organizations & Teams", "Organization"
    if root == "advisories":
        return "Code Security", "Security Advisories"
    if root in ("assignments", "classrooms"):
        return "Platform & Misc", "Classroom"
    if root == "enterprises":
        return "Platform & Misc", "Enterprise"
    if root in ("meta", "octocat", "zen", "emojis", "versions", "rate_limit", "markdown",
                "licenses", "gitignore", "codes_of_conduct"):
        return "Platform & Misc", "Meta"

    return "Platform & Misc", None


# Short helper text shown when a subgroup folder is expanded in the palette.
SUBGROUP_DESCRIPTIONS = {
    ("Repositories", "Collaborators & Invitations"): "Manage who has access to a repository",
    ("Repositories", "Webhooks"): "Repository webhooks for event notifications",
    ("Repositories", "Deploy Keys"): "SSH keys granting deploy access to a repository",
    ("Repositories", "Forks"): "List and create forks",
    ("Repositories", "Topics & Properties"): "Repository topics, custom properties, autolinks, and transfer",
    ("Repositories", "Pages"): "GitHub Pages sites and builds",
    ("Repositories", "Insights & Stats"): "Traffic, contributor, and activity statistics",
    ("Repositories", "Moderation"): "Interaction limits for a repository",
    ("Issues", "Comments"): "Comments and reactions on issues",
    ("Issues", "Labels"): "Create and apply labels",
    ("Issues", "Milestones"): "Group issues into milestones",
    ("Pull Requests", "Reviews"): "Request, submit, and dismiss pull request reviews",
    ("Pull Requests", "Review Comments"): "Inline comments on the pull request diff",
    ("Branches & Commits", "Branches"): "List and rename branches",
    ("Branches & Commits", "Branch Protection"): "Protection rules and required checks for branches",
    ("Branches & Commits", "Commits"): "List and inspect commits",
    ("Branches & Commits", "Commit Comments"): "Comments attached to commits",
    ("Branches & Commits", "Commit Statuses"): "Commit status checks reported by CI tools",
    ("Branches & Commits", "Checks"): "Check runs and check suites",
    ("Branches & Commits", "Compare & Merge"): "Compare refs and merge branches",
    ("Branches & Commits", "Git Database"): "Low-level Git objects: blobs, trees, refs, and tags",
    ("CI/CD (Actions)", "Workflows"): "List, view, enable, and dispatch workflows",
    ("CI/CD (Actions)", "Workflow Runs"): "Runs, jobs, logs, and re-runs",
    ("CI/CD (Actions)", "Artifacts & Cache"): "Build artifacts and the Actions cache",
    ("CI/CD (Actions)", "Secrets & Variables"): "Actions secrets and configuration variables",
    ("CI/CD (Actions)", "Runners"): "Self-hosted and GitHub-hosted runners",
    ("CI/CD (Actions)", "Permissions & OIDC"): "Actions permissions, default workflow settings, and OIDC",
    ("CI/CD (Actions)", "Deployments & Environments"): "Deployments, deployment statuses, and environments",
    ("Code Security", "Code Scanning"): "Code scanning alerts and analyses",
    ("Code Security", "Secret Scanning"): "Secret scanning alerts",
    ("Code Security", "Dependabot"): "Dependabot alerts and secrets",
    ("Code Security", "Security Advisories"): "Repository and global security advisories",
    ("Code Security", "Dependencies"): "Dependency graph, reviews, and vulnerability alerts",
    ("Code Security", "Rulesets"): "Repository and organization rulesets",
    ("Organizations & Teams", "Organization"): "View and update organization settings",
    ("Organizations & Teams", "Members & Invitations"): "Organization membership and invitations",
    ("Organizations & Teams", "Teams"): "Create and manage teams and their repositories",
    ("Organizations & Teams", "Team Discussions"): "Team discussion posts and comments",
    ("Organizations & Teams", "Webhooks"): "Organization webhooks",
    ("Organizations & Teams", "Access Tokens"): "Fine-grained personal access token requests",
    ("Organizations & Teams", "Copilot"): "GitHub Copilot seat management",
    ("Organizations & Teams", "Moderation"): "Blocked users and interaction limits",
    ("My Account", "Profile"): "Your profile and account details",
    ("My Account", "Keys & Emails"): "Your SSH/GPG keys and email addresses",
    ("My Account", "Memberships"): "Your organization and team memberships",
    ("My Account", "Moderation"): "Users you have blocked and interaction limits",
    ("Platform & Misc", "Meta"): "API metadata, rate limits, licenses, and templates",
    ("Platform & Misc", "Migrations & Import"): "Org and user migrations, source imports",
    ("Platform & Misc", "Classroom"): "GitHub Classroom assignments",
    ("Platform & Misc", "Enterprise"): "Enterprise administration",
}
