    // Composite operations - hand-maintained. Each delegates to the same generated
    // `oas` client the wrapper methods above use (self.genClient->...), so a breaking
    // spec change surfaces as a compile error here, not a silent runtime drift.
    //
    // Manually marked in ui-schema.json with "composite": true and the top priority
    // tier (above the ~20 recommended operations) - see scripts/generate_ui_schema.py.

    # Creates a new file, or updates it if it already exists - handles the GitHub API's
    # `sha`-required-on-update requirement automatically instead of surfacing a 409 to
    # the caller.
    #
    # + owner - The account owner of the repository
    # + repo - The name of the repository
    # + path - Path to the file in the repository
    # + content - The new file content, using Base64 encoding
    # + message - The commit message
    # + branch - The branch name; defaults to the repository's default branch
    # + return - The commit made to create/update the file
    resource isolated function post repos/[string owner]/[string repo]/upsert\-file\-content(
            string path, string content, string message, string? branch = ())
            returns oas:FileCommit|error {
        string? existingSha = ();
        oas:InlineResponse200|error? existing = self.genClient->/repos/[owner]/[repo]/contents/[path](
            queries = branch is string ? {ref: branch} : {});
        if existing is oas:ContentFile {
            existingSha = existing.sha;
        } else if existing is error && !isNotFound(existing) {
            return existing;
        }
        oas:ContentspathBody body = {
            message,
            content,
            sha: existingSha,
            branch
        };
        return self.genClient->/repos/[owner]/[repo]/contents/[path].put(body);
    }

    # Creates a new branch from the tip of the repository's default branch, resolving
    # the base branch name and its current commit SHA automatically instead of
    # requiring the caller to look both up first.
    #
    # + owner - The account owner of the repository
    # + repo - The name of the repository
    # + newBranchName - Name for the new branch (without the `refs/heads/` prefix)
    # + return - The created git reference
    resource isolated function post repos/[string owner]/[string repo]/branches\-from\-default(
            string newBranchName) returns oas:GitRef|error {
        oas:FullRepository repository = check self.genClient->/repos/[owner]/[repo]();
        string defaultBranch = repository.defaultBranch;
        oas:BranchWithProtection baseBranch = check self.genClient->/repos/[owner]/[repo]/branches/[defaultBranch]();
        string baseSha = baseBranch.'commit.sha;
        oas:GitRefsBody body = {ref: string `refs/heads/${newBranchName}`, sha: baseSha};
        return self.genClient->/repos/[owner]/[repo]/git/refs.post(body);
    }

    # Merges a pull request and deletes its source branch in one step - the two
    # operations most PR workflows always perform together.
    #
    # + owner - The account owner of the repository
    # + repo - The name of the repository
    # + pullNumber - The pull request number
    # + mergeMethod - The merge method to use
    # + return - The merge result
    resource isolated function post repos/[string owner]/[string repo]/pulls/[int pullNumber]/merge\-and\-delete\-branch(
            "merge"|"squash"|"rebase" mergeMethod = "merge") returns oas:PullRequestMergeResult|error {
        oas:PullRequest? maybePullRequest = check self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]();
        if maybePullRequest is () {
            return error("Pull request not found");
        }
        oas:PullRequest pullRequest = maybePullRequest;
        oas:PullNumberMergeBody body = {mergeMethod};
        oas:PullRequestMergeResult result =
            check self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/merge.put(body);
        string headRef = pullRequest.head.ref;
        error? deleteResult = self.genClient->/repos/[owner]/[repo]/git/refs/[string `heads/${headRef}`].delete();
        if deleteResult is error {
            return error("Pull request merged, but deleting branch '" + headRef + "' failed: " + deleteResult.message());
        }
        return result;
    }

    # Returns the full CI status for a commit, combining GitHub's two independent
    # status systems - legacy commit statuses and the newer Checks API - into one
    # result, since a repository (or a single commit) may report through either or
    # both and callers otherwise have to know to check both separately.
    #
    # + owner - The account owner of the repository
    # + repo - The name of the repository
    # + ref - The commit SHA, branch name, or tag name
    # + return - Combined legacy statuses and check runs for the ref
    resource isolated function get repos/[string owner]/[string repo]/commits/[string ref]/full\-ci\-status()
            returns CombinedCiStatus|error {
        oas:CombinedCommitStatus statuses = check self.genClient->/repos/[owner]/[repo]/commits/[ref]/status();
        oas:CheckRunResponse checkRuns = check self.genClient->/repos/[owner]/[repo]/commits/[ref]/check\-runs();
        return {statuses, checkRuns: checkRuns.checkRuns};
    }

    # Ensures a label exists on the repository (creating it if necessary) and applies
    # it to an issue or pull request in one step, instead of requiring a separate
    # existence check before every apply.
    #
    # + owner - The account owner of the repository
    # + repo - The name of the repository
    # + issueNumber - The issue (or pull request) number to label
    # + labelName - The label name
    # + color - Hex color (without leading '#') to use if the label needs to be created
    # + description - Description to use if the label needs to be created
    # + return - The issue's labels after applying
    resource isolated function post repos/[string owner]/[string repo]/issues/[int issueNumber]/ensure\-label(
            string labelName, string? color = (), string? description = ()) returns oas:Label[]|error {
        oas:Label|error existingLabel = self.genClient->/repos/[owner]/[repo]/labels/[labelName]();
        if existingLabel is error {
            if !isNotFound(existingLabel) {
                return existingLabel;
            }
            oas:RepoLabelsBody newLabel = {name: labelName, color, description};
            oas:Label _ = check self.genClient->/repos/[owner]/[repo]/labels.post(newLabel);
        }
        oas:IssueNumberLabelsBody addBody = {labels: [labelName]};
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber]/labels.post(addBody);
    }

    # Creates a repository webhook and immediately sends it a ping to verify delivery,
    # instead of leaving verification as a separate manual step.
    #
    # + owner - The account owner of the repository
    # + repo - The name of the repository
    # + url - The URL the webhook should deliver events to
    # + events - The events the webhook should trigger for
    # + contentType - The webhook payload content type
    # + return - The created webhook
    resource isolated function post repos/[string owner]/[string repo]/webhooks\-verified(
            string url, string[] events = ["push"], string contentType = "json") returns oas:Hook|error {
        oas:RepoHooksBody body = {
            name: "web",
            events,
            config: {url, contentType}
        };
        oas:Hook hook = check self.genClient->/repos/[owner]/[repo]/hooks.post(body);
        error? pingResult = self.genClient->/repos/[owner]/[repo]/hooks/[hook.id]/pings.post();
        if pingResult is error {
            return error("Webhook created, but the verification ping failed: " + pingResult.message());
        }
        return hook;
    }

    # Creates a deployment and immediately sets its initial status - a deployment with
    # no status is not meaningfully usable, so this is effectively always two calls
    # in practice.
    #
    # + owner - The account owner of the repository
    # + repo - The name of the repository
    # + ref - The ref (branch, tag, or SHA) to deploy
    # + environment - The target deployment environment
    # + initialState - The initial status state to set
    # + return - The status that was set on the new deployment
    resource isolated function post repos/[string owner]/[string repo]/deployments\-with\-status(
            string ref, string environment = "production",
            "error"|"failure"|"inactive"|"in_progress"|"queued"|"pending"|"success" initialState = "in_progress")
            returns oas:DeploymentStatus|error {
        oas:RepoDeploymentsBody deploymentBody = {ref, environment};
        oas:Deployment|oas:MergedBranchResponse deploymentResult =
            check self.genClient->/repos/[owner]/[repo]/deployments.post(deploymentBody);
        if deploymentResult is oas:MergedBranchResponse {
            return error("Deployment could not be created directly - a merge commit was created instead");
        }
        // Explicit cast: Deployment and MergedBranchResponse overlap structurally enough
        // that flow-typing narrowing after the guard above isn't reliably precise.
        oas:Deployment deployment = <oas:Deployment>deploymentResult;
        int deploymentId = deployment.id;
        oas:DeploymentIdStatusesBody statusBody = {environment, state: initialState};
        return self.genClient->/repos/[owner]/[repo]/deployments/[deploymentId]/statuses.post(statusBody);
    }
