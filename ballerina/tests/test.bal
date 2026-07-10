// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

// NOTE: This is a reduced smoke-test suite for the daneshk/githubx (has-a wrapper +
// composites) POC branch, not a full port of the original 549-line test suite. It
// validates that (a) delegation through the generated wrapper works end-to-end
// against the mock service, and (b) each composite operation's multi-call sequence
// works correctly. Full test-suite parity with option-c-metadata is remaining work.

import ballerina/os;
import ballerina/test;
import daneshk/githubx.oas;

configurable boolean isLiveServer = false;
configurable string serviceUrl = isLiveServer ? "https://api.github.com" : string `http://localhost:${MOCK_SERVICE_PORT}`;
configurable string testOrganizationName = isLiveServer ? os:getEnv("ORG_NAME") : "test-org";
configurable string testUserRepositoryName = isLiveServer ? os:getEnv("REPO_NAME") : "test-repo";
configurable string authToken = isLiveServer ? os:getEnv("ACCESS_TOKEN") : "mock-token";
configurable string testUsername = isLiveServer ? os:getEnv("USERNAME") : "testUser";

oas:ConnectionConfig gitHubConfig = {
    auth: {token: authToken}
};
Client github = check new (gitHubConfig, serviceUrl);

// ─── Wrapper delegation smoke tests ───

@test:Config {groups: ["mock_tests", "live_tests"]}
function testGetUser() returns error? {
    oas:UserResponse|error? response = github->/user;
    test:assertTrue(response is oas:UserResponse, "Expected the authenticated user's profile");
}

@test:Config {groups: ["mock_tests", "live_tests"]}
function testGetRepository() returns error? {
    oas:FullRepository|error? response = github->/repos/[testOrganizationName]/[testUserRepositoryName];
    test:assertTrue(response is oas:FullRepository, "Expected repository details");
}

@test:Config {groups: ["mock_tests", "live_tests"]}
function testListRepositoryIssues() returns error? {
    oas:Issue[]|error? response = github->/repos/[testOrganizationName]/[testUserRepositoryName]/issues;
    test:assertTrue(response is oas:Issue[], "Expected a list of issues");
}

@test:Config {groups: ["mock_tests", "live_tests"]}
function testCreateIssue() returns error? {
    oas:RepoIssuesBody payload = {title: "Test issue from githubx"};
    oas:Issue response = check github->/repos/[testOrganizationName]/[testUserRepositoryName]/issues.post(payload);
    test:assertEquals(response.title, "Test issue from githubx");
}

@test:Config {groups: ["mock_tests", "live_tests"]}
function testGetBranch() returns error? {
    oas:BranchWithProtection response = check github->/repos/[testOrganizationName]/[testUserRepositoryName]/branches/["master"];
    test:assertEquals(response.name, "master");
}

// ─── Composite operation tests ───

@test:Config {groups: ["mock_tests", "live_tests"]}
function testUpsertFileContent() returns error? {
    oas:FileCommit response = check github->/repos/[testOrganizationName]/[testUserRepositoryName]/upsert\-file\-content.post("src/main.bal", "dGVzdCBjb250ZW50", "Update main.bal via composite");
    test:assertEquals(response.'commit.message, "Update main.bal via composite");
}

@test:Config {groups: ["mock_tests", "live_tests"]}
function testCreateBranchFromDefault() returns error? {
    oas:GitRef response = check github->/repos/[testOrganizationName]/[testUserRepositoryName]/branches\-from\-default.post(
        "feature/composite-test");
    test:assertEquals(response.ref, "refs/heads/feature/composite-test");
}

@test:Config {groups: ["mock_tests", "live_tests"]}
function testMergePullRequestAndDeleteBranch() returns error? {
    oas:PullRequestMergeResult response =
        check github->/repos/[testOrganizationName]/[testUserRepositoryName]/pulls/[1]/merge\-and\-delete\-branch.post();
    test:assertTrue(response.merged, "Expected the pull request to be reported as merged");
}

@test:Config {groups: ["mock_tests", "live_tests"]}
function testGetFullCiStatus() returns error? {
    CombinedCiStatus response =
        check github->/repos/[testOrganizationName]/[testUserRepositoryName]/commits/["abc123"]/full\-ci\-status;
    test:assertEquals(response.statuses.state, "success");
}

@test:Config {groups: ["mock_tests", "live_tests"]}
function testEnsureLabelExists() returns error? {
    oas:Label[] response = check github->/repos/[testOrganizationName]/[testUserRepositoryName]/issues/[1]/ensure\-label.post(
        "bug");
    test:assertTrue(response.length() >= 0);
}

@test:Config {groups: ["mock_tests", "live_tests"]}
function testCreateWebhookAndVerify() returns error? {
    oas:Hook response = check github->/repos/[testOrganizationName]/[testUserRepositoryName]/webhooks\-verified.post(
        "https://example.com/hook");
    test:assertEquals(response.name, "web");
}

@test:Config {groups: ["mock_tests", "live_tests"]}
function testCreateDeploymentWithStatus() returns error? {
    oas:DeploymentStatus response = check github->/repos/[testOrganizationName]/[testUserRepositoryName]/deployments\-with\-status.post(
        "master");
    test:assertEquals(response.state, "in_progress");
}
