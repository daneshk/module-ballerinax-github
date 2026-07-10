// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.org).
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

import daneshk/githubx.oas;
import ballerina/http;

# GitHub's v3 REST API, with additional composite operations for common
# multi-step workflows (see scripts/composites.bal for the hand-maintained source).
#
# This client is a thin delegating wrapper generated from `ballerina/modules/oas`
# (script-generated - see scripts/generate_wrapper_client.py, do not hand-edit the
# wrapper methods below the marker; composite operations after the second marker are
# hand-maintained in scripts/composites.bal and spliced in by the same script).
public isolated client class Client {
    private final oas:Client genClient;

    # Gets invoked to initialize the `connector`.
    #
    # + config - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(oas:ConnectionConfig config, string serviceUrl = "https://api.github.com") returns error? {
        self.genClient = check new oas:Client(config, serviceUrl);
    }

    // ============================================================
    // GENERATED WRAPPER METHODS - do not hand-edit below this line.
    // Regenerate with: python3 scripts/generate_wrapper_client.py
    // ============================================================
    # GitHub API Root
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get .(map<string|string[]> headers = {}) returns oas:Root|error {
        return self.genClient->/.get(headers);
    }

    # List global security advisories
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get advisories(map<string|string[]> headers = {}, *oas:SecurityAdvisoriesListGlobalAdvisoriesQueries queries) returns oas:GlobalAdvisory[]|error {
        return self.genClient->/advisories.get(headers, queries);
    }

    # Get a global security advisory
    #
    # + ghsaId - The GHSA (GitHub Security Advisory) identifier of the advisory
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get advisories/[string ghsaId](map<string|string[]> headers = {}) returns oas:GlobalAdvisory|error {
        return self.genClient->/advisories/[ghsaId].get(headers);
    }

    # Get the authenticated app
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get app(map<string|string[]> headers = {}) returns oas:Integration|error {
        return self.genClient->/app.get(headers);
    }

    # Create a GitHub App from a manifest
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post app\-manifests/[string code]/conversions(map<string|string[]> headers = {}) returns oas:ManifestConversions|error {
        return self.genClient->/app\-manifests/[code]/conversions.post(headers);
    }

    # Get a webhook configuration for an app
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get app/hook/config(map<string|string[]> headers = {}) returns oas:WebhookConfig|error {
        return self.genClient->/app/hook/config.get(headers);
    }

    # Update a webhook configuration for an app
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch app/hook/config(oas:HookConfigBody payload, map<string|string[]> headers = {}) returns oas:WebhookConfig|error {
        return self.genClient->/app/hook/config.patch(payload, headers);
    }

    # List deliveries for an app webhook
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get app/hook/deliveries(map<string|string[]> headers = {}, *oas:AppsListWebhookDeliveriesQueries queries) returns oas:HookDeliveryItem[]|error {
        return self.genClient->/app/hook/deliveries.get(headers, queries);
    }

    # Get a delivery for an app webhook
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get app/hook/deliveries/[int deliveryId](map<string|string[]> headers = {}) returns oas:HookDelivery|error {
        return self.genClient->/app/hook/deliveries/[deliveryId].get(headers);
    }

    # Redeliver a delivery for an app webhook
    #
    # + headers - Headers to be sent with the request 
    # + return - Accepted 
    resource isolated function post app/hook/deliveries/[int deliveryId]/attempts(map<string|string[]> headers = {}) returns record {}|error {
        return self.genClient->/app/hook/deliveries/[deliveryId]/attempts.post(headers);
    }

    # List installation requests for the authenticated app
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - List of integration installation requests 
    resource isolated function get app/installation\-requests(map<string|string[]> headers = {}, *oas:AppsListInstallationRequestsForAuthenticatedAppQueries queries) returns oas:IntegrationInstallationRequest[]|error? {
        return self.genClient->/app/installation\-requests.get(headers, queries);
    }

    # List installations for the authenticated app
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - The permissions the installation has are included under the permissions key 
    resource isolated function get app/installations(map<string|string[]> headers = {}, *oas:AppsListInstallationsQueries queries) returns oas:Installation[]|error {
        return self.genClient->/app/installations.get(headers, queries);
    }

    # Get an installation for the authenticated app
    #
    # + installationId - The unique identifier of the installation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get app/installations/[int installationId](map<string|string[]> headers = {}) returns oas:Installation|error {
        return self.genClient->/app/installations/[installationId].get(headers);
    }

    # Delete an installation for the authenticated app
    #
    # + installationId - The unique identifier of the installation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete app/installations/[int installationId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/app/installations/[installationId].delete(headers);
    }

    # Create an installation access token for an app
    #
    # + installationId - The unique identifier of the installation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post app/installations/[int installationId]/access_tokens(oas:InstallationIdAccessTokensBody payload, map<string|string[]> headers = {}) returns oas:InstallationToken|error {
        return self.genClient->/app/installations/[installationId]/access_tokens.post(payload, headers);
    }

    # Suspend an app installation
    #
    # + installationId - The unique identifier of the installation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put app/installations/[int installationId]/suspended(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/app/installations/[installationId]/suspended.put(headers);
    }

    # Unsuspend an app installation
    #
    # + installationId - The unique identifier of the installation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete app/installations/[int installationId]/suspended(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/app/installations/[installationId]/suspended.delete(headers);
    }

    # Delete an app authorization
    #
    # + clientId - The client ID of the GitHub app
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete applications/[string clientId]/grant(oas:ClientIdGrantBody payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/applications/[clientId]/grant.delete(payload, headers);
    }

    # Check a token
    #
    # + clientId - The client ID of the GitHub app
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post applications/[string clientId]/token(oas:ClientIdTokenBody payload, map<string|string[]> headers = {}) returns oas:Authorization|error {
        return self.genClient->/applications/[clientId]/token.post(payload, headers);
    }

    # Delete an app token
    #
    # + clientId - The client ID of the GitHub app
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete applications/[string clientId]/token(oas:ClientIdGrantBody payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/applications/[clientId]/token.delete(payload, headers);
    }

    # Reset a token
    #
    # + clientId - The client ID of the GitHub app
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch applications/[string clientId]/token(oas:ClientIdTokenBody payload, map<string|string[]> headers = {}) returns oas:Authorization|error {
        return self.genClient->/applications/[clientId]/token.patch(payload, headers);
    }

    # Create a scoped access token
    #
    # + clientId - The client ID of the GitHub app
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post applications/[string clientId]/token/scoped(oas:TokenScopedBody payload, map<string|string[]> headers = {}) returns oas:Authorization|error {
        return self.genClient->/applications/[clientId]/token/scoped.post(payload, headers);
    }

    # Get an app
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get apps/[string appSlug](map<string|string[]> headers = {}) returns oas:Integration|error {
        return self.genClient->/apps/[appSlug].get(headers);
    }

    # Get an assignment
    #
    # + assignmentId - The unique identifier of the classroom assignment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get assignments/[int assignmentId](map<string|string[]> headers = {}) returns oas:ClassroomAssignment|error {
        return self.genClient->/assignments/[assignmentId].get(headers);
    }

    # List accepted assignments for an assignment
    #
    # + assignmentId - The unique identifier of the classroom assignment
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get assignments/[int assignmentId]/accepted_assignments(map<string|string[]> headers = {}, *oas:ClassroomListAcceptedAssigmentsForAnAssignmentQueries queries) returns oas:ClassroomAcceptedAssignment[]|error {
        return self.genClient->/assignments/[assignmentId]/accepted_assignments.get(headers, queries);
    }

    # Get assignment grades
    #
    # + assignmentId - The unique identifier of the classroom assignment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get assignments/[int assignmentId]/grades(map<string|string[]> headers = {}) returns oas:ClassroomAssignmentGrade[]|error {
        return self.genClient->/assignments/[assignmentId]/grades.get(headers);
    }

    # List classrooms
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get classrooms(map<string|string[]> headers = {}, *oas:ClassroomListClassroomsQueries queries) returns oas:SimpleClassroom[]|error {
        return self.genClient->/classrooms.get(headers, queries);
    }

    # Get a classroom
    #
    # + classroomId - The unique identifier of the classroom
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get classrooms/[int classroomId](map<string|string[]> headers = {}) returns oas:Classroom|error {
        return self.genClient->/classrooms/[classroomId].get(headers);
    }

    # List assignments for a classroom
    #
    # + classroomId - The unique identifier of the classroom
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get classrooms/[int classroomId]/assignments(map<string|string[]> headers = {}, *oas:ClassroomListAssignmentsForAClassroomQueries queries) returns oas:SimpleClassroomAssignment[]|error {
        return self.genClient->/classrooms/[classroomId]/assignments.get(headers, queries);
    }

    # Get all codes of conduct
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get codes_of_conduct(map<string|string[]> headers = {}) returns oas:CodeOfConduct[]|error? {
        return self.genClient->/codes_of_conduct.get(headers);
    }

    # Get a code of conduct
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get codes_of_conduct/[string 'key](map<string|string[]> headers = {}) returns oas:CodeOfConduct|error? {
        return self.genClient->/codes_of_conduct/['key].get(headers);
    }

    # Get emojis
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get emojis(map<string|string[]> headers = {}) returns record {|string...;|}|error? {
        return self.genClient->/emojis.get(headers);
    }

    # List Dependabot alerts for an enterprise
    #
    # + enterprise - The slug version of the enterprise name. You can also substitute this value with the enterprise id
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get enterprises/[string enterprise]/dependabot/alerts(map<string|string[]> headers = {}, *oas:DependabotListAlertsForEnterpriseQueries queries) returns oas:DependabotAlertWithRepository[]|error? {
        return self.genClient->/enterprises/[enterprise]/dependabot/alerts.get(headers, queries);
    }

    # List secret scanning alerts for an enterprise
    #
    # + enterprise - The slug version of the enterprise name. You can also substitute this value with the enterprise id
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get enterprises/[string enterprise]/secret\-scanning/alerts(map<string|string[]> headers = {}, *oas:SecretScanningListAlertsForEnterpriseQueries queries) returns oas:OrganizationSecretScanningAlert[]|error {
        return self.genClient->/enterprises/[enterprise]/secret\-scanning/alerts.get(headers, queries);
    }

    # List public events
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get events(map<string|string[]> headers = {}, *oas:ActivityListPublicEventsQueries queries) returns oas:Event[]|error? {
        return self.genClient->/events.get(headers, queries);
    }

    # Get feeds
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get feeds(map<string|string[]> headers = {}) returns oas:Feed|error {
        return self.genClient->/feeds.get(headers);
    }

    # List gists for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get gists(map<string|string[]> headers = {}, *oas:GistsListQueries queries) returns oas:BaseGist[]|error? {
        return self.genClient->/gists.get(headers, queries);
    }

    # Create a gist
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post gists(oas:GistsBody payload, map<string|string[]> headers = {}) returns oas:GistSimple|error? {
        return self.genClient->/gists.post(payload, headers);
    }

    # Get a gist
    #
    # + gistId - The unique identifier of the gist
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get gists/[string gistId](map<string|string[]> headers = {}) returns oas:GistSimple|error? {
        return self.genClient->/gists/[gistId].get(headers);
    }

    # Delete a gist
    #
    # + gistId - The unique identifier of the gist
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete gists/[string gistId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/gists/[gistId].delete(headers);
    }

    # Update a gist
    #
    # + gistId - The unique identifier of the gist
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch gists/[string gistId](oas:GistsgistIdBody payload, map<string|string[]> headers = {}) returns oas:GistSimple|error {
        return self.genClient->/gists/[gistId].patch(payload, headers);
    }

    # Get a gist comment
    #
    # + gistId - The unique identifier of the gist
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get gists/[string gistId]/comments/[int commentId](map<string|string[]> headers = {}) returns oas:GistComment|error? {
        return self.genClient->/gists/[gistId]/comments/[commentId].get(headers);
    }

    # Delete a gist comment
    #
    # + gistId - The unique identifier of the gist
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete gists/[string gistId]/comments/[int commentId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/gists/[gistId]/comments/[commentId].delete(headers);
    }

    # Update a gist comment
    #
    # + gistId - The unique identifier of the gist
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch gists/[string gistId]/comments/[int commentId](oas:GistIdCommentsBody payload, map<string|string[]> headers = {}) returns oas:GistComment|error {
        return self.genClient->/gists/[gistId]/comments/[commentId].patch(payload, headers);
    }

    # Get a gist revision
    #
    # + gistId - The unique identifier of the gist
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get gists/[string gistId]/[string sha](map<string|string[]> headers = {}) returns oas:GistSimple|error {
        return self.genClient->/gists/[gistId]/[sha].get(headers);
    }

    # Get all gitignore templates
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get gitignore/templates(map<string|string[]> headers = {}) returns string[]|error? {
        return self.genClient->/gitignore/templates.get(headers);
    }

    # Get a gitignore template
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get gitignore/templates/[string name](map<string|string[]> headers = {}) returns oas:GitignoreTemplate|error? {
        return self.genClient->/gitignore/templates/[name].get(headers);
    }

    # List repositories accessible to the app installation
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get installation/repositories(map<string|string[]> headers = {}, *oas:AppsListReposAccessibleToInstallationQueries queries) returns oas:RepositoryResponse|error? {
        return self.genClient->/installation/repositories.get(headers, queries);
    }

    # Revoke an installation access token
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete installation/token(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/installation/token.delete(headers);
    }

    # List issues assigned to the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get issues(map<string|string[]> headers = {}, *oas:IssuesListQueries queries) returns oas:Issue[]|error? {
        return self.genClient->/issues.get(headers, queries);
    }

    # Get all commonly used licenses
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get licenses(map<string|string[]> headers = {}, *oas:LicensesGetAllCommonlyUsedQueries queries) returns oas:LicenseSimple[]|error? {
        return self.genClient->/licenses.get(headers, queries);
    }

    # Get a license
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get licenses/[string license](map<string|string[]> headers = {}) returns oas:License|error? {
        return self.genClient->/licenses/[license].get(headers);
    }

    # Render a Markdown document
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post markdown(oas:MarkdownBody payload, map<string|string[]> headers = {}) returns string|error? {
        return self.genClient->/markdown.post(payload, headers);
    }

    # Render a Markdown document in raw mode
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post markdown/raw(string payload, map<string|string[]> headers = {}) returns string|error? {
        return self.genClient->/markdown/raw.post(payload, headers);
    }

    # Get a subscription plan for an account
    #
    # + accountId - account_id parameter
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get marketplace_listing/accounts/[int accountId](map<string|string[]> headers = {}) returns oas:MarketplacePurchase|error {
        return self.genClient->/marketplace_listing/accounts/[accountId].get(headers);
    }

    # List plans
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get marketplace_listing/plans(map<string|string[]> headers = {}, *oas:AppsListPlansQueries queries) returns oas:MarketplaceListingPlan[]|error {
        return self.genClient->/marketplace_listing/plans.get(headers, queries);
    }

    # List accounts for a plan
    #
    # + planId - The unique identifier of the plan
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get marketplace_listing/plans/[int planId]/accounts(map<string|string[]> headers = {}, *oas:AppsListAccountsForPlanQueries queries) returns oas:MarketplacePurchase[]|error {
        return self.genClient->/marketplace_listing/plans/[planId]/accounts.get(headers, queries);
    }

    # Get a subscription plan for an account (stubbed)
    #
    # + accountId - account_id parameter
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get marketplace_listing/stubbed/accounts/[int accountId](map<string|string[]> headers = {}) returns oas:MarketplacePurchase|error {
        return self.genClient->/marketplace_listing/stubbed/accounts/[accountId].get(headers);
    }

    # List plans (stubbed)
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get marketplace_listing/stubbed/plans(map<string|string[]> headers = {}, *oas:AppsListPlansStubbedQueries queries) returns oas:MarketplaceListingPlan[]|error {
        return self.genClient->/marketplace_listing/stubbed/plans.get(headers, queries);
    }

    # List accounts for a plan (stubbed)
    #
    # + planId - The unique identifier of the plan
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get marketplace_listing/stubbed/plans/[int planId]/accounts(map<string|string[]> headers = {}, *oas:AppsListAccountsForPlanStubbedQueries queries) returns oas:MarketplacePurchase[]|error {
        return self.genClient->/marketplace_listing/stubbed/plans/[planId]/accounts.get(headers, queries);
    }

    # Get GitHub meta information
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get meta(map<string|string[]> headers = {}) returns oas:ApiOverview|error? {
        return self.genClient->/meta.get(headers);
    }

    # List public events for a network of repositories
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get networks/[string owner]/[string repo]/events(map<string|string[]> headers = {}, *oas:ActivityListPublicEventsForRepoNetworkQueries queries) returns oas:Event[]|error? {
        return self.genClient->/networks/[owner]/[repo]/events.get(headers, queries);
    }

    # List notifications for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get notifications(map<string|string[]> headers = {}, *oas:ActivityListNotificationsForAuthenticatedUserQueries queries) returns oas:NotificationThread[]|error? {
        return self.genClient->/notifications.get(headers, queries);
    }

    # Mark notifications as read
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put notifications(oas:NotificationsBody payload, map<string|string[]> headers = {}) returns oas:NotificationRead|error? {
        return self.genClient->/notifications.put(payload, headers);
    }

    # Get a thread
    #
    # + threadId - The unique identifier of the notification thread. This corresponds to the value returned in the id field when you retrieve notifications (for example with the [GET /notifications operation](https://docs.github.com/rest/activity/notifications#list-notifications-for-the-authenticated-user))
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get notifications/threads/[int threadId](map<string|string[]> headers = {}) returns oas:NotificationThread|error? {
        return self.genClient->/notifications/threads/[threadId].get(headers);
    }

    # Mark a thread as read
    #
    # + threadId - The unique identifier of the notification thread. This corresponds to the value returned in the id field when you retrieve notifications (for example with the [GET /notifications operation](https://docs.github.com/rest/activity/notifications#list-notifications-for-the-authenticated-user))
    # + headers - Headers to be sent with the request 
    # + return - Reset Content 
    resource isolated function patch notifications/threads/[int threadId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/notifications/threads/[threadId].patch(headers);
    }

    # Get a thread subscription for the authenticated user
    #
    # + threadId - The unique identifier of the notification thread. This corresponds to the value returned in the id field when you retrieve notifications (for example with the [GET /notifications operation](https://docs.github.com/rest/activity/notifications#list-notifications-for-the-authenticated-user))
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get notifications/threads/[int threadId]/subscription(map<string|string[]> headers = {}) returns oas:ThreadSubscription|error? {
        return self.genClient->/notifications/threads/[threadId]/subscription.get(headers);
    }

    # Set a thread subscription
    #
    # + threadId - The unique identifier of the notification thread. This corresponds to the value returned in the id field when you retrieve notifications (for example with the [GET /notifications operation](https://docs.github.com/rest/activity/notifications#list-notifications-for-the-authenticated-user))
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put notifications/threads/[int threadId]/subscription(oas:ThreadIdSubscriptionBody payload, map<string|string[]> headers = {}) returns oas:ThreadSubscription|error? {
        return self.genClient->/notifications/threads/[threadId]/subscription.put(payload, headers);
    }

    # Delete a thread subscription
    #
    # + threadId - The unique identifier of the notification thread. This corresponds to the value returned in the id field when you retrieve notifications (for example with the [GET /notifications operation](https://docs.github.com/rest/activity/notifications#list-notifications-for-the-authenticated-user))
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete notifications/threads/[int threadId]/subscription(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/notifications/threads/[threadId]/subscription.delete(headers);
    }

    # Get Octocat
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get octocat(map<string|string[]> headers = {}, *oas:MetaGetOctocatQueries queries) returns http:Response|error {
        return self.genClient->/octocat.get(headers, queries);
    }

    # List organizations
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get organizations(map<string|string[]> headers = {}, *oas:OrgsListQueries queries) returns oas:OrganizationSimple[]|error? {
        return self.genClient->/organizations.get(headers, queries);
    }

    # Get an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org](map<string|string[]> headers = {}) returns oas:OrganizationFull|error {
        return self.genClient->/orgs/[org].get(headers);
    }

    # Delete an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Accepted 
    resource isolated function delete orgs/[string org](map<string|string[]> headers = {}) returns record {}|error {
        return self.genClient->/orgs/[org].delete(headers);
    }

    # Update an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch orgs/[string org](oas:OrgsorgBody payload, map<string|string[]> headers = {}) returns oas:OrganizationFull|error {
        return self.genClient->/orgs/[org].patch(payload, headers);
    }

    # Get GitHub Actions cache usage for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/actions/cache/usage(map<string|string[]> headers = {}) returns oas:ActionsCacheUsageOrgEnterprise|error {
        return self.genClient->/orgs/[org]/actions/cache/usage.get(headers);
    }

    # List repositories with GitHub Actions cache usage for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/actions/cache/usage\-by\-repository(map<string|string[]> headers = {}, *oas:ActionsGetActionsCacheUsageByRepoForOrgQueries queries) returns oas:ActionsCacheUsageByRepositoryResponse|error {
        return self.genClient->/orgs/[org]/actions/cache/usage\-by\-repository.get(headers, queries);
    }

    # Get the customization template for an OIDC subject claim for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - A JSON serialized template for OIDC subject claim customization 
    resource isolated function get orgs/[string org]/actions/oidc/customization/sub(map<string|string[]> headers = {}) returns oas:OidcCustomSub|error {
        return self.genClient->/orgs/[org]/actions/oidc/customization/sub.get(headers);
    }

    # Set the customization template for an OIDC subject claim for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Empty response 
    resource isolated function put orgs/[string org]/actions/oidc/customization/sub(oas:OidcCustomSub payload, map<string|string[]> headers = {}) returns oas:EmptyObject|error {
        return self.genClient->/orgs/[org]/actions/oidc/customization/sub.put(payload, headers);
    }

    # Get GitHub Actions permissions for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/actions/permissions(map<string|string[]> headers = {}) returns oas:ActionsOrganizationPermissions|error {
        return self.genClient->/orgs/[org]/actions/permissions.get(headers);
    }

    # Set GitHub Actions permissions for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put orgs/[string org]/actions/permissions(oas:ActionsPermissionsBody payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/actions/permissions.put(payload, headers);
    }

    # List selected repositories enabled for GitHub Actions in an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/actions/permissions/repositories(map<string|string[]> headers = {}, *oas:ActionsListSelectedRepositoriesEnabledGithubActionsOrganizationQueries queries) returns oas:RepositoryResponse|error {
        return self.genClient->/orgs/[org]/actions/permissions/repositories.get(headers, queries);
    }

    # Set selected repositories enabled for GitHub Actions in an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put orgs/[string org]/actions/permissions/repositories(oas:PermissionsRepositoriesBody payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/actions/permissions/repositories.put(payload, headers);
    }

    # Enable a selected repository for GitHub Actions in an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + repositoryId - The unique identifier of the repository
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put orgs/[string org]/actions/permissions/repositories/[int repositoryId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/actions/permissions/repositories/[repositoryId].put(headers);
    }

    # Disable a selected repository for GitHub Actions in an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + repositoryId - The unique identifier of the repository
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/actions/permissions/repositories/[int repositoryId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/actions/permissions/repositories/[repositoryId].delete(headers);
    }

    # Get allowed actions and reusable workflows for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/actions/permissions/selected\-actions(map<string|string[]> headers = {}) returns oas:SelectedActions|error {
        return self.genClient->/orgs/[org]/actions/permissions/selected\-actions.get(headers);
    }

    # Set allowed actions and reusable workflows for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put orgs/[string org]/actions/permissions/selected\-actions(oas:SelectedActions payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/actions/permissions/selected\-actions.put(payload, headers);
    }

    # Get default workflow permissions for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/actions/permissions/workflow(map<string|string[]> headers = {}) returns oas:ActionsGetDefaultWorkflowPermissions|error {
        return self.genClient->/orgs/[org]/actions/permissions/workflow.get(headers);
    }

    # Set default workflow permissions for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Success response 
    resource isolated function put orgs/[string org]/actions/permissions/workflow(oas:ActionsSetDefaultWorkflowPermissions payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/actions/permissions/workflow.put(payload, headers);
    }

    # List self-hosted runners for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/actions/runners(map<string|string[]> headers = {}, *oas:ActionsListSelfHostedRunnersForOrgQueries queries) returns oas:RunnerResponse|error {
        return self.genClient->/orgs/[org]/actions/runners.get(headers, queries);
    }

    # Get a self-hosted runner for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + runnerId - Unique identifier of the self-hosted runner
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/actions/runners/[int runnerId](map<string|string[]> headers = {}) returns oas:Runner|error {
        return self.genClient->/orgs/[org]/actions/runners/[runnerId].get(headers);
    }

    # Delete a self-hosted runner from an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + runnerId - Unique identifier of the self-hosted runner
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/actions/runners/[int runnerId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/actions/runners/[runnerId].delete(headers);
    }

    # List labels for a self-hosted runner for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + runnerId - Unique identifier of the self-hosted runner
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/actions/runners/[int runnerId]/labels(map<string|string[]> headers = {}) returns oas:RunnerLabelResponse|error {
        return self.genClient->/orgs/[org]/actions/runners/[runnerId]/labels.get(headers);
    }

    # Set custom labels for a self-hosted runner for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + runnerId - Unique identifier of the self-hosted runner
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put orgs/[string org]/actions/runners/[int runnerId]/labels(oas:RunnerIdLabelsBody payload, map<string|string[]> headers = {}) returns oas:RunnerLabelResponse|error {
        return self.genClient->/orgs/[org]/actions/runners/[runnerId]/labels.put(payload, headers);
    }

    # Add custom labels to a self-hosted runner for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + runnerId - Unique identifier of the self-hosted runner
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post orgs/[string org]/actions/runners/[int runnerId]/labels(oas:RunnerIdLabelsBody1 payload, map<string|string[]> headers = {}) returns oas:RunnerLabelResponse|error {
        return self.genClient->/orgs/[org]/actions/runners/[runnerId]/labels.post(payload, headers);
    }

    # Remove all custom labels from a self-hosted runner for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + runnerId - Unique identifier of the self-hosted runner
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/actions/runners/[int runnerId]/labels(map<string|string[]> headers = {}) returns oas:RunnerLabelResponse|error {
        return self.genClient->/orgs/[org]/actions/runners/[runnerId]/labels.delete(headers);
    }

    # Remove a custom label from a self-hosted runner for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + runnerId - Unique identifier of the self-hosted runner
    # + name - The name of a self-hosted runner's custom label
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/actions/runners/[int runnerId]/labels/[string name](map<string|string[]> headers = {}) returns oas:RunnerLabelResponse|error {
        return self.genClient->/orgs/[org]/actions/runners/[runnerId]/labels/[name].delete(headers);
    }

    # List organization secrets
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/actions/secrets(map<string|string[]> headers = {}, *oas:ActionsListOrgSecretsQueries queries) returns oas:OrganizationActionsSecretResponse|error {
        return self.genClient->/orgs/[org]/actions/secrets.get(headers, queries);
    }

    # Get an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/actions/secrets/[string secretName](map<string|string[]> headers = {}) returns oas:OrganizationActionsSecret|error {
        return self.genClient->/orgs/[org]/actions/secrets/[secretName].get(headers);
    }

    # Create or update an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response when creating a secret 
    resource isolated function put orgs/[string org]/actions/secrets/[string secretName](oas:SecretssecretNameBody payload, map<string|string[]> headers = {}) returns oas:EmptyObject|error? {
        return self.genClient->/orgs/[org]/actions/secrets/[secretName].put(payload, headers);
    }

    # Delete an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/actions/secrets/[string secretName](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/actions/secrets/[secretName].delete(headers);
    }

    # List selected repositories for an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/actions/secrets/[string secretName]/repositories(map<string|string[]> headers = {}, *oas:ActionsListSelectedReposForOrgSecretQueries queries) returns oas:MinimalRepositoryResponse|error {
        return self.genClient->/orgs/[org]/actions/secrets/[secretName]/repositories.get(headers, queries);
    }

    # Set selected repositories for an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put orgs/[string org]/actions/secrets/[string secretName]/repositories(oas:SecretNameRepositoriesBody payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/actions/secrets/[secretName]/repositories.put(payload, headers);
    }

    # Add selected repository to an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - No Content when repository was added to the selected list 
    resource isolated function put orgs/[string org]/actions/secrets/[string secretName]/repositories/[int repositoryId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/actions/secrets/[secretName]/repositories/[repositoryId].put(headers);
    }

    # Remove selected repository from an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response when repository was removed from the selected list 
    resource isolated function delete orgs/[string org]/actions/secrets/[string secretName]/repositories/[int repositoryId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/actions/secrets/[secretName]/repositories/[repositoryId].delete(headers);
    }

    # List organization variables
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/actions/variables(map<string|string[]> headers = {}, *oas:ActionsListOrgVariablesQueries queries) returns oas:OrganizationActionsVariableResponse|error {
        return self.genClient->/orgs/[org]/actions/variables.get(headers, queries);
    }

    # Create an organization variable
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response when creating a variable 
    resource isolated function post orgs/[string org]/actions/variables(oas:ActionsVariablesBody payload, map<string|string[]> headers = {}) returns oas:EmptyObject|error {
        return self.genClient->/orgs/[org]/actions/variables.post(payload, headers);
    }

    # Get an organization variable
    #
    # + org - The organization name. The name is not case sensitive
    # + name - The name of the variable
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/actions/variables/[string name](map<string|string[]> headers = {}) returns oas:OrganizationActionsVariable|error {
        return self.genClient->/orgs/[org]/actions/variables/[name].get(headers);
    }

    # Delete an organization variable
    #
    # + org - The organization name. The name is not case sensitive
    # + name - The name of the variable
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/actions/variables/[string name](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/actions/variables/[name].delete(headers);
    }

    # Update an organization variable
    #
    # + org - The organization name. The name is not case sensitive
    # + name - The name of the variable
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch orgs/[string org]/actions/variables/[string name](oas:VariablesnameBody payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/actions/variables/[name].patch(payload, headers);
    }

    # List selected repositories for an organization variable
    #
    # + org - The organization name. The name is not case sensitive
    # + name - The name of the variable
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/actions/variables/[string name]/repositories(map<string|string[]> headers = {}, *oas:ActionsListSelectedReposForOrgVariableQueries queries) returns oas:MinimalRepositoryResponse|error {
        return self.genClient->/orgs/[org]/actions/variables/[name]/repositories.get(headers, queries);
    }

    # Set selected repositories for an organization variable
    #
    # + org - The organization name. The name is not case sensitive
    # + name - The name of the variable
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put orgs/[string org]/actions/variables/[string name]/repositories(oas:NameRepositoriesBody payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/actions/variables/[name]/repositories.put(payload, headers);
    }

    # Add selected repository to an organization variable
    #
    # + org - The organization name. The name is not case sensitive
    # + name - The name of the variable
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put orgs/[string org]/actions/variables/[string name]/repositories/[int repositoryId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/actions/variables/[name]/repositories/[repositoryId].put(headers);
    }

    # Remove selected repository from an organization variable
    #
    # + org - The organization name. The name is not case sensitive
    # + name - The name of the variable
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/actions/variables/[string name]/repositories/[int repositoryId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/actions/variables/[name]/repositories/[repositoryId].delete(headers);
    }

    # List users blocked by an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/blocks(map<string|string[]> headers = {}, *oas:OrgsListBlockedUsersQueries queries) returns oas:SimpleUser[]|error {
        return self.genClient->/orgs/[org]/blocks.get(headers, queries);
    }

    # Check if a user is blocked by an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - If the user is blocked 
    resource isolated function get orgs/[string org]/blocks/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/blocks/[username].get(headers);
    }

    # Block a user from an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put orgs/[string org]/blocks/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/blocks/[username].put(headers);
    }

    # Unblock a user from an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/blocks/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/blocks/[username].delete(headers);
    }

    # List secret scanning alerts for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/code\-scanning/alerts(map<string|string[]> headers = {}, *oas:CodeScanningListAlertsForOrgQueries queries) returns oas:CodeScanningOrganizationAlertItems[]|error {
        return self.genClient->/orgs/[org]/code\-scanning/alerts.get(headers, queries);
    }

    # List codespaces for the organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/codespaces(map<string|string[]> headers = {}, *oas:CodespacesListInOrganizationQueries queries) returns oas:CodespaceResponse|error? {
        return self.genClient->/orgs/[org]/codespaces.get(headers, queries);
    }

    resource isolated function put orgs/[string org]/codespaces/access(oas:CodespacesAccessBody payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/codespaces/access.put(payload, headers);
    }

    resource isolated function post orgs/[string org]/codespaces/access/selected_users(oas:AccessSelectedUsersBody payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/codespaces/access/selected_users.post(payload, headers);
    }

    resource isolated function delete orgs/[string org]/codespaces/access/selected_users(oas:AccessSelectedUsersBody1 payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/codespaces/access/selected_users.delete(payload, headers);
    }

    # List organization secrets
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/codespaces/secrets(map<string|string[]> headers = {}, *oas:CodespacesListOrgSecretsQueries queries) returns oas:CodespacesOrgSecretResponse|error {
        return self.genClient->/orgs/[org]/codespaces/secrets.get(headers, queries);
    }

    # Get an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/codespaces/secrets/[string secretName](map<string|string[]> headers = {}) returns oas:CodespacesOrgSecret|error {
        return self.genClient->/orgs/[org]/codespaces/secrets/[secretName].get(headers);
    }

    # Create or update an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response when creating a secret 
    resource isolated function put orgs/[string org]/codespaces/secrets/[string secretName](oas:SecretssecretNameBody1 payload, map<string|string[]> headers = {}) returns oas:EmptyObject|error? {
        return self.genClient->/orgs/[org]/codespaces/secrets/[secretName].put(payload, headers);
    }

    # Delete an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/codespaces/secrets/[string secretName](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/codespaces/secrets/[secretName].delete(headers);
    }

    # List selected repositories for an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/codespaces/secrets/[string secretName]/repositories(map<string|string[]> headers = {}, *oas:CodespacesListSelectedReposForOrgSecretQueries queries) returns oas:MinimalRepositoryResponse|error {
        return self.genClient->/orgs/[org]/codespaces/secrets/[secretName]/repositories.get(headers, queries);
    }

    # Set selected repositories for an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put orgs/[string org]/codespaces/secrets/[string secretName]/repositories(oas:SecretNameRepositoriesBody1 payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/codespaces/secrets/[secretName]/repositories.put(payload, headers);
    }

    # Add selected repository to an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - No Content when repository was added to the selected list 
    resource isolated function put orgs/[string org]/codespaces/secrets/[string secretName]/repositories/[int repositoryId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/codespaces/secrets/[secretName]/repositories/[repositoryId].put(headers);
    }

    # Remove selected repository from an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response when repository was removed from the selected list 
    resource isolated function delete orgs/[string org]/codespaces/secrets/[string secretName]/repositories/[int repositoryId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/codespaces/secrets/[secretName]/repositories/[repositoryId].delete(headers);
    }

    # Get Copilot for Business seat information and settings for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function get orgs/[string org]/copilot/billing(map<string|string[]> headers = {}) returns oas:CopilotOrganizationDetails|error {
        return self.genClient->/orgs/[org]/copilot/billing.get(headers);
    }

    # List all Copilot for Business seat assignments for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/copilot/billing/seats(map<string|string[]> headers = {}, *oas:CopilotListCopilotSeatsQueries queries) returns oas:CopilotSeatDetailsResponse|error {
        return self.genClient->/orgs/[org]/copilot/billing/seats.get(headers, queries);
    }

    # Add teams to the Copilot for Business subscription for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function post orgs/[string org]/copilot/billing/selected_teams(oas:BillingSelectedTeamsBody payload, map<string|string[]> headers = {}) returns oas:CopilotSeatCreated|error {
        return self.genClient->/orgs/[org]/copilot/billing/selected_teams.post(payload, headers);
    }

    # Remove teams from the Copilot for Business subscription for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function delete orgs/[string org]/copilot/billing/selected_teams(oas:BillingSelectedTeamsBody1 payload, map<string|string[]> headers = {}) returns oas:CopilotSeatCancelled|error {
        return self.genClient->/orgs/[org]/copilot/billing/selected_teams.delete(payload, headers);
    }

    # Add users to the Copilot for Business subscription for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function post orgs/[string org]/copilot/billing/selected_users(oas:BillingSelectedUsersBody payload, map<string|string[]> headers = {}) returns oas:CopilotSeatCreated|error {
        return self.genClient->/orgs/[org]/copilot/billing/selected_users.post(payload, headers);
    }

    # Remove users from the Copilot for Business subscription for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - OK 
    resource isolated function delete orgs/[string org]/copilot/billing/selected_users(oas:BillingSelectedUsersBody1 payload, map<string|string[]> headers = {}) returns oas:CopilotSeatCancelled|error {
        return self.genClient->/orgs/[org]/copilot/billing/selected_users.delete(payload, headers);
    }

    # List Dependabot alerts for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/dependabot/alerts(map<string|string[]> headers = {}, *oas:DependabotListAlertsForOrgQueries queries) returns oas:DependabotAlertWithRepository[]|error? {
        return self.genClient->/orgs/[org]/dependabot/alerts.get(headers, queries);
    }

    # List organization secrets
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/dependabot/secrets(map<string|string[]> headers = {}, *oas:DependabotListOrgSecretsQueries queries) returns oas:OrganizationDependabotSecretResponse|error {
        return self.genClient->/orgs/[org]/dependabot/secrets.get(headers, queries);
    }

    # Get an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/dependabot/secrets/[string secretName](map<string|string[]> headers = {}) returns oas:OrganizationDependabotSecret|error {
        return self.genClient->/orgs/[org]/dependabot/secrets/[secretName].get(headers);
    }

    # Create or update an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response when creating a secret 
    resource isolated function put orgs/[string org]/dependabot/secrets/[string secretName](oas:SecretssecretNameBody2 payload, map<string|string[]> headers = {}) returns oas:EmptyObject|error? {
        return self.genClient->/orgs/[org]/dependabot/secrets/[secretName].put(payload, headers);
    }

    # Delete an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/dependabot/secrets/[string secretName](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/dependabot/secrets/[secretName].delete(headers);
    }

    # List selected repositories for an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/dependabot/secrets/[string secretName]/repositories(map<string|string[]> headers = {}, *oas:DependabotListSelectedReposForOrgSecretQueries queries) returns oas:MinimalRepositoryResponse|error {
        return self.genClient->/orgs/[org]/dependabot/secrets/[secretName]/repositories.get(headers, queries);
    }

    # Set selected repositories for an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put orgs/[string org]/dependabot/secrets/[string secretName]/repositories(oas:SecretNameRepositoriesBody2 payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/dependabot/secrets/[secretName]/repositories.put(payload, headers);
    }

    # Add selected repository to an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - No Content when repository was added to the selected list 
    resource isolated function put orgs/[string org]/dependabot/secrets/[string secretName]/repositories/[int repositoryId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/dependabot/secrets/[secretName]/repositories/[repositoryId].put(headers);
    }

    # Remove selected repository from an organization secret
    #
    # + org - The organization name. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response when repository was removed from the selected list 
    resource isolated function delete orgs/[string org]/dependabot/secrets/[string secretName]/repositories/[int repositoryId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/dependabot/secrets/[secretName]/repositories/[repositoryId].delete(headers);
    }

    # Get list of conflicting packages during Docker migration for organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/docker/conflicts(map<string|string[]> headers = {}) returns oas:Package[]|error {
        return self.genClient->/orgs/[org]/docker/conflicts.get(headers);
    }

    # List public organization events
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/events(map<string|string[]> headers = {}, *oas:ActivityListPublicOrgEventsQueries queries) returns oas:Event[]|error {
        return self.genClient->/orgs/[org]/events.get(headers, queries);
    }

    # List failed organization invitations
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/failed_invitations(map<string|string[]> headers = {}, *oas:OrgsListFailedInvitationsQueries queries) returns oas:OrganizationInvitation[]|error {
        return self.genClient->/orgs/[org]/failed_invitations.get(headers, queries);
    }

    # List organization webhooks
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/hooks(map<string|string[]> headers = {}, *oas:OrgsListWebhooksQueries queries) returns oas:OrgHook[]|error {
        return self.genClient->/orgs/[org]/hooks.get(headers, queries);
    }

    # Create an organization webhook
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post orgs/[string org]/hooks(oas:OrgHooksBody payload, map<string|string[]> headers = {}) returns oas:OrgHook|error {
        return self.genClient->/orgs/[org]/hooks.post(payload, headers);
    }

    # Get an organization webhook
    #
    # + org - The organization name. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/hooks/[int hookId](map<string|string[]> headers = {}) returns oas:OrgHook|error {
        return self.genClient->/orgs/[org]/hooks/[hookId].get(headers);
    }

    # Delete an organization webhook
    #
    # + org - The organization name. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/hooks/[int hookId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/hooks/[hookId].delete(headers);
    }

    # Update an organization webhook
    #
    # + org - The organization name. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch orgs/[string org]/hooks/[int hookId](oas:HookshookIdBody payload, map<string|string[]> headers = {}) returns oas:OrgHook|error {
        return self.genClient->/orgs/[org]/hooks/[hookId].patch(payload, headers);
    }

    # Get a webhook configuration for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/hooks/[int hookId]/config(map<string|string[]> headers = {}) returns oas:WebhookConfig|error {
        return self.genClient->/orgs/[org]/hooks/[hookId]/config.get(headers);
    }

    # Update a webhook configuration for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch orgs/[string org]/hooks/[int hookId]/config(oas:HookConfigBody payload, map<string|string[]> headers = {}) returns oas:WebhookConfig|error {
        return self.genClient->/orgs/[org]/hooks/[hookId]/config.patch(payload, headers);
    }

    # List deliveries for an organization webhook
    #
    # + org - The organization name. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/hooks/[int hookId]/deliveries(map<string|string[]> headers = {}, *oas:OrgsListWebhookDeliveriesQueries queries) returns oas:HookDeliveryItem[]|error {
        return self.genClient->/orgs/[org]/hooks/[hookId]/deliveries.get(headers, queries);
    }

    # Get a webhook delivery for an organization webhook
    #
    # + org - The organization name. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/hooks/[int hookId]/deliveries/[int deliveryId](map<string|string[]> headers = {}) returns oas:HookDelivery|error {
        return self.genClient->/orgs/[org]/hooks/[hookId]/deliveries/[deliveryId].get(headers);
    }

    # Redeliver a delivery for an organization webhook
    #
    # + org - The organization name. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + return - Accepted 
    resource isolated function post orgs/[string org]/hooks/[int hookId]/deliveries/[int deliveryId]/attempts(map<string|string[]> headers = {}) returns record {}|error {
        return self.genClient->/orgs/[org]/hooks/[hookId]/deliveries/[deliveryId]/attempts.post(headers);
    }

    # Ping an organization webhook
    #
    # + org - The organization name. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post orgs/[string org]/hooks/[int hookId]/pings(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/hooks/[hookId]/pings.post(headers);
    }

    # Get an organization installation for the authenticated app
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/installation(map<string|string[]> headers = {}) returns oas:Installation|error {
        return self.genClient->/orgs/[org]/installation.get(headers);
    }

    # List app installations for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/installations(map<string|string[]> headers = {}, *oas:OrgsListAppInstallationsQueries queries) returns oas:InstallationResponse|error {
        return self.genClient->/orgs/[org]/installations.get(headers, queries);
    }

    # Get interaction restrictions for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/interaction\-limits(map<string|string[]> headers = {}) returns oas:InteractionLimitResponseAny|error {
        return self.genClient->/orgs/[org]/interaction\-limits.get(headers);
    }

    # Set interaction restrictions for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put orgs/[string org]/interaction\-limits(oas:InteractionLimit payload, map<string|string[]> headers = {}) returns oas:InteractionLimitResponse|error {
        return self.genClient->/orgs/[org]/interaction\-limits.put(payload, headers);
    }

    # Remove interaction restrictions for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/interaction\-limits(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/interaction\-limits.delete(headers);
    }

    # List pending organization invitations
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/invitations(map<string|string[]> headers = {}, *oas:OrgsListPendingInvitationsQueries queries) returns oas:OrganizationInvitation[]|error {
        return self.genClient->/orgs/[org]/invitations.get(headers, queries);
    }

    # Create an organization invitation
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post orgs/[string org]/invitations(oas:OrgInvitationsBody payload, map<string|string[]> headers = {}) returns oas:OrganizationInvitation|error {
        return self.genClient->/orgs/[org]/invitations.post(payload, headers);
    }

    # Cancel an organization invitation
    #
    # + org - The organization name. The name is not case sensitive
    # + invitationId - The unique identifier of the invitation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/invitations/[int invitationId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/invitations/[invitationId].delete(headers);
    }

    # List organization invitation teams
    #
    # + org - The organization name. The name is not case sensitive
    # + invitationId - The unique identifier of the invitation
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/invitations/[int invitationId]/teams(map<string|string[]> headers = {}, *oas:OrgsListInvitationTeamsQueries queries) returns oas:Team[]|error {
        return self.genClient->/orgs/[org]/invitations/[invitationId]/teams.get(headers, queries);
    }

    # List organization issues assigned to the authenticated user
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/issues(map<string|string[]> headers = {}, *oas:IssuesListForOrgQueries queries) returns oas:Issue[]|error {
        return self.genClient->/orgs/[org]/issues.get(headers, queries);
    }

    # List organization members
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/members(map<string|string[]> headers = {}, *oas:OrgsListMembersQueries queries) returns oas:SimpleUser[]|error {
        return self.genClient->/orgs/[org]/members.get(headers, queries);
    }

    # Check organization membership for a user
    #
    # + org - The organization name. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response if requester is an organization member and user is a member 
    resource isolated function get orgs/[string org]/members/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/members/[username].get(headers);
    }

    # Remove an organization member
    #
    # + org - The organization name. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/members/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/members/[username].delete(headers);
    }

    # List codespaces for a user in organization
    #
    # + org - The organization name. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/members/[string username]/codespaces(map<string|string[]> headers = {}, *oas:CodespacesGetCodespacesForUserInOrgQueries queries) returns oas:CodespaceResponse|error? {
        return self.genClient->/orgs/[org]/members/[username]/codespaces.get(headers, queries);
    }

    # Delete a codespace from the organization
    #
    # + org - The organization name. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + codespaceName - The name of the codespace
    # + headers - Headers to be sent with the request 
    # + return - Accepted 
    resource isolated function delete orgs/[string org]/members/[string username]/codespaces/[string codespaceName](map<string|string[]> headers = {}) returns record {}|error? {
        return self.genClient->/orgs/[org]/members/[username]/codespaces/[codespaceName].delete(headers);
    }

    # Stop a codespace for an organization user
    #
    # + org - The organization name. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + codespaceName - The name of the codespace
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post orgs/[string org]/members/[string username]/codespaces/[string codespaceName]/stop(map<string|string[]> headers = {}) returns oas:Codespace|error? {
        return self.genClient->/orgs/[org]/members/[username]/codespaces/[codespaceName]/stop.post(headers);
    }

    # Get Copilot for Business seat assignment details for a user
    #
    # + org - The organization name. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - The user's GitHub Copilot seat details, including usage 
    resource isolated function get orgs/[string org]/members/[string username]/copilot(map<string|string[]> headers = {}) returns oas:CopilotSeatDetails|error {
        return self.genClient->/orgs/[org]/members/[username]/copilot.get(headers);
    }

    # Get organization membership for a user
    #
    # + org - The organization name. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/memberships/[string username](map<string|string[]> headers = {}) returns oas:OrgMembership|error {
        return self.genClient->/orgs/[org]/memberships/[username].get(headers);
    }

    # Set organization membership for a user
    #
    # + org - The organization name. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put orgs/[string org]/memberships/[string username](oas:MembershipsusernameBody payload, map<string|string[]> headers = {}) returns oas:OrgMembership|error {
        return self.genClient->/orgs/[org]/memberships/[username].put(payload, headers);
    }

    # Remove organization membership for a user
    #
    # + org - The organization name. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/memberships/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/memberships/[username].delete(headers);
    }

    # List organization migrations
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/migrations(map<string|string[]> headers = {}, *oas:MigrationsListForOrgQueries queries) returns oas:Migration[]|error {
        return self.genClient->/orgs/[org]/migrations.get(headers, queries);
    }

    # Start an organization migration
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post orgs/[string org]/migrations(oas:OrgMigrationsBody payload, map<string|string[]> headers = {}) returns oas:Migration|error {
        return self.genClient->/orgs/[org]/migrations.post(payload, headers);
    }

    # Get an organization migration status
    #
    # + org - The organization name. The name is not case sensitive
    # + migrationId - The unique identifier of the migration
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - *   pending, which means the migration hasn't started yet. *   exporting, which means the migration is in progress. *   exported, which means the migration finished successfully. *   failed, which means the migration failed 
    resource isolated function get orgs/[string org]/migrations/[int migrationId](map<string|string[]> headers = {}, *oas:MigrationsGetStatusForOrgQueries queries) returns oas:Migration|error {
        return self.genClient->/orgs/[org]/migrations/[migrationId].get(headers, queries);
    }

    # Download an organization migration archive
    #
    # + org - The organization name. The name is not case sensitive
    # + migrationId - The unique identifier of the migration
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/migrations/[int migrationId]/archive(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/migrations/[migrationId]/archive.get(headers);
    }

    # Delete an organization migration archive
    #
    # + org - The organization name. The name is not case sensitive
    # + migrationId - The unique identifier of the migration
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/migrations/[int migrationId]/archive(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/migrations/[migrationId]/archive.delete(headers);
    }

    # Unlock an organization repository
    #
    # + org - The organization name. The name is not case sensitive
    # + migrationId - The unique identifier of the migration
    # + repoName - repo_name parameter
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/migrations/[int migrationId]/repos/[string repoName]/'lock(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/migrations/[migrationId]/repos/[repoName]/'lock.delete(headers);
    }

    # List repositories in an organization migration
    #
    # + org - The organization name. The name is not case sensitive
    # + migrationId - The unique identifier of the migration
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/migrations/[int migrationId]/repositories(map<string|string[]> headers = {}, *oas:MigrationsListReposForOrgQueries queries) returns oas:MinimalRepository[]|error {
        return self.genClient->/orgs/[org]/migrations/[migrationId]/repositories.get(headers, queries);
    }

    # List outside collaborators for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/outside_collaborators(map<string|string[]> headers = {}, *oas:OrgsListOutsideCollaboratorsQueries queries) returns oas:SimpleUser[]|error {
        return self.genClient->/orgs/[org]/outside_collaborators.get(headers, queries);
    }

    # Convert an organization member to outside collaborator
    #
    # + org - The organization name. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - User is getting converted asynchronously 
    resource isolated function put orgs/[string org]/outside_collaborators/[string username](oas:OutsideCollaboratorsusernameBody payload, map<string|string[]> headers = {}) returns record {||}|error? {
        return self.genClient->/orgs/[org]/outside_collaborators/[username].put(payload, headers);
    }

    # Remove outside collaborator from an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/outside_collaborators/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/outside_collaborators/[username].delete(headers);
    }

    # List packages for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/packages(map<string|string[]> headers = {}, *oas:PackagesListPackagesForOrganizationQueries queries) returns oas:Package[]|error {
        return self.genClient->/orgs/[org]/packages.get(headers, queries);
    }

    # Get a package for an organization
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName](map<string|string[]> headers = {}) returns oas:Package|error {
        return self.genClient->/orgs/[org]/packages/[packageType]/[packageName].get(headers);
    }

    # Delete a package for an organization
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/packages/[packageType]/[packageName].delete(headers);
    }

    # Restore a package for an organization
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function post orgs/[string org]/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName]/restore(map<string|string[]> headers = {}, *oas:PackagesRestorePackageForOrgQueries queries) returns error? {
        return self.genClient->/orgs/[org]/packages/[packageType]/[packageName]/restore.post(headers, queries);
    }

    # List package versions for a package owned by an organization
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName]/versions(map<string|string[]> headers = {}, *oas:PackagesGetAllPackageVersionsForPackageOwnedByOrgQueries queries) returns oas:PackageVersion[]|error {
        return self.genClient->/orgs/[org]/packages/[packageType]/[packageName]/versions.get(headers, queries);
    }

    # Get a package version for an organization
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + org - The organization name. The name is not case sensitive
    # + packageVersionId - Unique identifier of the package version
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName]/versions/[int packageVersionId](map<string|string[]> headers = {}) returns oas:PackageVersion|error {
        return self.genClient->/orgs/[org]/packages/[packageType]/[packageName]/versions/[packageVersionId].get(headers);
    }

    # Delete package version for an organization
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + org - The organization name. The name is not case sensitive
    # + packageVersionId - Unique identifier of the package version
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName]/versions/[int packageVersionId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/packages/[packageType]/[packageName]/versions/[packageVersionId].delete(headers);
    }

    # Restore package version for an organization
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + org - The organization name. The name is not case sensitive
    # + packageVersionId - Unique identifier of the package version
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post orgs/[string org]/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName]/versions/[int packageVersionId]/restore(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/packages/[packageType]/[packageName]/versions/[packageVersionId]/restore.post(headers);
    }

    # List requests to access organization resources with fine-grained personal access tokens
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Internal Error 
    resource isolated function get orgs/[string org]/personal\-access\-token\-requests(map<string|string[]> headers = {}, *oas:OrgsListPatGrantRequestsQueries queries) returns oas:OrganizationProgrammaticAccessGrantRequest[]|error {
        return self.genClient->/orgs/[org]/personal\-access\-token\-requests.get(headers, queries);
    }

    # Review requests to access organization resources with fine-grained personal access tokens
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Internal Error 
    resource isolated function post orgs/[string org]/personal\-access\-token\-requests(oas:OrgPersonalAccessTokenRequestsBody payload, map<string|string[]> headers = {}) returns record {}|error {
        return self.genClient->/orgs/[org]/personal\-access\-token\-requests.post(payload, headers);
    }

    # Update the access a fine-grained personal access token has to organization resources
    #
    # + org - The organization name. The name is not case sensitive
    # + patId - The unique identifier of the fine-grained personal access token
    # + headers - Headers to be sent with the request 
    # + return - Internal Error 
    resource isolated function post orgs/[string org]/personal\-access\-token\-requests/[int patRequestId](oas:PersonalAccessTokenRequestspatRequestIdBody payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/personal\-access\-token\-requests/[patRequestId].post(payload, headers);
    }

    # List repositories a fine-grained personal access token has access to
    #
    # + org - The organization name. The name is not case sensitive
    # + patId - Unique identifier of the fine-grained personal access token
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Internal Error 
    resource isolated function get orgs/[string org]/personal\-access\-token\-requests/[int patRequestId]/repositories(map<string|string[]> headers = {}, *oas:OrgsListPatGrantRequestRepositoriesQueries queries) returns oas:MinimalRepository[]|error {
        return self.genClient->/orgs/[org]/personal\-access\-token\-requests/[patRequestId]/repositories.get(headers, queries);
    }

    # List fine-grained personal access tokens with access to organization resources
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Internal Error 
    resource isolated function get orgs/[string org]/personal\-access\-tokens(map<string|string[]> headers = {}, *oas:OrgsListPatGrantsQueries queries) returns oas:OrganizationProgrammaticAccessGrant[]|error {
        return self.genClient->/orgs/[org]/personal\-access\-tokens.get(headers, queries);
    }

    # Update the access to organization resources via fine-grained personal access tokens
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Internal Error 
    resource isolated function post orgs/[string org]/personal\-access\-tokens(oas:OrgPersonalAccessTokensBody payload, map<string|string[]> headers = {}) returns record {}|error {
        return self.genClient->/orgs/[org]/personal\-access\-tokens.post(payload, headers);
    }

    # Update the access a fine-grained personal access token has to organization resources
    #
    # + org - The organization name. The name is not case sensitive
    # + patId - The unique identifier of the fine-grained personal access token
    # + headers - Headers to be sent with the request 
    # + return - Internal Error 
    resource isolated function post orgs/[string org]/personal\-access\-tokens/[int patId](oas:PersonalAccessTokenspatIdBody payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/personal\-access\-tokens/[patId].post(payload, headers);
    }

    # List repositories a fine-grained personal access token has access to
    #
    # + org - The organization name. The name is not case sensitive
    # + patId - Unique identifier of the fine-grained personal access token
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Internal Error 
    resource isolated function get orgs/[string org]/personal\-access\-tokens/[int patId]/repositories(map<string|string[]> headers = {}, *oas:OrgsListPatGrantRepositoriesQueries queries) returns oas:MinimalRepository[]|error {
        return self.genClient->/orgs/[org]/personal\-access\-tokens/[patId]/repositories.get(headers, queries);
    }

    # List public organization members
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/public_members(map<string|string[]> headers = {}, *oas:OrgsListPublicMembersQueries queries) returns oas:SimpleUser[]|error {
        return self.genClient->/orgs/[org]/public_members.get(headers, queries);
    }

    # Check public organization membership for a user
    #
    # + org - The organization name. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response if user is a public member 
    resource isolated function get orgs/[string org]/public_members/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/public_members/[username].get(headers);
    }

    # Set public organization membership for the authenticated user
    #
    # + org - The organization name. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put orgs/[string org]/public_members/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/public_members/[username].put(headers);
    }

    # Remove public organization membership for the authenticated user
    #
    # + org - The organization name. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/public_members/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/public_members/[username].delete(headers);
    }

    # List organization repositories
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/repos(map<string|string[]> headers = {}, *oas:ReposListForOrgQueries queries) returns oas:MinimalRepository[]|error {
        return self.genClient->/orgs/[org]/repos.get(headers, queries);
    }

    # Create an organization repository
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post orgs/[string org]/repos(oas:OrgReposBody payload, map<string|string[]> headers = {}) returns oas:Repository|error {
        return self.genClient->/orgs/[org]/repos.post(payload, headers);
    }

    # Get all organization repository rulesets
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/rulesets(map<string|string[]> headers = {}, *oas:ReposGetOrgRulesetsQueries queries) returns oas:RepositoryRuleset[]|error {
        return self.genClient->/orgs/[org]/rulesets.get(headers, queries);
    }

    # Create an organization repository ruleset
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + payload - Request body 
    # + return - Response 
    resource isolated function post orgs/[string org]/rulesets(oas:OrgRulesetsBody payload, map<string|string[]> headers = {}) returns oas:RepositoryRuleset|error {
        return self.genClient->/orgs/[org]/rulesets.post(payload, headers);
    }

    # Get an organization rule suite
    #
    # + org - The organization name. The name is not case sensitive
    # + ruleSuiteId - The unique identifier of the rule suite result.
    # To get this ID, you can use [GET /repos/{owner}/{repo}/rulesets/rule-suites](https://docs.github.com/rest/repos/rule-suites#list-repository-rule-suites)
    # for repositories and [GET /orgs/{org}/rulesets/rule-suites](https://docs.github.com/rest/orgs/rule-suites#list-organization-rule-suites)
    # for organizations
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/rulesets/rule\-suites/[int ruleSuiteId](map<string|string[]> headers = {}) returns oas:RuleSuite|error {
        return self.genClient->/orgs/[org]/rulesets/rule\-suites/[ruleSuiteId].get(headers);
    }

    # Get an organization repository ruleset
    #
    # + org - The organization name. The name is not case sensitive
    # + rulesetId - The ID of the ruleset
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/rulesets/[int rulesetId](map<string|string[]> headers = {}) returns oas:RepositoryRuleset|error {
        return self.genClient->/orgs/[org]/rulesets/[rulesetId].get(headers);
    }

    # Update an organization repository ruleset
    #
    # + org - The organization name. The name is not case sensitive
    # + rulesetId - The ID of the ruleset
    # + headers - Headers to be sent with the request 
    # + payload - Request body 
    # + return - Response 
    resource isolated function put orgs/[string org]/rulesets/[int rulesetId](oas:RulesetsrulesetIdBody payload, map<string|string[]> headers = {}) returns oas:RepositoryRuleset|error {
        return self.genClient->/orgs/[org]/rulesets/[rulesetId].put(payload, headers);
    }

    # Delete an organization repository ruleset
    #
    # + org - The organization name. The name is not case sensitive
    # + rulesetId - The ID of the ruleset
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/rulesets/[int rulesetId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/rulesets/[rulesetId].delete(headers);
    }

    # List secret scanning alerts for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/secret\-scanning/alerts(map<string|string[]> headers = {}, *oas:SecretScanningListAlertsForOrgQueries queries) returns oas:OrganizationSecretScanningAlert[]|error {
        return self.genClient->/orgs/[org]/secret\-scanning/alerts.get(headers, queries);
    }

    # List repository security advisories for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/security\-advisories(map<string|string[]> headers = {}, *oas:SecurityAdvisoriesListOrgRepositoryAdvisoriesQueries queries) returns oas:RepositoryAdvisory[]|error {
        return self.genClient->/orgs/[org]/security\-advisories.get(headers, queries);
    }

    # List security manager teams
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/security\-managers(map<string|string[]> headers = {}) returns oas:TeamSimple[]|error {
        return self.genClient->/orgs/[org]/security\-managers.get(headers);
    }

    # Add a security manager team
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put orgs/[string org]/security\-managers/teams/[string teamSlug](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/security\-managers/teams/[teamSlug].put(headers);
    }

    # Remove a security manager team
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/security\-managers/teams/[string teamSlug](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/security\-managers/teams/[teamSlug].delete(headers);
    }

    # Get GitHub Actions billing for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/settings/billing/actions(map<string|string[]> headers = {}) returns oas:ActionsBillingUsage|error {
        return self.genClient->/orgs/[org]/settings/billing/actions.get(headers);
    }

    # Get GitHub Packages billing for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/settings/billing/packages(map<string|string[]> headers = {}) returns oas:PackagesBillingUsage|error {
        return self.genClient->/orgs/[org]/settings/billing/packages.get(headers);
    }

    # Get shared storage billing for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/settings/billing/shared\-storage(map<string|string[]> headers = {}) returns oas:CombinedBillingUsage|error {
        return self.genClient->/orgs/[org]/settings/billing/shared\-storage.get(headers);
    }

    # List teams
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/teams(map<string|string[]> headers = {}, *oas:TeamsListQueries queries) returns oas:Team[]|error {
        return self.genClient->/orgs/[org]/teams.get(headers, queries);
    }

    # Create a team
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post orgs/[string org]/teams(oas:OrgTeamsBody payload, map<string|string[]> headers = {}) returns oas:TeamFull|error {
        return self.genClient->/orgs/[org]/teams.post(payload, headers);
    }

    # Get a team by name
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/teams/[string teamSlug](map<string|string[]> headers = {}) returns oas:TeamFull|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug].get(headers);
    }

    # Delete a team
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/teams/[string teamSlug](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/teams/[teamSlug].delete(headers);
    }

    # Update a team
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + headers - Headers to be sent with the request 
    # + return - Response when the updated information already exists 
    resource isolated function patch orgs/[string org]/teams/[string teamSlug](oas:TeamsteamSlugBody payload, map<string|string[]> headers = {}) returns oas:TeamFull|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug].patch(payload, headers);
    }

    # List discussions
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/teams/[string teamSlug]/discussions(map<string|string[]> headers = {}, *oas:TeamsListDiscussionsInOrgQueries queries) returns oas:TeamDiscussion[]|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/discussions.get(headers, queries);
    }

    # Create a discussion
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post orgs/[string org]/teams/[string teamSlug]/discussions(oas:TeamSlugDiscussionsBody payload, map<string|string[]> headers = {}) returns oas:TeamDiscussion|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/discussions.post(payload, headers);
    }

    # Get a discussion
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + discussionNumber - The number that identifies the discussion
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/teams/[string teamSlug]/discussions/[int discussionNumber](map<string|string[]> headers = {}) returns oas:TeamDiscussion|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/discussions/[discussionNumber].get(headers);
    }

    # Delete a discussion
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + discussionNumber - The number that identifies the discussion
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/teams/[string teamSlug]/discussions/[int discussionNumber](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/discussions/[discussionNumber].delete(headers);
    }

    # Update a discussion
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + discussionNumber - The number that identifies the discussion
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch orgs/[string org]/teams/[string teamSlug]/discussions/[int discussionNumber](oas:DiscussionsdiscussionNumberBody payload, map<string|string[]> headers = {}) returns oas:TeamDiscussion|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/discussions/[discussionNumber].patch(payload, headers);
    }

    # List discussion comments
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + discussionNumber - The number that identifies the discussion
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/teams/[string teamSlug]/discussions/[int discussionNumber]/comments(map<string|string[]> headers = {}, *oas:TeamsListDiscussionCommentsInOrgQueries queries) returns oas:TeamDiscussionComment[]|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/discussions/[discussionNumber]/comments.get(headers, queries);
    }

    # Create a discussion comment
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + discussionNumber - The number that identifies the discussion
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post orgs/[string org]/teams/[string teamSlug]/discussions/[int discussionNumber]/comments(oas:DiscussionNumberCommentsBody payload, map<string|string[]> headers = {}) returns oas:TeamDiscussionComment|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/discussions/[discussionNumber]/comments.post(payload, headers);
    }

    # Get a discussion comment
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + discussionNumber - The number that identifies the discussion
    # + commentNumber - The number that identifies the comment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/teams/[string teamSlug]/discussions/[int discussionNumber]/comments/[int commentNumber](map<string|string[]> headers = {}) returns oas:TeamDiscussionComment|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/discussions/[discussionNumber]/comments/[commentNumber].get(headers);
    }

    # Delete a discussion comment
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + discussionNumber - The number that identifies the discussion
    # + commentNumber - The number that identifies the comment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/teams/[string teamSlug]/discussions/[int discussionNumber]/comments/[int commentNumber](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/discussions/[discussionNumber]/comments/[commentNumber].delete(headers);
    }

    # Update a discussion comment
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + discussionNumber - The number that identifies the discussion
    # + commentNumber - The number that identifies the comment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch orgs/[string org]/teams/[string teamSlug]/discussions/[int discussionNumber]/comments/[int commentNumber](oas:DiscussionNumberCommentsBody payload, map<string|string[]> headers = {}) returns oas:TeamDiscussionComment|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/discussions/[discussionNumber]/comments/[commentNumber].patch(payload, headers);
    }

    # List reactions for a team discussion comment
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + discussionNumber - The number that identifies the discussion
    # + commentNumber - The number that identifies the comment
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/teams/[string teamSlug]/discussions/[int discussionNumber]/comments/[int commentNumber]/reactions(map<string|string[]> headers = {}, *oas:ReactionsListForTeamDiscussionCommentInOrgQueries queries) returns oas:Reaction[]|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/discussions/[discussionNumber]/comments/[commentNumber]/reactions.get(headers, queries);
    }

    # Create reaction for a team discussion comment
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + discussionNumber - The number that identifies the discussion
    # + commentNumber - The number that identifies the comment
    # + headers - Headers to be sent with the request 
    # + return - Response when the reaction type has already been added to this team discussion comment 
    resource isolated function post orgs/[string org]/teams/[string teamSlug]/discussions/[int discussionNumber]/comments/[int commentNumber]/reactions(oas:CommentNumberReactionsBody payload, map<string|string[]> headers = {}) returns oas:Reaction|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/discussions/[discussionNumber]/comments/[commentNumber]/reactions.post(payload, headers);
    }

    # Delete team discussion comment reaction
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + discussionNumber - The number that identifies the discussion
    # + commentNumber - The number that identifies the comment
    # + reactionId - The unique identifier of the reaction
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/teams/[string teamSlug]/discussions/[int discussionNumber]/comments/[int commentNumber]/reactions/[int reactionId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/discussions/[discussionNumber]/comments/[commentNumber]/reactions/[reactionId].delete(headers);
    }

    # List reactions for a team discussion
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + discussionNumber - The number that identifies the discussion
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/teams/[string teamSlug]/discussions/[int discussionNumber]/reactions(map<string|string[]> headers = {}, *oas:ReactionsListForTeamDiscussionInOrgQueries queries) returns oas:Reaction[]|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/discussions/[discussionNumber]/reactions.get(headers, queries);
    }

    # Create reaction for a team discussion
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + discussionNumber - The number that identifies the discussion
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post orgs/[string org]/teams/[string teamSlug]/discussions/[int discussionNumber]/reactions(oas:DiscussionNumberReactionsBody payload, map<string|string[]> headers = {}) returns oas:Reaction|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/discussions/[discussionNumber]/reactions.post(payload, headers);
    }

    # Delete team discussion reaction
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + discussionNumber - The number that identifies the discussion
    # + reactionId - The unique identifier of the reaction
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/teams/[string teamSlug]/discussions/[int discussionNumber]/reactions/[int reactionId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/discussions/[discussionNumber]/reactions/[reactionId].delete(headers);
    }

    # List pending team invitations
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/teams/[string teamSlug]/invitations(map<string|string[]> headers = {}, *oas:TeamsListPendingInvitationsInOrgQueries queries) returns oas:OrganizationInvitation[]|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/invitations.get(headers, queries);
    }

    # List team members
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/teams/[string teamSlug]/members(map<string|string[]> headers = {}, *oas:TeamsListMembersInOrgQueries queries) returns oas:SimpleUser[]|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/members.get(headers, queries);
    }

    # Get team membership for a user
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/teams/[string teamSlug]/memberships/[string username](map<string|string[]> headers = {}) returns oas:TeamMembership|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/memberships/[username].get(headers);
    }

    # Add or update team membership for a user
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put orgs/[string org]/teams/[string teamSlug]/memberships/[string username](oas:MembershipsusernameBody1 payload, map<string|string[]> headers = {}) returns oas:TeamMembership|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/memberships/[username].put(payload, headers);
    }

    # Remove team membership for a user
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/teams/[string teamSlug]/memberships/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/memberships/[username].delete(headers);
    }

    # List team repositories
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get orgs/[string org]/teams/[string teamSlug]/repos(map<string|string[]> headers = {}, *oas:TeamsListReposInOrgQueries queries) returns oas:MinimalRepository[]|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/repos.get(headers, queries);
    }

    # Check team permissions for a repository
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Alternative response with repository permissions 
    resource isolated function get orgs/[string org]/teams/[string teamSlug]/repos/[string owner]/[string repo](map<string|string[]> headers = {}) returns oas:TeamRepository|error? {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/repos/[owner]/[repo].get(headers);
    }

    # Add or update team repository permissions
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put orgs/[string org]/teams/[string teamSlug]/repos/[string owner]/[string repo](oas:OwnerrepoBody payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/repos/[owner]/[repo].put(payload, headers);
    }

    # Remove a repository from a team
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete orgs/[string org]/teams/[string teamSlug]/repos/[string owner]/[string repo](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/repos/[owner]/[repo].delete(headers);
    }

    # List child teams
    #
    # + org - The organization name. The name is not case sensitive
    # + teamSlug - The slug of the team name
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - if child teams exist 
    resource isolated function get orgs/[string org]/teams/[string teamSlug]/teams(map<string|string[]> headers = {}, *oas:TeamsListChildInOrgQueries queries) returns oas:Team[]|error {
        return self.genClient->/orgs/[org]/teams/[teamSlug]/teams.get(headers, queries);
    }

    # Enable or disable a security feature for an organization
    #
    # + org - The organization name. The name is not case sensitive
    # + securityProduct - The security feature to enable or disable
    # + enablement - The action to take.
    # enable_all means to enable the specified security feature for all repositories in the organization.
    # disable_all means to disable the specified security feature for all repositories in the organization
    # + headers - Headers to be sent with the request 
    # + return - Action started 
    resource isolated function post orgs/[string org]/["dependency_graph"|"dependabot_alerts"|"dependabot_security_updates"|"advanced_security"|"code_scanning_default_setup"|"secret_scanning"|"secret_scanning_push_protection" securityProduct]/["enable_all"|"disable_all" enablement](oas:SecurityProductenablementBody payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/orgs/[org]/[securityProduct]/[enablement].post(payload, headers);
    }

    # Get rate limit status for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get rate_limit(map<string|string[]> headers = {}) returns oas:RateLimitOverview|error? {
        return self.genClient->/rate_limit.get(headers);
    }

    # Get a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo](map<string|string[]> headers = {}) returns oas:FullRepository|error {
        return self.genClient->/repos/[owner]/[repo].get(headers);
    }

    # Delete a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo].delete(headers);
    }

    # Update a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo](oas:OwnerrepoBody1 payload, map<string|string[]> headers = {}) returns oas:FullRepository|error {
        return self.genClient->/repos/[owner]/[repo].patch(payload, headers);
    }

    # List artifacts for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/artifacts(map<string|string[]> headers = {}, *oas:ActionsListArtifactsForRepoQueries queries) returns oas:ArtifactResponse|error {
        return self.genClient->/repos/[owner]/[repo]/actions/artifacts.get(headers, queries);
    }

    # Get an artifact
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + artifactId - The unique identifier of the artifact
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/artifacts/[int artifactId](map<string|string[]> headers = {}) returns oas:Artifact|error {
        return self.genClient->/repos/[owner]/[repo]/actions/artifacts/[artifactId].get(headers);
    }

    # Delete an artifact
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + artifactId - The unique identifier of the artifact
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/actions/artifacts/[int artifactId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/artifacts/[artifactId].delete(headers);
    }

    # Download an artifact
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + artifactId - The unique identifier of the artifact
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/artifacts/[int artifactId]/[string archiveFormat](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/artifacts/[artifactId]/[archiveFormat].get(headers);
    }

    # Get GitHub Actions cache usage for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/cache/usage(map<string|string[]> headers = {}) returns oas:ActionsCacheUsageByRepository|error {
        return self.genClient->/repos/[owner]/[repo]/actions/cache/usage.get(headers);
    }

    # List GitHub Actions caches for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/caches(map<string|string[]> headers = {}, *oas:ActionsGetActionsCacheListQueries queries) returns oas:ActionsCacheList|error {
        return self.genClient->/repos/[owner]/[repo]/actions/caches.get(headers, queries);
    }

    # Delete GitHub Actions caches for a repository (using a cache key)
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/actions/caches(map<string|string[]> headers = {}, *oas:ActionsDeleteActionsCacheByKeyQueries queries) returns oas:ActionsCacheList|error {
        return self.genClient->/repos/[owner]/[repo]/actions/caches.delete(headers, queries);
    }

    # Delete a GitHub Actions cache for a repository (using a cache ID)
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + cacheId - The unique identifier of the GitHub Actions cache
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/actions/caches/[int cacheId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/caches/[cacheId].delete(headers);
    }

    # Get a job for a workflow run
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + jobId - The unique identifier of the job
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/jobs/[int jobId](map<string|string[]> headers = {}) returns oas:Job|error {
        return self.genClient->/repos/[owner]/[repo]/actions/jobs/[jobId].get(headers);
    }

    # Download job logs for a workflow run
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + jobId - The unique identifier of the job
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/jobs/[int jobId]/logs(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/jobs/[jobId]/logs.get(headers);
    }

    # Re-run a job from a workflow run
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + jobId - The unique identifier of the job
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/actions/jobs/[int jobId]/rerun(oas:JobIdRerunBody payload, map<string|string[]> headers = {}) returns oas:EmptyObject|error {
        return self.genClient->/repos/[owner]/[repo]/actions/jobs/[jobId]/rerun.post(payload, headers);
    }

    # Get the customization template for an OIDC subject claim for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Status response 
    resource isolated function get repos/[string owner]/[string repo]/actions/oidc/customization/sub(map<string|string[]> headers = {}) returns oas:OidcCustomSubRepo|error {
        return self.genClient->/repos/[owner]/[repo]/actions/oidc/customization/sub.get(headers);
    }

    # Set the customization template for an OIDC subject claim for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Empty response 
    resource isolated function put repos/[string owner]/[string repo]/actions/oidc/customization/sub(oas:ActionsOIDCSubjectCustomizationForARepository payload, map<string|string[]> headers = {}) returns oas:EmptyObject|error {
        return self.genClient->/repos/[owner]/[repo]/actions/oidc/customization/sub.put(payload, headers);
    }

    # List repository organization secrets
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/organization\-secrets(map<string|string[]> headers = {}, *oas:ActionsListRepoOrganizationSecretsQueries queries) returns oas:ActionsSecretResponse|error {
        return self.genClient->/repos/[owner]/[repo]/actions/organization\-secrets.get(headers, queries);
    }

    # List repository organization variables
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/organization\-variables(map<string|string[]> headers = {}, *oas:ActionsListRepoOrganizationVariablesQueries queries) returns oas:ActionsVariableResponse|error {
        return self.genClient->/repos/[owner]/[repo]/actions/organization\-variables.get(headers, queries);
    }

    # Get GitHub Actions permissions for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/permissions(map<string|string[]> headers = {}) returns oas:ActionsRepositoryPermissions|error {
        return self.genClient->/repos/[owner]/[repo]/actions/permissions.get(headers);
    }

    # Set GitHub Actions permissions for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/actions/permissions(oas:ActionsPermissionsBody1 payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/permissions.put(payload, headers);
    }

    # Get the level of access for workflows outside of the repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/permissions/access(map<string|string[]> headers = {}) returns oas:ActionsWorkflowAccessToRepository|error {
        return self.genClient->/repos/[owner]/[repo]/actions/permissions/access.get(headers);
    }

    # Set the level of access for workflows outside of the repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/actions/permissions/access(oas:ActionsWorkflowAccessToRepository payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/permissions/access.put(payload, headers);
    }

    # Get allowed actions and reusable workflows for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/permissions/selected\-actions(map<string|string[]> headers = {}) returns oas:SelectedActions|error {
        return self.genClient->/repos/[owner]/[repo]/actions/permissions/selected\-actions.get(headers);
    }

    # Set allowed actions and reusable workflows for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/actions/permissions/selected\-actions(oas:SelectedActions payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/permissions/selected\-actions.put(payload, headers);
    }

    # Get default workflow permissions for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/permissions/workflow(map<string|string[]> headers = {}) returns oas:ActionsGetDefaultWorkflowPermissions|error {
        return self.genClient->/repos/[owner]/[repo]/actions/permissions/workflow.get(headers);
    }

    # Set default workflow permissions for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Success response 
    resource isolated function put repos/[string owner]/[string repo]/actions/permissions/workflow(oas:ActionsSetDefaultWorkflowPermissions payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/permissions/workflow.put(payload, headers);
    }

    # List self-hosted runners for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/runners(map<string|string[]> headers = {}, *oas:ActionsListSelfHostedRunnersForRepoQueries queries) returns oas:RunnerResponse|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runners.get(headers, queries);
    }

    # Get a self-hosted runner for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runnerId - Unique identifier of the self-hosted runner
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/runners/[int runnerId](map<string|string[]> headers = {}) returns oas:Runner|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runners/[runnerId].get(headers);
    }

    # Delete a self-hosted runner from a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runnerId - Unique identifier of the self-hosted runner
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/actions/runners/[int runnerId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/runners/[runnerId].delete(headers);
    }

    # List labels for a self-hosted runner for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runnerId - Unique identifier of the self-hosted runner
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/runners/[int runnerId]/labels(map<string|string[]> headers = {}) returns oas:RunnerLabelResponse|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runners/[runnerId]/labels.get(headers);
    }

    # Set custom labels for a self-hosted runner for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runnerId - Unique identifier of the self-hosted runner
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/actions/runners/[int runnerId]/labels(oas:RunnerIdLabelsBody payload, map<string|string[]> headers = {}) returns oas:RunnerLabelResponse|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runners/[runnerId]/labels.put(payload, headers);
    }

    # Add custom labels to a self-hosted runner for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runnerId - Unique identifier of the self-hosted runner
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/actions/runners/[int runnerId]/labels(oas:RunnerIdLabelsBody1 payload, map<string|string[]> headers = {}) returns oas:RunnerLabelResponse|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runners/[runnerId]/labels.post(payload, headers);
    }

    # Remove all custom labels from a self-hosted runner for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runnerId - Unique identifier of the self-hosted runner
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/actions/runners/[int runnerId]/labels(map<string|string[]> headers = {}) returns oas:RunnerLabelResponse|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runners/[runnerId]/labels.delete(headers);
    }

    # Remove a custom label from a self-hosted runner for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runnerId - Unique identifier of the self-hosted runner
    # + name - The name of a self-hosted runner's custom label
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/actions/runners/[int runnerId]/labels/[string name](map<string|string[]> headers = {}) returns oas:RunnerLabelResponse|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runners/[runnerId]/labels/[name].delete(headers);
    }

    # List workflow runs for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/runs(map<string|string[]> headers = {}, *oas:ActionsListWorkflowRunsForRepoQueries queries) returns oas:WorkflowRunResponse|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runs.get(headers, queries);
    }

    # Get a workflow run
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/runs/[int runId](map<string|string[]> headers = {}, *oas:ActionsGetWorkflowRunQueries queries) returns oas:WorkflowRun|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId].get(headers, queries);
    }

    # Delete a workflow run
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/actions/runs/[int runId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId].delete(headers);
    }

    # Get the review history for a workflow run
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/runs/[int runId]/approvals(map<string|string[]> headers = {}) returns oas:EnvironmentApprovals[]|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId]/approvals.get(headers);
    }

    # Approve a workflow run for a fork pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/actions/runs/[int runId]/approve(map<string|string[]> headers = {}) returns oas:EmptyObject|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId]/approve.post(headers);
    }

    # List workflow run artifacts
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/runs/[int runId]/artifacts(map<string|string[]> headers = {}, *oas:ActionsListWorkflowRunArtifactsQueries queries) returns oas:ArtifactResponse|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId]/artifacts.get(headers, queries);
    }

    # Get a workflow run attempt
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + attemptNumber - The attempt number of the workflow run
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/runs/[int runId]/attempts/[int attemptNumber](map<string|string[]> headers = {}, *oas:ActionsGetWorkflowRunAttemptQueries queries) returns oas:WorkflowRun|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId]/attempts/[attemptNumber].get(headers, queries);
    }

    # List jobs for a workflow run attempt
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + attemptNumber - The attempt number of the workflow run
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/runs/[int runId]/attempts/[int attemptNumber]/jobs(map<string|string[]> headers = {}, *oas:ActionsListJobsForWorkflowRunAttemptQueries queries) returns oas:JobResponse|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId]/attempts/[attemptNumber]/jobs.get(headers, queries);
    }

    # Download workflow run attempt logs
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + attemptNumber - The attempt number of the workflow run
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/runs/[int runId]/attempts/[int attemptNumber]/logs(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId]/attempts/[attemptNumber]/logs.get(headers);
    }

    # Cancel a workflow run
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/actions/runs/[int runId]/cancel(map<string|string[]> headers = {}) returns oas:EmptyObject|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId]/cancel.post(headers);
    }

    # Review custom deployment protection rules for a workflow run
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/actions/runs/[int runId]/deployment_protection_rule(oas:RunIdDeploymentProtectionRuleBody payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId]/deployment_protection_rule.post(payload, headers);
    }

    # Force cancel a workflow run
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/actions/runs/[int runId]/force\-cancel(map<string|string[]> headers = {}) returns oas:EmptyObject|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId]/force\-cancel.post(headers);
    }

    # List jobs for a workflow run
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/runs/[int runId]/jobs(map<string|string[]> headers = {}, *oas:ActionsListJobsForWorkflowRunQueries queries) returns oas:JobResponse|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId]/jobs.get(headers, queries);
    }

    # Download workflow run logs
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/runs/[int runId]/logs(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId]/logs.get(headers);
    }

    # Delete workflow run logs
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/actions/runs/[int runId]/logs(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId]/logs.delete(headers);
    }

    # Get pending deployments for a workflow run
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/runs/[int runId]/pending_deployments(map<string|string[]> headers = {}) returns oas:PendingDeployment[]|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId]/pending_deployments.get(headers);
    }

    # Review pending deployments for a workflow run
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/actions/runs/[int runId]/pending_deployments(oas:RunIdPendingDeploymentsBody payload, map<string|string[]> headers = {}) returns oas:Deployment[]|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId]/pending_deployments.post(payload, headers);
    }

    # Re-run a workflow
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/actions/runs/[int runId]/rerun(oas:JobIdRerunBody payload, map<string|string[]> headers = {}) returns oas:EmptyObject|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId]/rerun.post(payload, headers);
    }

    # Re-run failed jobs from a workflow run
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/actions/runs/[int runId]/rerun\-failed\-jobs(oas:JobIdRerunBody payload, map<string|string[]> headers = {}) returns oas:EmptyObject|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId]/rerun\-failed\-jobs.post(payload, headers);
    }

    # Get workflow run usage
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + runId - The unique identifier of the workflow run
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/runs/[int runId]/timing(map<string|string[]> headers = {}) returns oas:WorkflowRunUsage|error {
        return self.genClient->/repos/[owner]/[repo]/actions/runs/[runId]/timing.get(headers);
    }

    # List repository secrets
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/secrets(map<string|string[]> headers = {}, *oas:ActionsListRepoSecretsQueries queries) returns oas:ActionsSecretResponse|error {
        return self.genClient->/repos/[owner]/[repo]/actions/secrets.get(headers, queries);
    }

    # Get a repository secret
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/secrets/[string secretName](map<string|string[]> headers = {}) returns oas:ActionsSecret|error {
        return self.genClient->/repos/[owner]/[repo]/actions/secrets/[secretName].get(headers);
    }

    # Create or update a repository secret
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response when creating a secret 
    resource isolated function put repos/[string owner]/[string repo]/actions/secrets/[string secretName](oas:SecretssecretNameBody3 payload, map<string|string[]> headers = {}) returns oas:EmptyObject|error? {
        return self.genClient->/repos/[owner]/[repo]/actions/secrets/[secretName].put(payload, headers);
    }

    # Delete a repository secret
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/actions/secrets/[string secretName](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/secrets/[secretName].delete(headers);
    }

    # List repository variables
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/variables(map<string|string[]> headers = {}, *oas:ActionsListRepoVariablesQueries queries) returns oas:ActionsVariableResponse|error {
        return self.genClient->/repos/[owner]/[repo]/actions/variables.get(headers, queries);
    }

    # Create a repository variable
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/actions/variables(oas:ActionsVariablesBody1 payload, map<string|string[]> headers = {}) returns oas:EmptyObject|error {
        return self.genClient->/repos/[owner]/[repo]/actions/variables.post(payload, headers);
    }

    # Get a repository variable
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + name - The name of the variable
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/variables/[string name](map<string|string[]> headers = {}) returns oas:ActionsVariable|error {
        return self.genClient->/repos/[owner]/[repo]/actions/variables/[name].get(headers);
    }

    # Delete a repository variable
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + name - The name of the variable
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/actions/variables/[string name](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/variables/[name].delete(headers);
    }

    # Update a repository variable
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + name - The name of the variable
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/actions/variables/[string name](oas:VariablesnameBody1 payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/variables/[name].patch(payload, headers);
    }

    # List repository workflows
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/workflows(map<string|string[]> headers = {}, *oas:ActionsListRepoWorkflowsQueries queries) returns oas:WorkflowResponse|error {
        return self.genClient->/repos/[owner]/[repo]/actions/workflows.get(headers, queries);
    }

    # Get a workflow
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + workflowId - The ID of the workflow. You can also pass the workflow file name as a string
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/workflows/[oas:workflowId workflowId](map<string|string[]> headers = {}) returns oas:Workflow|error {
        return self.genClient->/repos/[owner]/[repo]/actions/workflows/[workflowId].get(headers);
    }

    # Disable a workflow
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + workflowId - The ID of the workflow. You can also pass the workflow file name as a string
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/actions/workflows/[oas:workflowId workflowId]/disable(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/workflows/[workflowId]/disable.put(headers);
    }

    # Create a workflow dispatch event
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + workflowId - The ID of the workflow. You can also pass the workflow file name as a string
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/actions/workflows/[oas:workflowId workflowId]/dispatches(oas:WorkflowIdDispatchesBody payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/workflows/[workflowId]/dispatches.post(payload, headers);
    }

    # Enable a workflow
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + workflowId - The ID of the workflow. You can also pass the workflow file name as a string
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/actions/workflows/[oas:workflowId workflowId]/enable(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/actions/workflows/[workflowId]/enable.put(headers);
    }

    # List workflow runs for a workflow
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + workflowId - The ID of the workflow. You can also pass the workflow file name as a string
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/workflows/[oas:workflowId workflowId]/runs(map<string|string[]> headers = {}, *oas:ActionsListWorkflowRunsQueries queries) returns oas:WorkflowRunResponse|error {
        return self.genClient->/repos/[owner]/[repo]/actions/workflows/[workflowId]/runs.get(headers, queries);
    }

    # Get workflow usage
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + workflowId - The ID of the workflow. You can also pass the workflow file name as a string
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/actions/workflows/[oas:workflowId workflowId]/timing(map<string|string[]> headers = {}) returns oas:WorkflowUsage|error {
        return self.genClient->/repos/[owner]/[repo]/actions/workflows/[workflowId]/timing.get(headers);
    }

    # List repository activities
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/activity(map<string|string[]> headers = {}, *oas:ReposListActivitiesQueries queries) returns oas:Activity[]|error {
        return self.genClient->/repos/[owner]/[repo]/activity.get(headers, queries);
    }

    # List assignees
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/assignees(map<string|string[]> headers = {}, *oas:IssuesListAssigneesQueries queries) returns oas:SimpleUser[]|error {
        return self.genClient->/repos/[owner]/[repo]/assignees.get(headers, queries);
    }

    # Check if a user can be assigned
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - If the assignee can be assigned to issues in the repository, a 204 header with no content is returned 
    resource isolated function get repos/[string owner]/[string repo]/assignees/[string assignee](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/assignees/[assignee].get(headers);
    }

    # List all autolinks of a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/autolinks(map<string|string[]> headers = {}, *oas:ReposListAutolinksQueries queries) returns oas:Autolink[]|error {
        return self.genClient->/repos/[owner]/[repo]/autolinks.get(headers, queries);
    }

    # Create an autolink reference for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - response 
    resource isolated function post repos/[string owner]/[string repo]/autolinks(oas:RepoAutolinksBody payload, map<string|string[]> headers = {}) returns oas:Autolink|error {
        return self.genClient->/repos/[owner]/[repo]/autolinks.post(payload, headers);
    }

    # Get an autolink reference of a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + autolinkId - The unique identifier of the autolink
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/autolinks/[int autolinkId](map<string|string[]> headers = {}) returns oas:Autolink|error {
        return self.genClient->/repos/[owner]/[repo]/autolinks/[autolinkId].get(headers);
    }

    # Delete an autolink reference from a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + autolinkId - The unique identifier of the autolink
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/autolinks/[int autolinkId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/autolinks/[autolinkId].delete(headers);
    }

    # Check if automated security fixes are enabled for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response if dependabot is enabled 
    resource isolated function get repos/[string owner]/[string repo]/automated\-security\-fixes(map<string|string[]> headers = {}) returns oas:CheckAutomatedSecurityFixes|error {
        return self.genClient->/repos/[owner]/[repo]/automated\-security\-fixes.get(headers);
    }

    # Enable automated security fixes
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/automated\-security\-fixes(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/automated\-security\-fixes.put(headers);
    }

    # Disable automated security fixes
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/automated\-security\-fixes(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/automated\-security\-fixes.delete(headers);
    }

    # List branches
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/branches(map<string|string[]> headers = {}, *oas:ReposListBranchesQueries queries) returns oas:ShortBranch[]|error {
        return self.genClient->/repos/[owner]/[repo]/branches.get(headers, queries);
    }

    # Get a branch
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/branches/[string branch](map<string|string[]> headers = {}) returns oas:BranchWithProtection|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch].get(headers);
    }

    # Get branch protection
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/branches/[string branch]/protection(map<string|string[]> headers = {}) returns oas:BranchProtection|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection.get(headers);
    }

    # Update branch protection
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/branches/[string branch]/protection(oas:BranchProtectionBody payload, map<string|string[]> headers = {}) returns oas:ProtectedBranch|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection.put(payload, headers);
    }

    # Delete branch protection
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/branches/[string branch]/protection(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection.delete(headers);
    }

    # Get admin branch protection
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/branches/[string branch]/protection/enforce_admins(map<string|string[]> headers = {}) returns oas:ProtectedBranchAdminEnforced|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/enforce_admins.get(headers);
    }

    # Set admin branch protection
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/branches/[string branch]/protection/enforce_admins(map<string|string[]> headers = {}) returns oas:ProtectedBranchAdminEnforced|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/enforce_admins.post(headers);
    }

    # Delete admin branch protection
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/branches/[string branch]/protection/enforce_admins(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/enforce_admins.delete(headers);
    }

    # Get pull request review protection
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/branches/[string branch]/protection/required_pull_request_reviews(map<string|string[]> headers = {}) returns oas:ProtectedBranchPullRequestReview|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/required_pull_request_reviews.get(headers);
    }

    # Delete pull request review protection
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/branches/[string branch]/protection/required_pull_request_reviews(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/required_pull_request_reviews.delete(headers);
    }

    # Update pull request review protection
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/branches/[string branch]/protection/required_pull_request_reviews(oas:ProtectionRequiredPullRequestReviewsBody payload, map<string|string[]> headers = {}) returns oas:ProtectedBranchPullRequestReview|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/required_pull_request_reviews.patch(payload, headers);
    }

    # Get commit signature protection
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/branches/[string branch]/protection/required_signatures(map<string|string[]> headers = {}) returns oas:ProtectedBranchAdminEnforced|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/required_signatures.get(headers);
    }

    # Create commit signature protection
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/branches/[string branch]/protection/required_signatures(map<string|string[]> headers = {}) returns oas:ProtectedBranchAdminEnforced|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/required_signatures.post(headers);
    }

    # Delete commit signature protection
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/branches/[string branch]/protection/required_signatures(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/required_signatures.delete(headers);
    }

    # Get status checks protection
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/branches/[string branch]/protection/required_status_checks(map<string|string[]> headers = {}) returns oas:StatusCheckPolicy|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/required_status_checks.get(headers);
    }

    # Remove status check protection
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/branches/[string branch]/protection/required_status_checks(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/required_status_checks.delete(headers);
    }

    # Update status check protection
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/branches/[string branch]/protection/required_status_checks(oas:ProtectionRequiredStatusChecksBody payload, map<string|string[]> headers = {}) returns oas:StatusCheckPolicy|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/required_status_checks.patch(payload, headers);
    }

    # Get all status check contexts
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/branches/[string branch]/protection/required_status_checks/contexts(map<string|string[]> headers = {}) returns string[]|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/required_status_checks/contexts.get(headers);
    }

    # Set status check contexts
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/branches/[string branch]/protection/required_status_checks/contexts(oas:RequiredStatusChecksContextsBody payload, map<string|string[]> headers = {}) returns string[]|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/required_status_checks/contexts.put(payload, headers);
    }

    # Add status check contexts
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/branches/[string branch]/protection/required_status_checks/contexts(oas:RequiredStatusChecksContextsBody1 payload, map<string|string[]> headers = {}) returns string[]|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/required_status_checks/contexts.post(payload, headers);
    }

    # Remove status check contexts
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/branches/[string branch]/protection/required_status_checks/contexts(oas:RequiredStatusChecksContextsBody2 payload, map<string|string[]> headers = {}) returns string[]|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/required_status_checks/contexts.delete(payload, headers);
    }

    # Get access restrictions
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/branches/[string branch]/protection/restrictions(map<string|string[]> headers = {}) returns oas:BranchRestrictionPolicy|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/restrictions.get(headers);
    }

    # Delete access restrictions
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/branches/[string branch]/protection/restrictions(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/restrictions.delete(headers);
    }

    # Get apps with access to the protected branch
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/branches/[string branch]/protection/restrictions/apps(map<string|string[]> headers = {}) returns oas:Integration[]|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/restrictions/apps.get(headers);
    }

    # Set app access restrictions
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/branches/[string branch]/protection/restrictions/apps(oas:RestrictionsAppsBody payload, map<string|string[]> headers = {}) returns oas:Integration[]|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/restrictions/apps.put(payload, headers);
    }

    # Add app access restrictions
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/branches/[string branch]/protection/restrictions/apps(oas:RestrictionsAppsBody payload, map<string|string[]> headers = {}) returns oas:Integration[]|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/restrictions/apps.post(payload, headers);
    }

    # Remove app access restrictions
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/branches/[string branch]/protection/restrictions/apps(oas:RestrictionsAppsBody payload, map<string|string[]> headers = {}) returns oas:Integration[]|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/restrictions/apps.delete(payload, headers);
    }

    # Get teams with access to the protected branch
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/branches/[string branch]/protection/restrictions/teams(map<string|string[]> headers = {}) returns oas:Team[]|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/restrictions/teams.get(headers);
    }

    # Set team access restrictions
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/branches/[string branch]/protection/restrictions/teams(oas:RestrictionsTeamsBody payload, map<string|string[]> headers = {}) returns oas:Team[]|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/restrictions/teams.put(payload, headers);
    }

    # Add team access restrictions
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/branches/[string branch]/protection/restrictions/teams(oas:RestrictionsTeamsBody payload, map<string|string[]> headers = {}) returns oas:Team[]|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/restrictions/teams.post(payload, headers);
    }

    # Remove team access restrictions
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/branches/[string branch]/protection/restrictions/teams(oas:RestrictionsTeamsBody payload, map<string|string[]> headers = {}) returns oas:Team[]|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/restrictions/teams.delete(payload, headers);
    }

    # Get users with access to the protected branch
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/branches/[string branch]/protection/restrictions/users(map<string|string[]> headers = {}) returns oas:SimpleUser[]|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/restrictions/users.get(headers);
    }

    # Set user access restrictions
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/branches/[string branch]/protection/restrictions/users(oas:RestrictionsUsersBody payload, map<string|string[]> headers = {}) returns oas:SimpleUser[]|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/restrictions/users.put(payload, headers);
    }

    # Add user access restrictions
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/branches/[string branch]/protection/restrictions/users(oas:RestrictionsUsersBody payload, map<string|string[]> headers = {}) returns oas:SimpleUser[]|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/restrictions/users.post(payload, headers);
    }

    # Remove user access restrictions
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/branches/[string branch]/protection/restrictions/users(oas:RestrictionsUsersBody payload, map<string|string[]> headers = {}) returns oas:SimpleUser[]|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/protection/restrictions/users.delete(payload, headers);
    }

    # Rename a branch
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/branches/[string branch]/rename(oas:BranchRenameBody payload, map<string|string[]> headers = {}) returns oas:BranchWithProtection|error {
        return self.genClient->/repos/[owner]/[repo]/branches/[branch]/rename.post(payload, headers);
    }

    # Create a check run
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/check\-runs(oas:RepoCheckRunsBody payload, map<string|string[]> headers = {}) returns oas:CheckRun|error {
        return self.genClient->/repos/[owner]/[repo]/check\-runs.post(payload, headers);
    }

    # Get a repository security advisory
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + ghsaId - The GHSA (GitHub Security Advisory) identifier of the advisory
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/check\-runs/[int checkRunId](map<string|string[]> headers = {}) returns oas:CheckRun|error {
        return self.genClient->/repos/[owner]/[repo]/check\-runs/[checkRunId].get(headers);
    }

    # Update a repository security advisory
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + ghsaId - The GHSA (GitHub Security Advisory) identifier of the advisory
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/check\-runs/[int checkRunId](oas:CheckRunscheckRunIdBody payload, map<string|string[]> headers = {}) returns oas:CheckRun|error {
        return self.genClient->/repos/[owner]/[repo]/check\-runs/[checkRunId].patch(payload, headers);
    }

    # List check run annotations
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + checkRunId - The unique identifier of the check run
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/check\-runs/[int checkRunId]/annotations(map<string|string[]> headers = {}, *oas:ChecksListAnnotationsQueries queries) returns oas:CheckAnnotation[]|error {
        return self.genClient->/repos/[owner]/[repo]/check\-runs/[checkRunId]/annotations.get(headers, queries);
    }

    # Rerequest a check suite
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + checkSuiteId - The unique identifier of the check suite
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/check\-runs/[int checkRunId]/rerequest(map<string|string[]> headers = {}) returns oas:EmptyObject|error {
        return self.genClient->/repos/[owner]/[repo]/check\-runs/[checkRunId]/rerequest.post(headers);
    }

    # Create a check suite
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response when the suite already exists 
    resource isolated function post repos/[string owner]/[string repo]/check\-suites(oas:RepoCheckSuitesBody payload, map<string|string[]> headers = {}) returns oas:CheckSuite|error {
        return self.genClient->/repos/[owner]/[repo]/check\-suites.post(payload, headers);
    }

    # Get a repository security advisory
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + ghsaId - The GHSA (GitHub Security Advisory) identifier of the advisory
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/check\-suites/[int checkSuiteId](map<string|string[]> headers = {}) returns oas:CheckSuite|error {
        return self.genClient->/repos/[owner]/[repo]/check\-suites/[checkSuiteId].get(headers);
    }

    # List check runs in a check suite
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + checkSuiteId - The unique identifier of the check suite
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/check\-suites/[int checkSuiteId]/check\-runs(map<string|string[]> headers = {}, *oas:ChecksListForSuiteQueries queries) returns oas:CheckRunResponse|error {
        return self.genClient->/repos/[owner]/[repo]/check\-suites/[checkSuiteId]/check\-runs.get(headers, queries);
    }

    # Rerequest a check suite
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + checkSuiteId - The unique identifier of the check suite
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/check\-suites/[int checkSuiteId]/rerequest(map<string|string[]> headers = {}) returns oas:EmptyObject|error {
        return self.genClient->/repos/[owner]/[repo]/check\-suites/[checkSuiteId]/rerequest.post(headers);
    }

    # List secret scanning alerts for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/code\-scanning/alerts(map<string|string[]> headers = {}, *oas:CodeScanningListAlertsForRepoQueries queries) returns oas:CodeScanningAlertItems[]|error? {
        return self.genClient->/repos/[owner]/[repo]/code\-scanning/alerts.get(headers, queries);
    }

    # Get a secret scanning alert
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + alertNumber - The number that identifies an alert. You can find this at the end of the URL for a code scanning alert within GitHub, and in the number field in the response from the GET /repos/{owner}/{repo}/code-scanning/alerts operation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/code\-scanning/alerts/[oas:AlertNumber alertNumber](map<string|string[]> headers = {}) returns oas:CodeScanningAlert|error? {
        return self.genClient->/repos/[owner]/[repo]/code\-scanning/alerts/[alertNumber].get(headers);
    }

    # Update a secret scanning alert
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + alertNumber - The number that identifies an alert. You can find this at the end of the URL for a code scanning alert within GitHub, and in the number field in the response from the GET /repos/{owner}/{repo}/code-scanning/alerts operation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/code\-scanning/alerts/[oas:AlertNumber alertNumber](oas:AlertsalertNumberBody payload, map<string|string[]> headers = {}) returns oas:CodeScanningAlert|error {
        return self.genClient->/repos/[owner]/[repo]/code\-scanning/alerts/[alertNumber].patch(payload, headers);
    }

    # List instances of a code scanning alert
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + alertNumber - The number that identifies an alert. You can find this at the end of the URL for a code scanning alert within GitHub, and in the number field in the response from the GET /repos/{owner}/{repo}/code-scanning/alerts operation
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/code\-scanning/alerts/[oas:AlertNumber alertNumber]/instances(map<string|string[]> headers = {}, *oas:CodeScanningListAlertInstancesQueries queries) returns oas:CodeScanningAlertInstance[]|error {
        return self.genClient->/repos/[owner]/[repo]/code\-scanning/alerts/[alertNumber]/instances.get(headers, queries);
    }

    # List code scanning analyses for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/code\-scanning/analyses(map<string|string[]> headers = {}, *oas:CodeScanningListRecentAnalysesQueries queries) returns oas:CodeScanningAnalysis[]|error {
        return self.genClient->/repos/[owner]/[repo]/code\-scanning/analyses.get(headers, queries);
    }

    # Get a code scanning analysis for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + analysisId - The ID of the analysis, as returned from the GET /repos/{owner}/{repo}/code-scanning/analyses operation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/code\-scanning/analyses/[int analysisId](map<string|string[]> headers = {}) returns oas:CodeScanningAnalysis|error {
        return self.genClient->/repos/[owner]/[repo]/code\-scanning/analyses/[analysisId].get(headers);
    }

    # Delete a code scanning analysis from a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + analysisId - The ID of the analysis, as returned from the GET /repos/{owner}/{repo}/code-scanning/analyses operation
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/code\-scanning/analyses/[int analysisId](map<string|string[]> headers = {}, *oas:CodeScanningDeleteAnalysisQueries queries) returns oas:CodeScanningAnalysisDeletion|error {
        return self.genClient->/repos/[owner]/[repo]/code\-scanning/analyses/[analysisId].delete(headers, queries);
    }

    # List CodeQL databases for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/code\-scanning/codeql/databases(map<string|string[]> headers = {}) returns oas:CodeScanningCodeqlDatabase[]|error {
        return self.genClient->/repos/[owner]/[repo]/code\-scanning/codeql/databases.get(headers);
    }

    # Get a CodeQL database for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + language - The language of the CodeQL database
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/code\-scanning/codeql/databases/[string language](map<string|string[]> headers = {}) returns oas:CodeScanningCodeqlDatabase|error? {
        return self.genClient->/repos/[owner]/[repo]/code\-scanning/codeql/databases/[language].get(headers);
    }

    # Get a code scanning default setup configuration
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/code\-scanning/default\-setup(map<string|string[]> headers = {}) returns oas:CodeScanningDefaultSetup|error {
        return self.genClient->/repos/[owner]/[repo]/code\-scanning/default\-setup.get(headers);
    }

    # Update a code scanning default setup configuration
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/code\-scanning/default\-setup(oas:CodeScanningDefaultSetupUpdate payload, map<string|string[]> headers = {}) returns oas:EmptyObject|oas:CodeScanningDefaultSetupUpdateResponse|error {
        return self.genClient->/repos/[owner]/[repo]/code\-scanning/default\-setup.patch(payload, headers);
    }

    # Upload an analysis as SARIF data
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/code\-scanning/sarifs(oas:CodeScanningSarifsBody payload, map<string|string[]> headers = {}) returns oas:CodeScanningSarifsReceipt|error {
        return self.genClient->/repos/[owner]/[repo]/code\-scanning/sarifs.post(payload, headers);
    }

    # Get information about a SARIF upload
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + sarifId - The SARIF ID obtained after uploading
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/code\-scanning/sarifs/[string sarifId](map<string|string[]> headers = {}) returns oas:CodeScanningSarifsStatus|error {
        return self.genClient->/repos/[owner]/[repo]/code\-scanning/sarifs/[sarifId].get(headers);
    }

    # List CODEOWNERS errors
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/codeowners/errors(map<string|string[]> headers = {}, *oas:ReposCodeownersErrorsQueries queries) returns oas:CodeownersErrors|error {
        return self.genClient->/repos/[owner]/[repo]/codeowners/errors.get(headers, queries);
    }

    # List codespaces in a repository for the authenticated user
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/codespaces(map<string|string[]> headers = {}, *oas:CodespacesListInRepositoryForAuthenticatedUserQueries queries) returns oas:CodespaceResponse|error {
        return self.genClient->/repos/[owner]/[repo]/codespaces.get(headers, queries);
    }

    # Create a codespace in a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response when the codespace was successfully created 
    resource isolated function post repos/[string owner]/[string repo]/codespaces(oas:RepoCodespacesBody payload, map<string|string[]> headers = {}) returns oas:Codespace|error {
        return self.genClient->/repos/[owner]/[repo]/codespaces.post(payload, headers);
    }

    # List devcontainer configurations in a repository for the authenticated user
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/codespaces/devcontainers(map<string|string[]> headers = {}, *oas:CodespacesListDevcontainersInRepositoryForAuthenticatedUserQueries queries) returns oas:DevcontainersResponse|error {
        return self.genClient->/repos/[owner]/[repo]/codespaces/devcontainers.get(headers, queries);
    }

    # List available machine types for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/codespaces/machines(map<string|string[]> headers = {}, *oas:CodespacesRepoMachinesForAuthenticatedUserQueries queries) returns oas:CodespaceMachineResponse|error? {
        return self.genClient->/repos/[owner]/[repo]/codespaces/machines.get(headers, queries);
    }

    # Get default attributes for a codespace
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response when a user is able to create codespaces from the repository 
    resource isolated function get repos/[string owner]/[string repo]/codespaces/'new(map<string|string[]> headers = {}, *oas:CodespacesPreFlightWithRepoForAuthenticatedUserQueries queries) returns oas:CodespaceDefaultResponse|error {
        return self.genClient->/repos/[owner]/[repo]/codespaces/'new.get(headers, queries);
    }

    # Check if permissions defined by a devcontainer have been accepted by the authenticated user
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response when the permission check is successful 
    resource isolated function get repos/[string owner]/[string repo]/codespaces/permissions_check(map<string|string[]> headers = {}, *oas:CodespacesCheckPermissionsForDevcontainerQueries queries) returns oas:CodespacesPermissionsCheckForDevcontainer|error {
        return self.genClient->/repos/[owner]/[repo]/codespaces/permissions_check.get(headers, queries);
    }

    # List repository secrets
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/codespaces/secrets(map<string|string[]> headers = {}, *oas:CodespacesListRepoSecretsQueries queries) returns oas:RepoCodespacesSecretResponse|error {
        return self.genClient->/repos/[owner]/[repo]/codespaces/secrets.get(headers, queries);
    }

    # Get a repository secret
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/codespaces/secrets/[string secretName](map<string|string[]> headers = {}) returns oas:RepoCodespacesSecret|error {
        return self.genClient->/repos/[owner]/[repo]/codespaces/secrets/[secretName].get(headers);
    }

    # Create or update a repository secret
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response when creating a secret 
    resource isolated function put repos/[string owner]/[string repo]/codespaces/secrets/[string secretName](oas:SecretssecretNameBody4 payload, map<string|string[]> headers = {}) returns oas:EmptyObject|error? {
        return self.genClient->/repos/[owner]/[repo]/codespaces/secrets/[secretName].put(payload, headers);
    }

    # Delete a repository secret
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/codespaces/secrets/[string secretName](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/codespaces/secrets/[secretName].delete(headers);
    }

    # List repository collaborators
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/collaborators(map<string|string[]> headers = {}, *oas:ReposListCollaboratorsQueries queries) returns oas:Collaborator[]|error {
        return self.genClient->/repos/[owner]/[repo]/collaborators.get(headers, queries);
    }

    # Check if a user is a repository collaborator
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response if user is a collaborator 
    resource isolated function get repos/[string owner]/[string repo]/collaborators/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/collaborators/[username].get(headers);
    }

    # Add a repository collaborator
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response when a new invitation is created 
    resource isolated function put repos/[string owner]/[string repo]/collaborators/[string username](oas:CollaboratorsusernameBody1 payload, map<string|string[]> headers = {}) returns oas:RepositoryInvitation|error? {
        return self.genClient->/repos/[owner]/[repo]/collaborators/[username].put(payload, headers);
    }

    # Remove a repository collaborator
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - No Content when collaborator was removed from the repository 
    resource isolated function delete repos/[string owner]/[string repo]/collaborators/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/collaborators/[username].delete(headers);
    }

    # Get repository permissions for a user
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - if user has admin permissions 
    resource isolated function get repos/[string owner]/[string repo]/collaborators/[string username]/permission(map<string|string[]> headers = {}) returns oas:RepositoryCollaboratorPermission|error {
        return self.genClient->/repos/[owner]/[repo]/collaborators/[username]/permission.get(headers);
    }

    # List commit comments for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/comments(map<string|string[]> headers = {}, *oas:ReposListCommitCommentsForRepoQueries queries) returns oas:CommitComment[]|error {
        return self.genClient->/repos/[owner]/[repo]/comments.get(headers, queries);
    }

    # Get a commit comment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/comments/[int commentId](map<string|string[]> headers = {}) returns oas:CommitComment|error {
        return self.genClient->/repos/[owner]/[repo]/comments/[commentId].get(headers);
    }

    # Delete a commit comment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/comments/[int commentId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/comments/[commentId].delete(headers);
    }

    # Update a commit comment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/comments/[int commentId](oas:CommentscommentIdBody payload, map<string|string[]> headers = {}) returns oas:CommitComment|error {
        return self.genClient->/repos/[owner]/[repo]/comments/[commentId].patch(payload, headers);
    }

    # List reactions for a commit comment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/comments/[int commentId]/reactions(map<string|string[]> headers = {}, *oas:ReactionsListForCommitCommentQueries queries) returns oas:Reaction[]|error {
        return self.genClient->/repos/[owner]/[repo]/comments/[commentId]/reactions.get(headers, queries);
    }

    # Create reaction for a commit comment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + return - Reaction exists 
    resource isolated function post repos/[string owner]/[string repo]/comments/[int commentId]/reactions(oas:CommentIdReactionsBody payload, map<string|string[]> headers = {}) returns oas:Reaction|error {
        return self.genClient->/repos/[owner]/[repo]/comments/[commentId]/reactions.post(payload, headers);
    }

    # Delete a commit comment reaction
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commentId - The unique identifier of the comment
    # + reactionId - The unique identifier of the reaction
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/comments/[int commentId]/reactions/[int reactionId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/comments/[commentId]/reactions/[reactionId].delete(headers);
    }

    # List commits
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/commits(map<string|string[]> headers = {}, *oas:ReposListCommitsQueries queries) returns oas:Commit[]|error {
        return self.genClient->/repos/[owner]/[repo]/commits.get(headers, queries);
    }

    # List branches for HEAD commit
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commitSha - The SHA of the commit
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/commits/[string commitSha]/branches\-where\-head(map<string|string[]> headers = {}) returns oas:BranchShort[]|error {
        return self.genClient->/repos/[owner]/[repo]/commits/[commitSha]/branches\-where\-head.get(headers);
    }

    # List commit comments
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commitSha - The SHA of the commit
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/commits/[string commitSha]/comments(map<string|string[]> headers = {}, *oas:ReposListCommentsForCommitQueries queries) returns oas:CommitComment[]|error {
        return self.genClient->/repos/[owner]/[repo]/commits/[commitSha]/comments.get(headers, queries);
    }

    # Create a commit comment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commitSha - The SHA of the commit
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/commits/[string commitSha]/comments(oas:CommitShaCommentsBody payload, map<string|string[]> headers = {}) returns oas:CommitComment|error {
        return self.genClient->/repos/[owner]/[repo]/commits/[commitSha]/comments.post(payload, headers);
    }

    # List pull requests associated with a commit
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commitSha - The SHA of the commit
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/commits/[string commitSha]/pulls(map<string|string[]> headers = {}, *oas:ReposListPullRequestsAssociatedWithCommitQueries queries) returns oas:PullRequestSimple[]|error {
        return self.genClient->/repos/[owner]/[repo]/commits/[commitSha]/pulls.get(headers, queries);
    }

    # Get a commit
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + ref - The commit reference. Can be a commit SHA, branch name (heads/BRANCH_NAME), or tag name (tags/TAG_NAME). For more information, see "[Git References](https://git-scm.com/book/en/v2/Git-Internals-Git-References)" in the Git documentation
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/commits/[string ref](map<string|string[]> headers = {}, *oas:ReposGetCommitQueries queries) returns oas:Commit|error {
        return self.genClient->/repos/[owner]/[repo]/commits/[ref].get(headers, queries);
    }

    # List check runs for a Git reference
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + ref - The commit reference. Can be a commit SHA, branch name (heads/BRANCH_NAME), or tag name (tags/TAG_NAME). For more information, see "[Git References](https://git-scm.com/book/en/v2/Git-Internals-Git-References)" in the Git documentation
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/commits/[string ref]/check\-runs(map<string|string[]> headers = {}, *oas:ChecksListForRefQueries queries) returns oas:CheckRunResponse|error {
        return self.genClient->/repos/[owner]/[repo]/commits/[ref]/check\-runs.get(headers, queries);
    }

    # List check suites for a Git reference
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + ref - The commit reference. Can be a commit SHA, branch name (heads/BRANCH_NAME), or tag name (tags/TAG_NAME). For more information, see "[Git References](https://git-scm.com/book/en/v2/Git-Internals-Git-References)" in the Git documentation
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/commits/[string ref]/check\-suites(map<string|string[]> headers = {}, *oas:ChecksListSuitesForRefQueries queries) returns oas:CheckSuiteResponse|error {
        return self.genClient->/repos/[owner]/[repo]/commits/[ref]/check\-suites.get(headers, queries);
    }

    # Get the combined status for a specific reference
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + ref - The commit reference. Can be a commit SHA, branch name (heads/BRANCH_NAME), or tag name (tags/TAG_NAME). For more information, see "[Git References](https://git-scm.com/book/en/v2/Git-Internals-Git-References)" in the Git documentation
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/commits/[string ref]/status(map<string|string[]> headers = {}, *oas:ReposGetCombinedStatusForRefQueries queries) returns oas:CombinedCommitStatus|error {
        return self.genClient->/repos/[owner]/[repo]/commits/[ref]/status.get(headers, queries);
    }

    # List commit statuses for a reference
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + ref - The commit reference. Can be a commit SHA, branch name (heads/BRANCH_NAME), or tag name (tags/TAG_NAME). For more information, see "[Git References](https://git-scm.com/book/en/v2/Git-Internals-Git-References)" in the Git documentation
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/commits/[string ref]/statuses(map<string|string[]> headers = {}, *oas:ReposListCommitStatusesForRefQueries queries) returns oas:Status[]|error {
        return self.genClient->/repos/[owner]/[repo]/commits/[ref]/statuses.get(headers, queries);
    }

    # Get community profile metrics
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/community/profile(map<string|string[]> headers = {}) returns oas:CommunityProfile|error {
        return self.genClient->/repos/[owner]/[repo]/community/profile.get(headers);
    }

    # Compare two commits
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + basehead - The base branch and head branch to compare. This parameter expects the format BASE...HEAD. Both must be branch names in repo. To compare with a branch that exists in a different repository in the same network as repo, the basehead parameter expects the format USERNAME:BASE...USERNAME:HEAD
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/compare/[string basehead](map<string|string[]> headers = {}, *oas:ReposCompareCommitsQueries queries) returns oas:CommitComparison|error {
        return self.genClient->/repos/[owner]/[repo]/compare/[basehead].get(headers, queries);
    }

    # Get repository content
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + path - path parameter
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/contents/[string path](map<string|string[]> headers = {}, *oas:ReposGetContentQueries queries) returns oas:InlineResponse200|error? {
        return self.genClient->/repos/[owner]/[repo]/contents/[path].get(headers, queries);
    }

    # Create or update file contents
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + path - path parameter
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/contents/[string path](oas:ContentspathBody payload, map<string|string[]> headers = {}) returns oas:FileCommit|error {
        return self.genClient->/repos/[owner]/[repo]/contents/[path].put(payload, headers);
    }

    # Delete a file
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + path - path parameter
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/contents/[string path](oas:ContentspathBody1 payload, map<string|string[]> headers = {}) returns oas:FileCommit|error {
        return self.genClient->/repos/[owner]/[repo]/contents/[path].delete(payload, headers);
    }

    # List repository contributors
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - If repository contains content 
    resource isolated function get repos/[string owner]/[string repo]/contributors(map<string|string[]> headers = {}, *oas:ReposListContributorsQueries queries) returns oas:Contributor[]|error? {
        return self.genClient->/repos/[owner]/[repo]/contributors.get(headers, queries);
    }

    # List Dependabot alerts for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/dependabot/alerts(map<string|string[]> headers = {}, *oas:DependabotListAlertsForRepoQueries queries) returns oas:DependabotAlert[]|error? {
        return self.genClient->/repos/[owner]/[repo]/dependabot/alerts.get(headers, queries);
    }

    # Get a Dependabot alert
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + alertNumber - The number that identifies a Dependabot alert in its repository.
    # You can find this at the end of the URL for a Dependabot alert within GitHub,
    # or in number fields in the response from the
    # GET /repos/{owner}/{repo}/dependabot/alerts operation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/dependabot/alerts/[oas:AlertNumber alertNumber](map<string|string[]> headers = {}) returns oas:DependabotAlert|error? {
        return self.genClient->/repos/[owner]/[repo]/dependabot/alerts/[alertNumber].get(headers);
    }

    # Update a Dependabot alert
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + alertNumber - The number that identifies a Dependabot alert in its repository.
    # You can find this at the end of the URL for a Dependabot alert within GitHub,
    # or in number fields in the response from the
    # GET /repos/{owner}/{repo}/dependabot/alerts operation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/dependabot/alerts/[oas:AlertNumber alertNumber](oas:AlertsalertNumberBody1 payload, map<string|string[]> headers = {}) returns oas:DependabotAlert|error {
        return self.genClient->/repos/[owner]/[repo]/dependabot/alerts/[alertNumber].patch(payload, headers);
    }

    # List repository secrets
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/dependabot/secrets(map<string|string[]> headers = {}, *oas:DependabotListRepoSecretsQueries queries) returns oas:DependabotSecretResponse|error {
        return self.genClient->/repos/[owner]/[repo]/dependabot/secrets.get(headers, queries);
    }

    # Get a repository secret
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/dependabot/secrets/[string secretName](map<string|string[]> headers = {}) returns oas:DependabotSecret|error {
        return self.genClient->/repos/[owner]/[repo]/dependabot/secrets/[secretName].get(headers);
    }

    # Create or update a repository secret
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response when creating a secret 
    resource isolated function put repos/[string owner]/[string repo]/dependabot/secrets/[string secretName](oas:SecretssecretNameBody5 payload, map<string|string[]> headers = {}) returns oas:EmptyObject|error? {
        return self.genClient->/repos/[owner]/[repo]/dependabot/secrets/[secretName].put(payload, headers);
    }

    # Delete a repository secret
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/dependabot/secrets/[string secretName](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/dependabot/secrets/[secretName].delete(headers);
    }

    # Get a diff of the dependencies between commits
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + basehead - The base and head Git revisions to compare. The Git revisions will be resolved to commit SHAs. Named revisions will be resolved to their corresponding HEAD commits, and an appropriate merge base will be determined. This parameter expects the format {base}...{head}
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/dependency\-graph/compare/[string basehead](map<string|string[]> headers = {}, *oas:DependencyGraphDiffRangeQueries queries) returns oas:DependencyGraphDiff|error {
        return self.genClient->/repos/[owner]/[repo]/dependency\-graph/compare/[basehead].get(headers, queries);
    }

    # Export a software bill of materials (SBOM) for a repository.
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/dependency\-graph/sbom(map<string|string[]> headers = {}) returns oas:DependencyGraphSpdxSbom|error {
        return self.genClient->/repos/[owner]/[repo]/dependency\-graph/sbom.get(headers);
    }

    # Create a snapshot of dependencies for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/dependency\-graph/snapshots(oas:Snapshot payload, map<string|string[]> headers = {}) returns oas:SnapshotResponse|error {
        return self.genClient->/repos/[owner]/[repo]/dependency\-graph/snapshots.post(payload, headers);
    }

    # List deployments
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/deployments(map<string|string[]> headers = {}, *oas:ReposListDeploymentsQueries queries) returns oas:Deployment[]|error {
        return self.genClient->/repos/[owner]/[repo]/deployments.get(headers, queries);
    }

    # Create a deployment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/deployments(oas:RepoDeploymentsBody payload, map<string|string[]> headers = {}) returns oas:Deployment|oas:MergedBranchResponse|error {
        return self.genClient->/repos/[owner]/[repo]/deployments.post(payload, headers);
    }

    # Get a deployment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + deploymentId - deployment_id parameter
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/deployments/[int deploymentId](map<string|string[]> headers = {}) returns oas:Deployment|error {
        return self.genClient->/repos/[owner]/[repo]/deployments/[deploymentId].get(headers);
    }

    # Delete a deployment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + deploymentId - deployment_id parameter
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/deployments/[int deploymentId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/deployments/[deploymentId].delete(headers);
    }

    # List deployment statuses
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + deploymentId - deployment_id parameter
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/deployments/[int deploymentId]/statuses(map<string|string[]> headers = {}, *oas:ReposListDeploymentStatusesQueries queries) returns oas:DeploymentStatus[]|error {
        return self.genClient->/repos/[owner]/[repo]/deployments/[deploymentId]/statuses.get(headers, queries);
    }

    # Create a deployment status
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + deploymentId - deployment_id parameter
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/deployments/[int deploymentId]/statuses(oas:DeploymentIdStatusesBody payload, map<string|string[]> headers = {}) returns oas:DeploymentStatus|error {
        return self.genClient->/repos/[owner]/[repo]/deployments/[deploymentId]/statuses.post(payload, headers);
    }

    # Get a deployment status
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + deploymentId - deployment_id parameter
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/deployments/[int deploymentId]/statuses/[int statusId](map<string|string[]> headers = {}) returns oas:DeploymentStatus|error {
        return self.genClient->/repos/[owner]/[repo]/deployments/[deploymentId]/statuses/[statusId].get(headers);
    }

    # Create a repository dispatch event
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/dispatches(oas:RepoDispatchesBody payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/dispatches.post(payload, headers);
    }

    # List environments
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/environments(map<string|string[]> headers = {}, *oas:ReposGetAllEnvironmentsQueries queries) returns oas:EnvironmentResponse|error {
        return self.genClient->/repos/[owner]/[repo]/environments.get(headers, queries);
    }

    # Get an environment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + environmentName - The name of the environment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/environments/[string environmentName](map<string|string[]> headers = {}) returns oas:Environment|error {
        return self.genClient->/repos/[owner]/[repo]/environments/[environmentName].get(headers);
    }

    # Create or update an environment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + environmentName - The name of the environment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/environments/[string environmentName](oas:EnvironmentsenvironmentNameBody payload, map<string|string[]> headers = {}) returns oas:Environment|error {
        return self.genClient->/repos/[owner]/[repo]/environments/[environmentName].put(payload, headers);
    }

    # Delete an environment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + environmentName - The name of the environment
    # + headers - Headers to be sent with the request 
    # + return - Default response 
    resource isolated function delete repos/[string owner]/[string repo]/environments/[string environmentName](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/environments/[environmentName].delete(headers);
    }

    # List deployment branch policies
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + environmentName - The name of the environment
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/environments/[string environmentName]/deployment\-branch\-policies(map<string|string[]> headers = {}, *oas:ReposListDeploymentBranchPoliciesQueries queries) returns oas:DeploymentBranchPolicyResponse|error {
        return self.genClient->/repos/[owner]/[repo]/environments/[environmentName]/deployment\-branch\-policies.get(headers, queries);
    }

    # Create a deployment branch policy
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + environmentName - The name of the environment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/environments/[string environmentName]/deployment\-branch\-policies(oas:DeploymentBranchPolicyNamePatternWithType payload, map<string|string[]> headers = {}) returns oas:DeploymentBranchPolicy|error? {
        return self.genClient->/repos/[owner]/[repo]/environments/[environmentName]/deployment\-branch\-policies.post(payload, headers);
    }

    # Get a deployment branch policy
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + environmentName - The name of the environment
    # + branchPolicyId - The unique identifier of the branch policy
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/environments/[string environmentName]/deployment\-branch\-policies/[int branchPolicyId](map<string|string[]> headers = {}) returns oas:DeploymentBranchPolicy|error {
        return self.genClient->/repos/[owner]/[repo]/environments/[environmentName]/deployment\-branch\-policies/[branchPolicyId].get(headers);
    }

    # Update a deployment branch policy
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + environmentName - The name of the environment
    # + branchPolicyId - The unique identifier of the branch policy
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/environments/[string environmentName]/deployment\-branch\-policies/[int branchPolicyId](oas:DeploymentBranchPolicyNamePattern payload, map<string|string[]> headers = {}) returns oas:DeploymentBranchPolicy|error {
        return self.genClient->/repos/[owner]/[repo]/environments/[environmentName]/deployment\-branch\-policies/[branchPolicyId].put(payload, headers);
    }

    # Delete a deployment branch policy
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + environmentName - The name of the environment
    # + branchPolicyId - The unique identifier of the branch policy
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/environments/[string environmentName]/deployment\-branch\-policies/[int branchPolicyId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/environments/[environmentName]/deployment\-branch\-policies/[branchPolicyId].delete(headers);
    }

    # Get all deployment protection rules for an environment
    #
    # + environmentName - The name of the environment
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + owner - The account owner of the repository. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - List of deployment protection rules 
    resource isolated function get repos/[string owner]/[string repo]/environments/[string environmentName]/deployment_protection_rules(map<string|string[]> headers = {}) returns oas:DeploymentProtectionRuleResponse|error {
        return self.genClient->/repos/[owner]/[repo]/environments/[environmentName]/deployment_protection_rules.get(headers);
    }

    # Create a custom deployment protection rule on an environment
    #
    # + environmentName - The name of the environment
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + owner - The account owner of the repository. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - The enabled custom deployment protection rule 
    resource isolated function post repos/[string owner]/[string repo]/environments/[string environmentName]/deployment_protection_rules(oas:EnvironmentNameDeploymentProtectionRulesBody payload, map<string|string[]> headers = {}) returns oas:DeploymentProtectionRule|error {
        return self.genClient->/repos/[owner]/[repo]/environments/[environmentName]/deployment_protection_rules.post(payload, headers);
    }

    # Get a custom deployment protection rule
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + environmentName - The name of the environment
    # + protectionRuleId - The unique identifier of the protection rule
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/environments/[string environmentName]/deployment_protection_rules/[int protectionRuleId](map<string|string[]> headers = {}) returns oas:DeploymentProtectionRule|error {
        return self.genClient->/repos/[owner]/[repo]/environments/[environmentName]/deployment_protection_rules/[protectionRuleId].get(headers);
    }

    # Disable a custom protection rule for an environment
    #
    # + environmentName - The name of the environment
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + owner - The account owner of the repository. The name is not case sensitive
    # + protectionRuleId - The unique identifier of the protection rule
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/environments/[string environmentName]/deployment_protection_rules/[int protectionRuleId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/environments/[environmentName]/deployment_protection_rules/[protectionRuleId].delete(headers);
    }

    # List repository events
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/events(map<string|string[]> headers = {}, *oas:ActivityListRepoEventsQueries queries) returns oas:Event[]|error {
        return self.genClient->/repos/[owner]/[repo]/events.get(headers, queries);
    }

    # List forks
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/forks(map<string|string[]> headers = {}, *oas:ReposListForksQueries queries) returns oas:MinimalRepository[]|error {
        return self.genClient->/repos/[owner]/[repo]/forks.get(headers, queries);
    }

    # Create a fork
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/forks(oas:RepoForksBody payload, map<string|string[]> headers = {}) returns oas:FullRepository|error {
        return self.genClient->/repos/[owner]/[repo]/forks.post(payload, headers);
    }

    # Create a blob
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/git/blobs(oas:GitBlobsBody payload, map<string|string[]> headers = {}) returns oas:ShortBlob|error {
        return self.genClient->/repos/[owner]/[repo]/git/blobs.post(payload, headers);
    }

    # Get a blob
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/git/blobs/[string fileSha](map<string|string[]> headers = {}) returns oas:Blob|error {
        return self.genClient->/repos/[owner]/[repo]/git/blobs/[fileSha].get(headers);
    }

    # Create a commit
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/git/commits(oas:GitCommitsBody payload, map<string|string[]> headers = {}) returns oas:GitCommit|error {
        return self.genClient->/repos/[owner]/[repo]/git/commits.post(payload, headers);
    }

    # Get a commit object
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commitSha - The SHA of the commit
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/git/commits/[string commitSha](map<string|string[]> headers = {}) returns oas:GitCommit|error {
        return self.genClient->/repos/[owner]/[repo]/git/commits/[commitSha].get(headers);
    }

    # List matching references
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + ref - The commit reference. Can be a commit SHA, branch name (heads/BRANCH_NAME), or tag name (tags/TAG_NAME). For more information, see "[Git References](https://git-scm.com/book/en/v2/Git-Internals-Git-References)" in the Git documentation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/git/matching\-refs/[string ref](map<string|string[]> headers = {}) returns oas:GitRef[]|error {
        return self.genClient->/repos/[owner]/[repo]/git/matching\-refs/[ref].get(headers);
    }

    # Get a reference
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + ref - The commit reference. Can be a commit SHA, branch name (heads/BRANCH_NAME), or tag name (tags/TAG_NAME). For more information, see "[Git References](https://git-scm.com/book/en/v2/Git-Internals-Git-References)" in the Git documentation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/git/ref/[string ref](map<string|string[]> headers = {}) returns oas:GitRef|error {
        return self.genClient->/repos/[owner]/[repo]/git/ref/[ref].get(headers);
    }

    # Create a reference
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/git/refs(oas:GitRefsBody payload, map<string|string[]> headers = {}) returns oas:GitRef|error {
        return self.genClient->/repos/[owner]/[repo]/git/refs.post(payload, headers);
    }

    # Delete a reference
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + ref - The commit reference. Can be a commit SHA, branch name (heads/BRANCH_NAME), or tag name (tags/TAG_NAME). For more information, see "[Git References](https://git-scm.com/book/en/v2/Git-Internals-Git-References)" in the Git documentation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/git/refs/[string ref](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/git/refs/[ref].delete(headers);
    }

    # Update a reference
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + ref - The name of the reference to update (for example, heads/featureA). Can be a branch name (heads/BRANCH_NAME) or tag name (tags/TAG_NAME). For more information, see "[Git References](https://git-scm.com/book/en/v2/Git-Internals-Git-References)" in the Git documentation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/git/refs/[string ref](oas:RefsrefBody payload, map<string|string[]> headers = {}) returns oas:GitRef|error {
        return self.genClient->/repos/[owner]/[repo]/git/refs/[ref].patch(payload, headers);
    }

    # Create a tag object
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/git/tags(oas:GitTagsBody payload, map<string|string[]> headers = {}) returns oas:GitTag|error {
        return self.genClient->/repos/[owner]/[repo]/git/tags.post(payload, headers);
    }

    # Get a tag
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/git/tags/[string tagSha](map<string|string[]> headers = {}) returns oas:GitTag|error {
        return self.genClient->/repos/[owner]/[repo]/git/tags/[tagSha].get(headers);
    }

    # Create a tree
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/git/trees(oas:GitTreesBody payload, map<string|string[]> headers = {}) returns oas:GitTree|error {
        return self.genClient->/repos/[owner]/[repo]/git/trees.post(payload, headers);
    }

    # Get a tree
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + treeSha - The SHA1 value or ref (branch or tag) name of the tree
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/git/trees/[string treeSha](map<string|string[]> headers = {}, *oas:GitGetTreeQueries queries) returns oas:GitTree|error {
        return self.genClient->/repos/[owner]/[repo]/git/trees/[treeSha].get(headers, queries);
    }

    # List repository webhooks
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/hooks(map<string|string[]> headers = {}, *oas:ReposListWebhooksQueries queries) returns oas:Hook[]|error {
        return self.genClient->/repos/[owner]/[repo]/hooks.get(headers, queries);
    }

    # Create a repository webhook
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/hooks(oas:RepoHooksBody payload, map<string|string[]> headers = {}) returns oas:Hook|error {
        return self.genClient->/repos/[owner]/[repo]/hooks.post(payload, headers);
    }

    # Get a repository webhook
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/hooks/[int hookId](map<string|string[]> headers = {}) returns oas:Hook|error {
        return self.genClient->/repos/[owner]/[repo]/hooks/[hookId].get(headers);
    }

    # Delete a repository webhook
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/hooks/[int hookId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/hooks/[hookId].delete(headers);
    }

    # Update a repository webhook
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/hooks/[int hookId](oas:HookshookIdBody1 payload, map<string|string[]> headers = {}) returns oas:Hook|error {
        return self.genClient->/repos/[owner]/[repo]/hooks/[hookId].patch(payload, headers);
    }

    # Get a webhook configuration for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/hooks/[int hookId]/config(map<string|string[]> headers = {}) returns oas:WebhookConfig|error {
        return self.genClient->/repos/[owner]/[repo]/hooks/[hookId]/config.get(headers);
    }

    # Update a webhook configuration for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/hooks/[int hookId]/config(oas:HookIdConfigBody payload, map<string|string[]> headers = {}) returns oas:WebhookConfig|error {
        return self.genClient->/repos/[owner]/[repo]/hooks/[hookId]/config.patch(payload, headers);
    }

    # List deliveries for a repository webhook
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/hooks/[int hookId]/deliveries(map<string|string[]> headers = {}, *oas:ReposListWebhookDeliveriesQueries queries) returns oas:HookDeliveryItem[]|error {
        return self.genClient->/repos/[owner]/[repo]/hooks/[hookId]/deliveries.get(headers, queries);
    }

    # Get a delivery for a repository webhook
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/hooks/[int hookId]/deliveries/[int deliveryId](map<string|string[]> headers = {}) returns oas:HookDelivery|error {
        return self.genClient->/repos/[owner]/[repo]/hooks/[hookId]/deliveries/[deliveryId].get(headers);
    }

    # Redeliver a delivery for a repository webhook
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + return - Accepted 
    resource isolated function post repos/[string owner]/[string repo]/hooks/[int hookId]/deliveries/[int deliveryId]/attempts(map<string|string[]> headers = {}) returns record {}|error {
        return self.genClient->/repos/[owner]/[repo]/hooks/[hookId]/deliveries/[deliveryId]/attempts.post(headers);
    }

    # Ping a repository webhook
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/hooks/[int hookId]/pings(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/hooks/[hookId]/pings.post(headers);
    }

    # Test the push repository webhook
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + hookId - The unique identifier of the hook. You can find this value in the X-GitHub-Hook-ID header of a webhook delivery
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/hooks/[int hookId]/tests(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/hooks/[hookId]/tests.post(headers);
    }

    # Get an import status
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/'import(map<string|string[]> headers = {}) returns oas:Import|error {
        return self.genClient->/repos/[owner]/[repo]/'import.get(headers);
    }

    # Start an import
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/'import(oas:RepoImportBody payload, map<string|string[]> headers = {}) returns oas:Import|error {
        return self.genClient->/repos/[owner]/[repo]/'import.put(payload, headers);
    }

    # Cancel an import
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/'import(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/'import.delete(headers);
    }

    # Update an import
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/'import(oas:RepoImportBody1 payload, map<string|string[]> headers = {}) returns oas:Import|error {
        return self.genClient->/repos/[owner]/[repo]/'import.patch(payload, headers);
    }

    # Get commit authors
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/'import/authors(map<string|string[]> headers = {}, *oas:MigrationsGetCommitAuthorsQueries queries) returns oas:PorterAuthor[]|error {
        return self.genClient->/repos/[owner]/[repo]/'import/authors.get(headers, queries);
    }

    # Map a commit author
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/'import/authors/[int authorId](oas:AuthorsauthorIdBody payload, map<string|string[]> headers = {}) returns oas:PorterAuthor|error {
        return self.genClient->/repos/[owner]/[repo]/'import/authors/[authorId].patch(payload, headers);
    }

    # Get large files
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/'import/large_files(map<string|string[]> headers = {}) returns oas:PorterLargeFile[]|error {
        return self.genClient->/repos/[owner]/[repo]/'import/large_files.get(headers);
    }

    # Update Git LFS preference
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/'import/lfs(oas:ImportLfsBody payload, map<string|string[]> headers = {}) returns oas:Import|error {
        return self.genClient->/repos/[owner]/[repo]/'import/lfs.patch(payload, headers);
    }

    # Get a repository installation for the authenticated app
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/installation(map<string|string[]> headers = {}) returns oas:Installation|error {
        return self.genClient->/repos/[owner]/[repo]/installation.get(headers);
    }

    # Get interaction restrictions for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/interaction\-limits(map<string|string[]> headers = {}) returns oas:InteractionLimitResponseAny|error {
        return self.genClient->/repos/[owner]/[repo]/interaction\-limits.get(headers);
    }

    # Set interaction restrictions for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/interaction\-limits(oas:InteractionLimit payload, map<string|string[]> headers = {}) returns oas:InteractionLimitResponse|error {
        return self.genClient->/repos/[owner]/[repo]/interaction\-limits.put(payload, headers);
    }

    # Remove interaction restrictions for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/interaction\-limits(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/interaction\-limits.delete(headers);
    }

    # List repository invitations
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/invitations(map<string|string[]> headers = {}, *oas:ReposListInvitationsQueries queries) returns oas:RepositoryInvitation[]|error {
        return self.genClient->/repos/[owner]/[repo]/invitations.get(headers, queries);
    }

    # Delete a repository invitation
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + invitationId - The unique identifier of the invitation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/invitations/[int invitationId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/invitations/[invitationId].delete(headers);
    }

    # Update a repository invitation
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + invitationId - The unique identifier of the invitation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/invitations/[int invitationId](oas:InvitationsinvitationIdBody payload, map<string|string[]> headers = {}) returns oas:RepositoryInvitation|error {
        return self.genClient->/repos/[owner]/[repo]/invitations/[invitationId].patch(payload, headers);
    }

    # List repository issues
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/issues(map<string|string[]> headers = {}, *oas:IssuesListForRepoQueries queries) returns oas:Issue[]|error {
        return self.genClient->/repos/[owner]/[repo]/issues.get(headers, queries);
    }

    # Create an issue
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/issues(oas:RepoIssuesBody payload, map<string|string[]> headers = {}) returns oas:Issue|error {
        return self.genClient->/repos/[owner]/[repo]/issues.post(payload, headers);
    }

    # Get an issue comment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/issues/comments/[int commentId](map<string|string[]> headers = {}) returns oas:IssueComment|error {
        return self.genClient->/repos/[owner]/[repo]/issues/comments/[commentId].get(headers);
    }

    # Delete an issue comment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/issues/comments/[int commentId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/issues/comments/[commentId].delete(headers);
    }

    # Update an issue comment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/issues/comments/[int commentId](oas:CommentscommentIdBody1 payload, map<string|string[]> headers = {}) returns oas:IssueComment|error {
        return self.genClient->/repos/[owner]/[repo]/issues/comments/[commentId].patch(payload, headers);
    }

    # List reactions for an issue comment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/issues/comments/[int commentId]/reactions(map<string|string[]> headers = {}, *oas:ReactionsListForIssueCommentQueries queries) returns oas:Reaction[]|error {
        return self.genClient->/repos/[owner]/[repo]/issues/comments/[commentId]/reactions.get(headers, queries);
    }

    # Create reaction for an issue comment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + return - Reaction exists 
    resource isolated function post repos/[string owner]/[string repo]/issues/comments/[int commentId]/reactions(oas:CommentIdReactionsBody1 payload, map<string|string[]> headers = {}) returns oas:Reaction|error {
        return self.genClient->/repos/[owner]/[repo]/issues/comments/[commentId]/reactions.post(payload, headers);
    }

    # Delete an issue comment reaction
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commentId - The unique identifier of the comment
    # + reactionId - The unique identifier of the reaction
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/issues/comments/[int commentId]/reactions/[int reactionId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/issues/comments/[commentId]/reactions/[reactionId].delete(headers);
    }

    # Get an issue event
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/issues/events/[int eventId](map<string|string[]> headers = {}) returns oas:IssueEvent|error {
        return self.genClient->/repos/[owner]/[repo]/issues/events/[eventId].get(headers);
    }

    # Get an issue
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/issues/[int issueNumber](map<string|string[]> headers = {}) returns oas:Issue|error? {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber].get(headers);
    }

    # Update an issue
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/issues/[int issueNumber](oas:IssuesissueNumberBody payload, map<string|string[]> headers = {}) returns oas:Issue|error {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber].patch(payload, headers);
    }

    # Add assignees to an issue
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/issues/[int issueNumber]/assignees(oas:IssueNumberAssigneesBody payload, map<string|string[]> headers = {}) returns oas:Issue|error {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber]/assignees.post(payload, headers);
    }

    # Remove assignees from an issue
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/issues/[int issueNumber]/assignees(oas:IssueNumberAssigneesBody1 payload, map<string|string[]> headers = {}) returns oas:Issue|error {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber]/assignees.delete(payload, headers);
    }

    # Check if a user can be assigned to a issue
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + headers - Headers to be sent with the request 
    # + return - Response if assignee can be assigned to issue_number 
    resource isolated function get repos/[string owner]/[string repo]/issues/[int issueNumber]/assignees/[string assignee](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber]/assignees/[assignee].get(headers);
    }

    # List issue comments
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/issues/[int issueNumber]/comments(map<string|string[]> headers = {}, *oas:IssuesListCommentsQueries queries) returns oas:IssueComment[]|error {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber]/comments.get(headers, queries);
    }

    # Create an issue comment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/issues/[int issueNumber]/comments(oas:CommentscommentIdBody1 payload, map<string|string[]> headers = {}) returns oas:IssueComment|error {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber]/comments.post(payload, headers);
    }

    # List issue events
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/issues/[int issueNumber]/events(map<string|string[]> headers = {}, *oas:IssuesListEventsQueries queries) returns oas:IssueEventForIssue[]|error {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber]/events.get(headers, queries);
    }

    # List labels for an issue
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/issues/[int issueNumber]/labels(map<string|string[]> headers = {}, *oas:IssuesListLabelsOnIssueQueries queries) returns oas:Label[]|error {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber]/labels.get(headers, queries);
    }

    # Set labels for an issue
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/issues/[int issueNumber]/labels(oas:IssueNumberLabelsBody payload, map<string|string[]> headers = {}) returns oas:Label[]|error {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber]/labels.put(payload, headers);
    }

    # Add labels to an issue
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/issues/[int issueNumber]/labels(oas:IssueNumberLabelsBody1 payload, map<string|string[]> headers = {}) returns oas:Label[]|error {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber]/labels.post(payload, headers);
    }

    # Remove all labels from an issue
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/issues/[int issueNumber]/labels(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber]/labels.delete(headers);
    }

    # Remove a label from an issue
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/issues/[int issueNumber]/labels/[string name](map<string|string[]> headers = {}) returns oas:Label[]|error {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber]/labels/[name].delete(headers);
    }

    # Lock an issue
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/issues/[int issueNumber]/'lock(oas:IssueNumberLockBody payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber]/'lock.put(payload, headers);
    }

    # Unlock an issue
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/issues/[int issueNumber]/'lock(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber]/'lock.delete(headers);
    }

    # List reactions for an issue
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/issues/[int issueNumber]/reactions(map<string|string[]> headers = {}, *oas:ReactionsListForIssueQueries queries) returns oas:Reaction[]|error {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber]/reactions.get(headers, queries);
    }

    # Create reaction for an issue
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/issues/[int issueNumber]/reactions(oas:IssueNumberReactionsBody payload, map<string|string[]> headers = {}) returns oas:Reaction|error {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber]/reactions.post(payload, headers);
    }

    # Delete an issue reaction
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + reactionId - The unique identifier of the reaction
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/issues/[int issueNumber]/reactions/[int reactionId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber]/reactions/[reactionId].delete(headers);
    }

    # List timeline events for an issue
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + issueNumber - The number that identifies the issue
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/issues/[int issueNumber]/timeline(map<string|string[]> headers = {}, *oas:IssuesListEventsForTimelineQueries queries) returns oas:TimelineIssueEvents[]|error {
        return self.genClient->/repos/[owner]/[repo]/issues/[issueNumber]/timeline.get(headers, queries);
    }

    # List deploy keys
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/keys(map<string|string[]> headers = {}, *oas:ReposListDeployKeysQueries queries) returns oas:DeployKey[]|error {
        return self.genClient->/repos/[owner]/[repo]/keys.get(headers, queries);
    }

    # Create a deploy key
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/keys(oas:RepoKeysBody payload, map<string|string[]> headers = {}) returns oas:DeployKey|error {
        return self.genClient->/repos/[owner]/[repo]/keys.post(payload, headers);
    }

    # Get a deploy key
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + keyId - The unique identifier of the key
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/keys/[int keyId](map<string|string[]> headers = {}) returns oas:DeployKey|error {
        return self.genClient->/repos/[owner]/[repo]/keys/[keyId].get(headers);
    }

    # Delete a deploy key
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + keyId - The unique identifier of the key
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/keys/[int keyId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/keys/[keyId].delete(headers);
    }

    # List labels for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/labels(map<string|string[]> headers = {}, *oas:IssuesListLabelsForRepoQueries queries) returns oas:Label[]|error {
        return self.genClient->/repos/[owner]/[repo]/labels.get(headers, queries);
    }

    # Create a label
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/labels(oas:RepoLabelsBody payload, map<string|string[]> headers = {}) returns oas:Label|error {
        return self.genClient->/repos/[owner]/[repo]/labels.post(payload, headers);
    }

    # Get a label
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/labels/[string name](map<string|string[]> headers = {}) returns oas:Label|error {
        return self.genClient->/repos/[owner]/[repo]/labels/[name].get(headers);
    }

    # Delete a label
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/labels/[string name](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/labels/[name].delete(headers);
    }

    # Update a label
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/labels/[string name](oas:LabelsnameBody payload, map<string|string[]> headers = {}) returns oas:Label|error {
        return self.genClient->/repos/[owner]/[repo]/labels/[name].patch(payload, headers);
    }

    # List repository languages
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/languages(map<string|string[]> headers = {}) returns oas:Language|error {
        return self.genClient->/repos/[owner]/[repo]/languages.get(headers);
    }

    # Get the license for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/license(map<string|string[]> headers = {}) returns oas:LicenseContent|error {
        return self.genClient->/repos/[owner]/[repo]/license.get(headers);
    }

    # Sync a fork branch with the upstream repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - The branch has been successfully synced with the upstream repository 
    resource isolated function post repos/[string owner]/[string repo]/merge\-upstream(oas:RepoMergeUpstreamBody payload, map<string|string[]> headers = {}) returns oas:MergedUpstream|error {
        return self.genClient->/repos/[owner]/[repo]/merge\-upstream.post(payload, headers);
    }

    # Merge a branch
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Successful Response (The resulting merge commit) 
    resource isolated function post repos/[string owner]/[string repo]/merges(oas:RepoMergesBody payload, map<string|string[]> headers = {}) returns oas:Commit|error? {
        return self.genClient->/repos/[owner]/[repo]/merges.post(payload, headers);
    }

    # List milestones
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/milestones(map<string|string[]> headers = {}, *oas:IssuesListMilestonesQueries queries) returns oas:Milestone[]|error {
        return self.genClient->/repos/[owner]/[repo]/milestones.get(headers, queries);
    }

    # Create a milestone
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/milestones(oas:RepoMilestonesBody payload, map<string|string[]> headers = {}) returns oas:Milestone|error {
        return self.genClient->/repos/[owner]/[repo]/milestones.post(payload, headers);
    }

    # Get a milestone
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + milestoneNumber - The number that identifies the milestone
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/milestones/[int milestoneNumber](map<string|string[]> headers = {}) returns oas:Milestone|error {
        return self.genClient->/repos/[owner]/[repo]/milestones/[milestoneNumber].get(headers);
    }

    # Delete a milestone
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + milestoneNumber - The number that identifies the milestone
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/milestones/[int milestoneNumber](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/milestones/[milestoneNumber].delete(headers);
    }

    # Update a milestone
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + milestoneNumber - The number that identifies the milestone
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/milestones/[int milestoneNumber](oas:MilestonesmilestoneNumberBody payload, map<string|string[]> headers = {}) returns oas:Milestone|error {
        return self.genClient->/repos/[owner]/[repo]/milestones/[milestoneNumber].patch(payload, headers);
    }

    # List labels for issues in a milestone
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + milestoneNumber - The number that identifies the milestone
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/milestones/[int milestoneNumber]/labels(map<string|string[]> headers = {}, *oas:IssuesListLabelsForMilestoneQueries queries) returns oas:Label[]|error {
        return self.genClient->/repos/[owner]/[repo]/milestones/[milestoneNumber]/labels.get(headers, queries);
    }

    # List repository notifications for the authenticated user
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/notifications(map<string|string[]> headers = {}, *oas:ActivityListRepoNotificationsForAuthenticatedUserQueries queries) returns oas:NotificationThread[]|error {
        return self.genClient->/repos/[owner]/[repo]/notifications.get(headers, queries);
    }

    # Mark repository notifications as read
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/notifications(oas:RepoNotificationsBody payload, map<string|string[]> headers = {}) returns oas:NotificationRead|error? {
        return self.genClient->/repos/[owner]/[repo]/notifications.put(payload, headers);
    }

    # Get a GitHub Pages site
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/pages(map<string|string[]> headers = {}) returns oas:Page|error {
        return self.genClient->/repos/[owner]/[repo]/pages.get(headers);
    }

    # Update information about a GitHub Pages site
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/pages(oas:RepoPagesBody payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/pages.put(payload, headers);
    }

    # Create a GitHub Pages site
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/pages(oas:RepoPagesBody1 payload, map<string|string[]> headers = {}) returns oas:Page|error {
        return self.genClient->/repos/[owner]/[repo]/pages.post(payload, headers);
    }

    # Delete a GitHub Pages site
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/pages(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/pages.delete(headers);
    }

    # List GitHub Pages builds
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/pages/builds(map<string|string[]> headers = {}, *oas:ReposListPagesBuildsQueries queries) returns oas:PageBuild[]|error {
        return self.genClient->/repos/[owner]/[repo]/pages/builds.get(headers, queries);
    }

    # Request a GitHub Pages build
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/pages/builds(map<string|string[]> headers = {}) returns oas:PageBuildStatus|error {
        return self.genClient->/repos/[owner]/[repo]/pages/builds.post(headers);
    }

    # Get GitHub Pages build
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/pages/builds/[int buildId](map<string|string[]> headers = {}) returns oas:PageBuild|error {
        return self.genClient->/repos/[owner]/[repo]/pages/builds/[buildId].get(headers);
    }

    # Create a GitHub Pages deployment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/pages/deployment(oas:PagesDeploymentBody payload, map<string|string[]> headers = {}) returns oas:PageDeployment|error {
        return self.genClient->/repos/[owner]/[repo]/pages/deployment.post(payload, headers);
    }

    # Get a DNS health check for GitHub Pages
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/pages/health(map<string|string[]> headers = {}) returns oas:PagesHealthCheck|oas:EmptyObject|error {
        return self.genClient->/repos/[owner]/[repo]/pages/health.get(headers);
    }

    # Enable private vulnerability reporting for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - A header with no content is returned 
    resource isolated function put repos/[string owner]/[string repo]/private\-vulnerability\-reporting(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/private\-vulnerability\-reporting.put(headers);
    }

    # Disable private vulnerability reporting for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - A header with no content is returned 
    resource isolated function delete repos/[string owner]/[string repo]/private\-vulnerability\-reporting(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/private\-vulnerability\-reporting.delete(headers);
    }

    # List pull requests
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/pulls(map<string|string[]> headers = {}, *oas:PullsListQueries queries) returns oas:PullRequestSimple[]|error? {
        return self.genClient->/repos/[owner]/[repo]/pulls.get(headers, queries);
    }

    # Create a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/pulls(oas:RepoPullsBody payload, map<string|string[]> headers = {}) returns oas:PullRequest|error {
        return self.genClient->/repos/[owner]/[repo]/pulls.post(payload, headers);
    }

    # Get a review comment for a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/pulls/comments/[int commentId](map<string|string[]> headers = {}) returns oas:PullRequestReviewComment|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/comments/[commentId].get(headers);
    }

    # Delete a review comment for a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/pulls/comments/[int commentId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/pulls/comments/[commentId].delete(headers);
    }

    # Update a review comment for a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/pulls/comments/[int commentId](oas:CommentscommentIdBody2 payload, map<string|string[]> headers = {}) returns oas:PullRequestReviewComment|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/comments/[commentId].patch(payload, headers);
    }

    # List reactions for a pull request review comment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/pulls/comments/[int commentId]/reactions(map<string|string[]> headers = {}, *oas:ReactionsListForPullRequestReviewCommentQueries queries) returns oas:Reaction[]|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/comments/[commentId]/reactions.get(headers, queries);
    }

    # Create reaction for a pull request review comment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + return - Reaction exists 
    resource isolated function post repos/[string owner]/[string repo]/pulls/comments/[int commentId]/reactions(oas:CommentIdReactionsBody2 payload, map<string|string[]> headers = {}) returns oas:Reaction|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/comments/[commentId]/reactions.post(payload, headers);
    }

    # Delete a pull request comment reaction
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + commentId - The unique identifier of the comment
    # + reactionId - The unique identifier of the reaction
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/pulls/comments/[int commentId]/reactions/[int reactionId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/pulls/comments/[commentId]/reactions/[reactionId].delete(headers);
    }

    # Get a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + headers - Headers to be sent with the request 
    # + return - Pass the appropriate [media type](https://docs.github.com/rest/overview/media-types/#commits-commit-comparison-and-pull-requests) to fetch diff and patch formats 
    resource isolated function get repos/[string owner]/[string repo]/pulls/[int pullNumber](map<string|string[]> headers = {}) returns oas:PullRequest|error? {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber].get(headers);
    }

    # Update a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/pulls/[int pullNumber](oas:PullspullNumberBody payload, map<string|string[]> headers = {}) returns oas:PullRequest|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber].patch(payload, headers);
    }

    # Create a codespace from a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + headers - Headers to be sent with the request 
    # + return - Response when the codespace was successfully created 
    resource isolated function post repos/[string owner]/[string repo]/pulls/[int pullNumber]/codespaces(oas:PullNumberCodespacesBody payload, map<string|string[]> headers = {}) returns oas:Codespace|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/codespaces.post(payload, headers);
    }

    # List review comments on a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/pulls/[int pullNumber]/comments(map<string|string[]> headers = {}, *oas:PullsListReviewCommentsQueries queries) returns oas:PullRequestReviewComment[]|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/comments.get(headers, queries);
    }

    # Create a review comment for a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/pulls/[int pullNumber]/comments(oas:PullNumberCommentsBody payload, map<string|string[]> headers = {}) returns oas:PullRequestReviewComment|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/comments.post(payload, headers);
    }

    # Create a reply for a review comment
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + commentId - The unique identifier of the comment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/pulls/[int pullNumber]/comments/[int commentId]/replies(oas:CommentIdRepliesBody payload, map<string|string[]> headers = {}) returns oas:PullRequestReviewComment|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/comments/[commentId]/replies.post(payload, headers);
    }

    # List commits on a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/pulls/[int pullNumber]/commits(map<string|string[]> headers = {}, *oas:PullsListCommitsQueries queries) returns oas:Commit[]|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/commits.get(headers, queries);
    }

    # List pull requests files
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/pulls/[int pullNumber]/files(map<string|string[]> headers = {}, *oas:PullsListFilesQueries queries) returns oas:DiffEntry[]|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/files.get(headers, queries);
    }

    # Check if a pull request has been merged
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + headers - Headers to be sent with the request 
    # + return - Response if pull request has been merged 
    resource isolated function get repos/[string owner]/[string repo]/pulls/[int pullNumber]/merge(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/merge.get(headers);
    }

    # Merge a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + headers - Headers to be sent with the request 
    # + return - if merge was successful 
    resource isolated function put repos/[string owner]/[string repo]/pulls/[int pullNumber]/merge(oas:PullNumberMergeBody payload, map<string|string[]> headers = {}) returns oas:PullRequestMergeResult|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/merge.put(payload, headers);
    }

    # Get all requested reviewers for a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/pulls/[int pullNumber]/requested_reviewers(map<string|string[]> headers = {}) returns oas:PullRequestReviewRequest|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/requested_reviewers.get(headers);
    }

    # Request reviewers for a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/pulls/[int pullNumber]/requested_reviewers(oas:PullNumberRequestedReviewersBody payload, map<string|string[]> headers = {}) returns oas:PullRequestSimple|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/requested_reviewers.post(payload, headers);
    }

    # Remove requested reviewers from a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/pulls/[int pullNumber]/requested_reviewers(oas:PullNumberRequestedReviewersBody1 payload, map<string|string[]> headers = {}) returns oas:PullRequestSimple|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/requested_reviewers.delete(payload, headers);
    }

    # List reviews for a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - The list of reviews returns in chronological order 
    resource isolated function get repos/[string owner]/[string repo]/pulls/[int pullNumber]/reviews(map<string|string[]> headers = {}, *oas:PullsListReviewsQueries queries) returns oas:PullRequestReview[]|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/reviews.get(headers, queries);
    }

    # Create a review for a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/pulls/[int pullNumber]/reviews(oas:PullNumberReviewsBody payload, map<string|string[]> headers = {}) returns oas:PullRequestReview|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/reviews.post(payload, headers);
    }

    # Get a review for a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + reviewId - The unique identifier of the review
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/pulls/[int pullNumber]/reviews/[int reviewId](map<string|string[]> headers = {}) returns oas:PullRequestReview|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/reviews/[reviewId].get(headers);
    }

    # Update a review for a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + reviewId - The unique identifier of the review
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/pulls/[int pullNumber]/reviews/[int reviewId](oas:ReviewsreviewIdBody payload, map<string|string[]> headers = {}) returns oas:PullRequestReview|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/reviews/[reviewId].put(payload, headers);
    }

    # Delete a pending review for a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + reviewId - The unique identifier of the review
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/pulls/[int pullNumber]/reviews/[int reviewId](map<string|string[]> headers = {}) returns oas:PullRequestReview|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/reviews/[reviewId].delete(headers);
    }

    # List comments for a pull request review
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + reviewId - The unique identifier of the review
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/pulls/[int pullNumber]/reviews/[int reviewId]/comments(map<string|string[]> headers = {}, *oas:PullsListCommentsForReviewQueries queries) returns oas:ReviewComment[]|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/reviews/[reviewId]/comments.get(headers, queries);
    }

    # Dismiss a review for a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + reviewId - The unique identifier of the review
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/pulls/[int pullNumber]/reviews/[int reviewId]/dismissals(oas:ReviewIdDismissalsBody payload, map<string|string[]> headers = {}) returns oas:PullRequestReview|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/reviews/[reviewId]/dismissals.put(payload, headers);
    }

    # Submit a review for a pull request
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + reviewId - The unique identifier of the review
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/pulls/[int pullNumber]/reviews/[int reviewId]/events(oas:ReviewIdEventsBody payload, map<string|string[]> headers = {}) returns oas:PullRequestReview|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/reviews/[reviewId]/events.post(payload, headers);
    }

    # Update a pull request branch
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + pullNumber - The number that identifies the pull request
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/pulls/[int pullNumber]/update\-branch(oas:PullNumberUpdateBranchBody payload, map<string|string[]> headers = {}) returns oas:NotificationRead|error {
        return self.genClient->/repos/[owner]/[repo]/pulls/[pullNumber]/update\-branch.put(payload, headers);
    }

    # Get a repository README
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/readme(map<string|string[]> headers = {}, *oas:ReposGetReadmeQueries queries) returns oas:ContentFile|error {
        return self.genClient->/repos/[owner]/[repo]/readme.get(headers, queries);
    }

    # Get a repository README for a directory
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + dir - The alternate path to look for a README file
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/readme/[string dir](map<string|string[]> headers = {}, *oas:ReposGetReadmeInDirectoryQueries queries) returns oas:ContentFile|error {
        return self.genClient->/repos/[owner]/[repo]/readme/[dir].get(headers, queries);
    }

    # List releases
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/releases(map<string|string[]> headers = {}, *oas:ReposListReleasesQueries queries) returns oas:Release[]|error {
        return self.genClient->/repos/[owner]/[repo]/releases.get(headers, queries);
    }

    # Create a release
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/releases(oas:RepoReleasesBody payload, map<string|string[]> headers = {}) returns oas:Release|error {
        return self.genClient->/repos/[owner]/[repo]/releases.post(payload, headers);
    }

    # Get a release asset
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + assetId - The unique identifier of the asset
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/releases/assets/[int assetId](map<string|string[]> headers = {}) returns oas:ReleaseAsset|error? {
        return self.genClient->/repos/[owner]/[repo]/releases/assets/[assetId].get(headers);
    }

    # Delete a release asset
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + assetId - The unique identifier of the asset
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/releases/assets/[int assetId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/releases/assets/[assetId].delete(headers);
    }

    # Update a release asset
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + assetId - The unique identifier of the asset
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/releases/assets/[int assetId](oas:AssetsassetIdBody payload, map<string|string[]> headers = {}) returns oas:ReleaseAsset|error {
        return self.genClient->/repos/[owner]/[repo]/releases/assets/[assetId].patch(payload, headers);
    }

    # Get a release by tag name
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + tag - tag parameter
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/releases/tags/[string tag](map<string|string[]> headers = {}) returns oas:Release|error {
        return self.genClient->/repos/[owner]/[repo]/releases/tags/[tag].get(headers);
    }

    # Get a release
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + releaseId - The unique identifier of the release
    # + headers - Headers to be sent with the request 
    # + return - **Note:** This returns an upload_url key corresponding to the endpoint for uploading release assets. This key is a [hypermedia resource](https://docs.github.com/rest/overview/resources-in-the-rest-api#hypermedia) 
    resource isolated function get repos/[string owner]/[string repo]/releases/[int releaseId](map<string|string[]> headers = {}) returns oas:Release|error {
        return self.genClient->/repos/[owner]/[repo]/releases/[releaseId].get(headers);
    }

    # Delete a release
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + releaseId - The unique identifier of the release
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/releases/[int releaseId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/releases/[releaseId].delete(headers);
    }

    # Update a release
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + releaseId - The unique identifier of the release
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/releases/[int releaseId](oas:ReleasesreleaseIdBody payload, map<string|string[]> headers = {}) returns oas:Release|error {
        return self.genClient->/repos/[owner]/[repo]/releases/[releaseId].patch(payload, headers);
    }

    # List release assets
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + releaseId - The unique identifier of the release
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/releases/[int releaseId]/assets(map<string|string[]> headers = {}, *oas:ReposListReleaseAssetsQueries queries) returns oas:ReleaseAsset[]|error {
        return self.genClient->/repos/[owner]/[repo]/releases/[releaseId]/assets.get(headers, queries);
    }

    # Upload a release asset
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + releaseId - The unique identifier of the release
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response for successful upload 
    resource isolated function post repos/[string owner]/[string repo]/releases/[int releaseId]/assets(byte[] payload, map<string|string[]> headers = {}, *oas:ReposUploadReleaseAssetQueries queries) returns oas:ReleaseAsset|error {
        return self.genClient->/repos/[owner]/[repo]/releases/[releaseId]/assets.post(payload, headers, queries);
    }

    # List reactions for a release
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + releaseId - The unique identifier of the release
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/releases/[int releaseId]/reactions(map<string|string[]> headers = {}, *oas:ReactionsListForReleaseQueries queries) returns oas:Reaction[]|error {
        return self.genClient->/repos/[owner]/[repo]/releases/[releaseId]/reactions.get(headers, queries);
    }

    # Create reaction for a release
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + releaseId - The unique identifier of the release
    # + headers - Headers to be sent with the request 
    # + return - Reaction exists 
    resource isolated function post repos/[string owner]/[string repo]/releases/[int releaseId]/reactions(oas:ReleaseIdReactionsBody payload, map<string|string[]> headers = {}) returns oas:Reaction|error {
        return self.genClient->/repos/[owner]/[repo]/releases/[releaseId]/reactions.post(payload, headers);
    }

    # Delete a release reaction
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + releaseId - The unique identifier of the release
    # + reactionId - The unique identifier of the reaction
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/releases/[int releaseId]/reactions/[int reactionId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/releases/[releaseId]/reactions/[reactionId].delete(headers);
    }

    # Get rules for a branch
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + branch - The name of the branch. Cannot contain wildcard characters. To use wildcard characters in branch names, use [the GraphQL API](https://docs.github.com/graphql)
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/rules/branches/[string branch](map<string|string[]> headers = {}, *oas:ReposGetBranchRulesQueries queries) returns oas:RepositoryRuleDetailed[]|error {
        return self.genClient->/repos/[owner]/[repo]/rules/branches/[branch].get(headers, queries);
    }

    # Get all repository rulesets
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/rulesets(map<string|string[]> headers = {}, *oas:ReposGetRepoRulesetsQueries queries) returns oas:RepositoryRuleset[]|error {
        return self.genClient->/repos/[owner]/[repo]/rulesets.get(headers, queries);
    }

    # Create a repository ruleset
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + payload - Request body 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/rulesets(oas:RepoRulesetsBody payload, map<string|string[]> headers = {}) returns oas:RepositoryRuleset|error {
        return self.genClient->/repos/[owner]/[repo]/rulesets.post(payload, headers);
    }

    # Get a repository rule suite
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + ruleSuiteId - The unique identifier of the rule suite result.
    # To get this ID, you can use [GET /repos/{owner}/{repo}/rulesets/rule-suites](https://docs.github.com/rest/repos/rule-suites#list-repository-rule-suites)
    # for repositories and [GET /orgs/{org}/rulesets/rule-suites](https://docs.github.com/rest/orgs/rule-suites#list-organization-rule-suites)
    # for organizations
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/rulesets/rule\-suites/[int ruleSuiteId](map<string|string[]> headers = {}) returns oas:RuleSuite|error {
        return self.genClient->/repos/[owner]/[repo]/rulesets/rule\-suites/[ruleSuiteId].get(headers);
    }

    # Get a repository ruleset
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + rulesetId - The ID of the ruleset
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/rulesets/[int rulesetId](map<string|string[]> headers = {}, *oas:ReposGetRepoRulesetQueries queries) returns oas:RepositoryRuleset|error {
        return self.genClient->/repos/[owner]/[repo]/rulesets/[rulesetId].get(headers, queries);
    }

    # Update a repository ruleset
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + rulesetId - The ID of the ruleset
    # + headers - Headers to be sent with the request 
    # + payload - Request body 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/rulesets/[int rulesetId](oas:RulesetsrulesetIdBody1 payload, map<string|string[]> headers = {}) returns oas:RepositoryRuleset|error {
        return self.genClient->/repos/[owner]/[repo]/rulesets/[rulesetId].put(payload, headers);
    }

    # Delete a repository ruleset
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + rulesetId - The ID of the ruleset
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/rulesets/[int rulesetId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/rulesets/[rulesetId].delete(headers);
    }

    # List secret scanning alerts for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/secret\-scanning/alerts(map<string|string[]> headers = {}, *oas:SecretScanningListAlertsForRepoQueries queries) returns oas:SecretScanningAlert[]|error {
        return self.genClient->/repos/[owner]/[repo]/secret\-scanning/alerts.get(headers, queries);
    }

    # Get a secret scanning alert
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + alertNumber - The number that identifies an alert. You can find this at the end of the URL for a code scanning alert within GitHub, and in the number field in the response from the GET /repos/{owner}/{repo}/code-scanning/alerts operation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/secret\-scanning/alerts/[oas:AlertNumber alertNumber](map<string|string[]> headers = {}) returns oas:SecretScanningAlert|error? {
        return self.genClient->/repos/[owner]/[repo]/secret\-scanning/alerts/[alertNumber].get(headers);
    }

    # Update a secret scanning alert
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + alertNumber - The number that identifies an alert. You can find this at the end of the URL for a code scanning alert within GitHub, and in the number field in the response from the GET /repos/{owner}/{repo}/code-scanning/alerts operation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/secret\-scanning/alerts/[oas:AlertNumber alertNumber](oas:AlertsalertNumberBody2 payload, map<string|string[]> headers = {}) returns oas:SecretScanningAlert|error {
        return self.genClient->/repos/[owner]/[repo]/secret\-scanning/alerts/[alertNumber].patch(payload, headers);
    }

    # List locations for a secret scanning alert
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + alertNumber - The number that identifies an alert. You can find this at the end of the URL for a code scanning alert within GitHub, and in the number field in the response from the GET /repos/{owner}/{repo}/code-scanning/alerts operation
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/secret\-scanning/alerts/[oas:AlertNumber alertNumber]/locations(map<string|string[]> headers = {}, *oas:SecretScanningListLocationsForAlertQueries queries) returns oas:SecretScanningLocation[]|error {
        return self.genClient->/repos/[owner]/[repo]/secret\-scanning/alerts/[alertNumber]/locations.get(headers, queries);
    }

    # List repository security advisories
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/security\-advisories(map<string|string[]> headers = {}, *oas:SecurityAdvisoriesListRepositoryAdvisoriesQueries queries) returns oas:RepositoryAdvisory[]|error {
        return self.genClient->/repos/[owner]/[repo]/security\-advisories.get(headers, queries);
    }

    # Create a repository security advisory
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/security\-advisories(oas:RepositoryAdvisoryCreate payload, map<string|string[]> headers = {}) returns oas:RepositoryAdvisory|error {
        return self.genClient->/repos/[owner]/[repo]/security\-advisories.post(payload, headers);
    }

    # Get a repository security advisory
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + ghsaId - The GHSA (GitHub Security Advisory) identifier of the advisory
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/security\-advisories/[string ghsaId](map<string|string[]> headers = {}) returns oas:RepositoryAdvisory|error {
        return self.genClient->/repos/[owner]/[repo]/security\-advisories/[ghsaId].get(headers);
    }

    # Update a repository security advisory
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + ghsaId - The GHSA (GitHub Security Advisory) identifier of the advisory
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repos/[string owner]/[string repo]/security\-advisories/[string ghsaId](oas:RepositoryAdvisoryUpdate payload, map<string|string[]> headers = {}) returns oas:RepositoryAdvisory|error {
        return self.genClient->/repos/[owner]/[repo]/security\-advisories/[ghsaId].patch(payload, headers);
    }

    # Request a CVE for a repository security advisory
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + ghsaId - The GHSA (GitHub Security Advisory) identifier of the advisory
    # + headers - Headers to be sent with the request 
    # + return - Accepted 
    resource isolated function post repos/[string owner]/[string repo]/security\-advisories/[string ghsaId]/cve(map<string|string[]> headers = {}) returns record {}|error {
        return self.genClient->/repos/[owner]/[repo]/security\-advisories/[ghsaId]/cve.post(headers);
    }

    # List stargazers
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/stargazers(map<string|string[]> headers = {}, *oas:ActivityListStargazersForRepoQueries queries) returns oas:StargazerResponse|error {
        return self.genClient->/repos/[owner]/[repo]/stargazers.get(headers, queries);
    }

    # Get the weekly commit activity
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Returns a weekly aggregate of the number of additions and deletions pushed to a repository 
    resource isolated function get repos/[string owner]/[string repo]/stats/code_frequency(map<string|string[]> headers = {}) returns oas:CodeFrequencyStat[]|record {}|error? {
        return self.genClient->/repos/[owner]/[repo]/stats/code_frequency.get(headers);
    }

    # Get the last year of commit activity
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/stats/commit_activity(map<string|string[]> headers = {}) returns oas:CommitActivity[]|record {}|error? {
        return self.genClient->/repos/[owner]/[repo]/stats/commit_activity.get(headers);
    }

    # Get all contributor commit activity
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/stats/contributors(map<string|string[]> headers = {}) returns oas:ContributorActivity[]|record {}|error? {
        return self.genClient->/repos/[owner]/[repo]/stats/contributors.get(headers);
    }

    # Get the weekly commit count
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - The array order is oldest week (index 0) to most recent week 
    resource isolated function get repos/[string owner]/[string repo]/stats/participation(map<string|string[]> headers = {}) returns oas:ParticipationStats|error {
        return self.genClient->/repos/[owner]/[repo]/stats/participation.get(headers);
    }

    # Get the hourly commit count for each day
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - For example, [2, 14, 25] indicates that there were 25 total commits, during the 2:00pm hour on Tuesdays. All times are based on the time zone of individual commits 
    resource isolated function get repos/[string owner]/[string repo]/stats/punch_card(map<string|string[]> headers = {}) returns oas:CodeFrequencyStat[]|error? {
        return self.genClient->/repos/[owner]/[repo]/stats/punch_card.get(headers);
    }

    # Create a commit status
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/statuses/[string sha](oas:StatusesshaBody payload, map<string|string[]> headers = {}) returns oas:Status|error {
        return self.genClient->/repos/[owner]/[repo]/statuses/[sha].post(payload, headers);
    }

    # List watchers
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/subscribers(map<string|string[]> headers = {}, *oas:ActivityListWatchersForRepoQueries queries) returns oas:SimpleUser[]|error {
        return self.genClient->/repos/[owner]/[repo]/subscribers.get(headers, queries);
    }

    # Get a repository subscription
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - if you subscribe to the repository 
    resource isolated function get repos/[string owner]/[string repo]/subscription(map<string|string[]> headers = {}) returns oas:RepositorySubscription|error {
        return self.genClient->/repos/[owner]/[repo]/subscription.get(headers);
    }

    # Set a repository subscription
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/subscription(oas:RepoSubscriptionBody payload, map<string|string[]> headers = {}) returns oas:RepositorySubscription|error {
        return self.genClient->/repos/[owner]/[repo]/subscription.put(payload, headers);
    }

    # Delete a repository subscription
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/subscription(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/subscription.delete(headers);
    }

    # List repository tags
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/tags(map<string|string[]> headers = {}, *oas:ReposListTagsQueries queries) returns oas:Tag[]|error {
        return self.genClient->/repos/[owner]/[repo]/tags.get(headers, queries);
    }

    # List tag protection states for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/tags/protection(map<string|string[]> headers = {}) returns oas:TagProtection[]|error {
        return self.genClient->/repos/[owner]/[repo]/tags/protection.get(headers);
    }

    # Create a tag protection state for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/tags/protection(oas:TagsProtectionBody payload, map<string|string[]> headers = {}) returns oas:TagProtection|error {
        return self.genClient->/repos/[owner]/[repo]/tags/protection.post(payload, headers);
    }

    # Delete a tag protection state for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + tagProtectionId - The unique identifier of the tag protection
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/tags/protection/[int tagProtectionId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/tags/protection/[tagProtectionId].delete(headers);
    }

    # Download a repository archive (tar)
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/tarball/[string ref](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/tarball/[ref].get(headers);
    }

    # List repository teams
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/teams(map<string|string[]> headers = {}, *oas:ReposListTeamsQueries queries) returns oas:Team[]|error {
        return self.genClient->/repos/[owner]/[repo]/teams.get(headers, queries);
    }

    # Get all repository topics
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/topics(map<string|string[]> headers = {}, *oas:ReposGetAllTopicsQueries queries) returns oas:Topic|error {
        return self.genClient->/repos/[owner]/[repo]/topics.get(headers, queries);
    }

    # Replace all repository topics
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/topics(oas:RepoTopicsBody payload, map<string|string[]> headers = {}) returns oas:Topic|error {
        return self.genClient->/repos/[owner]/[repo]/topics.put(payload, headers);
    }

    # Get repository clones
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/traffic/clones(map<string|string[]> headers = {}, *oas:ReposGetClonesQueries queries) returns oas:CloneTraffic|error {
        return self.genClient->/repos/[owner]/[repo]/traffic/clones.get(headers, queries);
    }

    # Get top referral paths
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/traffic/popular/paths(map<string|string[]> headers = {}) returns oas:ContentTraffic[]|error {
        return self.genClient->/repos/[owner]/[repo]/traffic/popular/paths.get(headers);
    }

    # Get top referral sources
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/traffic/popular/referrers(map<string|string[]> headers = {}) returns oas:ReferrerTraffic[]|error {
        return self.genClient->/repos/[owner]/[repo]/traffic/popular/referrers.get(headers);
    }

    # Get page views
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/traffic/views(map<string|string[]> headers = {}, *oas:ReposGetViewsQueries queries) returns oas:ViewTraffic|error {
        return self.genClient->/repos/[owner]/[repo]/traffic/views.get(headers, queries);
    }

    # Transfer a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string owner]/[string repo]/transfer(oas:RepoTransferBody payload, map<string|string[]> headers = {}) returns oas:MinimalRepository|error {
        return self.genClient->/repos/[owner]/[repo]/transfer.post(payload, headers);
    }

    # Check if vulnerability alerts are enabled for a repository
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response if repository is enabled with vulnerability alerts 
    resource isolated function get repos/[string owner]/[string repo]/vulnerability\-alerts(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/vulnerability\-alerts.get(headers);
    }

    # Enable vulnerability alerts
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put repos/[string owner]/[string repo]/vulnerability\-alerts(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/vulnerability\-alerts.put(headers);
    }

    # Disable vulnerability alerts
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repos/[string owner]/[string repo]/vulnerability\-alerts(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/vulnerability\-alerts.delete(headers);
    }

    # Download a repository archive (zip)
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repos/[string owner]/[string repo]/zipball/[string ref](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repos/[owner]/[repo]/zipball/[ref].get(headers);
    }

    # Create a repository using a template
    #
    # + templateOwner - The account owner of the template repository. The name is not case sensitive
    # + templateRepo - The name of the template repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repos/[string templateOwner]/[string templateRepo]/generate(oas:TemplateRepoGenerateBody payload, map<string|string[]> headers = {}) returns oas:Repository|error {
        return self.genClient->/repos/[templateOwner]/[templateRepo]/generate.post(payload, headers);
    }

    # List public repositories
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repositories(map<string|string[]> headers = {}, *oas:ReposListPublicQueries queries) returns oas:MinimalRepository[]|error? {
        return self.genClient->/repositories.get(headers, queries);
    }

    # List environment secrets
    #
    # + repositoryId - The unique identifier of the repository
    # + environmentName - The name of the environment
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repositories/[int repositoryId]/environments/[string environmentName]/secrets(map<string|string[]> headers = {}, *oas:ActionsListEnvironmentSecretsQueries queries) returns oas:ActionsSecretResponse|error {
        return self.genClient->/repositories/[repositoryId]/environments/[environmentName]/secrets.get(headers, queries);
    }

    # Get an environment secret
    #
    # + repositoryId - The unique identifier of the repository
    # + environmentName - The name of the environment
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repositories/[int repositoryId]/environments/[string environmentName]/secrets/[string secretName](map<string|string[]> headers = {}) returns oas:ActionsSecret|error {
        return self.genClient->/repositories/[repositoryId]/environments/[environmentName]/secrets/[secretName].get(headers);
    }

    # Create or update an environment secret
    #
    # + repositoryId - The unique identifier of the repository
    # + environmentName - The name of the environment
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response when creating a secret 
    resource isolated function put repositories/[int repositoryId]/environments/[string environmentName]/secrets/[string secretName](oas:SecretssecretNameBody6 payload, map<string|string[]> headers = {}) returns oas:EmptyObject|error? {
        return self.genClient->/repositories/[repositoryId]/environments/[environmentName]/secrets/[secretName].put(payload, headers);
    }

    # Delete an environment secret
    #
    # + repositoryId - The unique identifier of the repository
    # + environmentName - The name of the environment
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Default response 
    resource isolated function delete repositories/[int repositoryId]/environments/[string environmentName]/secrets/[string secretName](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repositories/[repositoryId]/environments/[environmentName]/secrets/[secretName].delete(headers);
    }

    # List environment variables
    #
    # + repositoryId - The unique identifier of the repository
    # + environmentName - The name of the environment
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get repositories/[int repositoryId]/environments/[string environmentName]/variables(map<string|string[]> headers = {}, *oas:ActionsListEnvironmentVariablesQueries queries) returns oas:ActionsVariableResponse|error {
        return self.genClient->/repositories/[repositoryId]/environments/[environmentName]/variables.get(headers, queries);
    }

    # Create an environment variable
    #
    # + repositoryId - The unique identifier of the repository
    # + environmentName - The name of the environment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post repositories/[int repositoryId]/environments/[string environmentName]/variables(oas:ActionsVariablesBody1 payload, map<string|string[]> headers = {}) returns oas:EmptyObject|error {
        return self.genClient->/repositories/[repositoryId]/environments/[environmentName]/variables.post(payload, headers);
    }

    # Get an environment variable
    #
    # + repositoryId - The unique identifier of the repository
    # + environmentName - The name of the environment
    # + name - The name of the variable
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get repositories/[int repositoryId]/environments/[string environmentName]/variables/[string name](map<string|string[]> headers = {}) returns oas:ActionsVariable|error {
        return self.genClient->/repositories/[repositoryId]/environments/[environmentName]/variables/[name].get(headers);
    }

    # Delete an environment variable
    #
    # + repositoryId - The unique identifier of the repository
    # + name - The name of the variable
    # + environmentName - The name of the environment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete repositories/[int repositoryId]/environments/[string environmentName]/variables/[string name](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repositories/[repositoryId]/environments/[environmentName]/variables/[name].delete(headers);
    }

    # Update an environment variable
    #
    # + repositoryId - The unique identifier of the repository
    # + name - The name of the variable
    # + environmentName - The name of the environment
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch repositories/[int repositoryId]/environments/[string environmentName]/variables/[string name](oas:VariablesnameBody1 payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/repositories/[repositoryId]/environments/[environmentName]/variables/[name].patch(payload, headers);
    }

    # Search code
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get search/code(map<string|string[]> headers = {}, *oas:SearchCodeQueries queries) returns oas:CodeSearchResultItemResponse|error? {
        return self.genClient->/search/code.get(headers, queries);
    }

    # Search commits
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get search/commits(map<string|string[]> headers = {}, *oas:SearchCommitsQueries queries) returns oas:CommitSearchResultItemResponse|error? {
        return self.genClient->/search/commits.get(headers, queries);
    }

    # Search issues and pull requests
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get search/issues(map<string|string[]> headers = {}, *oas:SearchIssuesAndPullRequestsQueries queries) returns oas:IssueSearchResultItemResponse|error? {
        return self.genClient->/search/issues.get(headers, queries);
    }

    # Search labels
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get search/labels(map<string|string[]> headers = {}, *oas:SearchLabelsQueries queries) returns oas:LabelSearchResultItemResponse|error? {
        return self.genClient->/search/labels.get(headers, queries);
    }

    # Search repositories
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get search/repositories(map<string|string[]> headers = {}, *oas:SearchReposQueries queries) returns oas:RepoSearchResultItemResponse|error? {
        return self.genClient->/search/repositories.get(headers, queries);
    }

    # Search topics
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get search/topics(map<string|string[]> headers = {}, *oas:SearchTopicsQueries queries) returns oas:TopicSearchResultItemResponse|error? {
        return self.genClient->/search/topics.get(headers, queries);
    }

    # Search users
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get search/users(map<string|string[]> headers = {}, *oas:SearchUsersQueries queries) returns oas:UserSearchResultItemResponse|error? {
        return self.genClient->/search/users.get(headers, queries);
    }

    resource isolated function get teams/[int teamId](map<string|string[]> headers = {}) returns oas:TeamFull|error {
        return self.genClient->/teams/[teamId].get(headers);
    }

    resource isolated function delete teams/[int teamId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/teams/[teamId].delete(headers);
    }

    resource isolated function patch teams/[int teamId](oas:TeamsteamIdBody payload, map<string|string[]> headers = {}) returns oas:TeamFull|error {
        return self.genClient->/teams/[teamId].patch(payload, headers);
    }

    resource isolated function get teams/[int teamId]/discussions(map<string|string[]> headers = {}, *oas:TeamsListDiscussionsLegacyQueries queries) returns oas:TeamDiscussion[]|error {
        return self.genClient->/teams/[teamId]/discussions.get(headers, queries);
    }

    resource isolated function post teams/[int teamId]/discussions(oas:TeamSlugDiscussionsBody payload, map<string|string[]> headers = {}) returns oas:TeamDiscussion|error {
        return self.genClient->/teams/[teamId]/discussions.post(payload, headers);
    }

    resource isolated function get teams/[int teamId]/discussions/[int discussionNumber](map<string|string[]> headers = {}) returns oas:TeamDiscussion|error {
        return self.genClient->/teams/[teamId]/discussions/[discussionNumber].get(headers);
    }

    resource isolated function delete teams/[int teamId]/discussions/[int discussionNumber](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/teams/[teamId]/discussions/[discussionNumber].delete(headers);
    }

    resource isolated function patch teams/[int teamId]/discussions/[int discussionNumber](oas:DiscussionsdiscussionNumberBody payload, map<string|string[]> headers = {}) returns oas:TeamDiscussion|error {
        return self.genClient->/teams/[teamId]/discussions/[discussionNumber].patch(payload, headers);
    }

    resource isolated function get teams/[int teamId]/discussions/[int discussionNumber]/comments(map<string|string[]> headers = {}, *oas:TeamsListDiscussionCommentsLegacyQueries queries) returns oas:TeamDiscussionComment[]|error {
        return self.genClient->/teams/[teamId]/discussions/[discussionNumber]/comments.get(headers, queries);
    }

    resource isolated function post teams/[int teamId]/discussions/[int discussionNumber]/comments(oas:DiscussionNumberCommentsBody payload, map<string|string[]> headers = {}) returns oas:TeamDiscussionComment|error {
        return self.genClient->/teams/[teamId]/discussions/[discussionNumber]/comments.post(payload, headers);
    }

    resource isolated function get teams/[int teamId]/discussions/[int discussionNumber]/comments/[int commentNumber](map<string|string[]> headers = {}) returns oas:TeamDiscussionComment|error {
        return self.genClient->/teams/[teamId]/discussions/[discussionNumber]/comments/[commentNumber].get(headers);
    }

    resource isolated function delete teams/[int teamId]/discussions/[int discussionNumber]/comments/[int commentNumber](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/teams/[teamId]/discussions/[discussionNumber]/comments/[commentNumber].delete(headers);
    }

    resource isolated function patch teams/[int teamId]/discussions/[int discussionNumber]/comments/[int commentNumber](oas:DiscussionNumberCommentsBody payload, map<string|string[]> headers = {}) returns oas:TeamDiscussionComment|error {
        return self.genClient->/teams/[teamId]/discussions/[discussionNumber]/comments/[commentNumber].patch(payload, headers);
    }

    resource isolated function get teams/[int teamId]/discussions/[int discussionNumber]/comments/[int commentNumber]/reactions(map<string|string[]> headers = {}, *oas:ReactionsListForTeamDiscussionCommentLegacyQueries queries) returns oas:Reaction[]|error {
        return self.genClient->/teams/[teamId]/discussions/[discussionNumber]/comments/[commentNumber]/reactions.get(headers, queries);
    }

    resource isolated function post teams/[int teamId]/discussions/[int discussionNumber]/comments/[int commentNumber]/reactions(oas:CommentNumberReactionsBody payload, map<string|string[]> headers = {}) returns oas:Reaction|error {
        return self.genClient->/teams/[teamId]/discussions/[discussionNumber]/comments/[commentNumber]/reactions.post(payload, headers);
    }

    resource isolated function get teams/[int teamId]/discussions/[int discussionNumber]/reactions(map<string|string[]> headers = {}, *oas:ReactionsListForTeamDiscussionLegacyQueries queries) returns oas:Reaction[]|error {
        return self.genClient->/teams/[teamId]/discussions/[discussionNumber]/reactions.get(headers, queries);
    }

    resource isolated function post teams/[int teamId]/discussions/[int discussionNumber]/reactions(oas:DiscussionNumberReactionsBody payload, map<string|string[]> headers = {}) returns oas:Reaction|error {
        return self.genClient->/teams/[teamId]/discussions/[discussionNumber]/reactions.post(payload, headers);
    }

    resource isolated function get teams/[int teamId]/invitations(map<string|string[]> headers = {}, *oas:TeamsListPendingInvitationsLegacyQueries queries) returns oas:OrganizationInvitation[]|error {
        return self.genClient->/teams/[teamId]/invitations.get(headers, queries);
    }

    resource isolated function get teams/[int teamId]/members(map<string|string[]> headers = {}, *oas:TeamsListMembersLegacyQueries queries) returns oas:SimpleUser[]|error {
        return self.genClient->/teams/[teamId]/members.get(headers, queries);
    }

    resource isolated function get teams/[int teamId]/members/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/teams/[teamId]/members/[username].get(headers);
    }

    resource isolated function put teams/[int teamId]/members/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/teams/[teamId]/members/[username].put(headers);
    }

    resource isolated function delete teams/[int teamId]/members/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/teams/[teamId]/members/[username].delete(headers);
    }

    resource isolated function get teams/[int teamId]/memberships/[string username](map<string|string[]> headers = {}) returns oas:TeamMembership|error {
        return self.genClient->/teams/[teamId]/memberships/[username].get(headers);
    }

    resource isolated function put teams/[int teamId]/memberships/[string username](oas:MembershipsusernameBody1 payload, map<string|string[]> headers = {}) returns oas:TeamMembership|error {
        return self.genClient->/teams/[teamId]/memberships/[username].put(payload, headers);
    }

    resource isolated function delete teams/[int teamId]/memberships/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/teams/[teamId]/memberships/[username].delete(headers);
    }

    resource isolated function get teams/[int teamId]/repos(map<string|string[]> headers = {}, *oas:TeamsListReposLegacyQueries queries) returns oas:MinimalRepository[]|error {
        return self.genClient->/teams/[teamId]/repos.get(headers, queries);
    }

    resource isolated function get teams/[int teamId]/repos/[string owner]/[string repo](map<string|string[]> headers = {}) returns oas:TeamRepository|error? {
        return self.genClient->/teams/[teamId]/repos/[owner]/[repo].get(headers);
    }

    resource isolated function put teams/[int teamId]/repos/[string owner]/[string repo](oas:OwnerrepoBody2 payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/teams/[teamId]/repos/[owner]/[repo].put(payload, headers);
    }

    resource isolated function delete teams/[int teamId]/repos/[string owner]/[string repo](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/teams/[teamId]/repos/[owner]/[repo].delete(headers);
    }

    resource isolated function get teams/[int teamId]/teams(map<string|string[]> headers = {}, *oas:TeamsListChildLegacyQueries queries) returns oas:Team[]|error {
        return self.genClient->/teams/[teamId]/teams.get(headers, queries);
    }

    # Get the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get user(map<string|string[]> headers = {}) returns oas:UserResponse|error? {
        return self.genClient->/user.get(headers);
    }

    # Update the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch user(oas:UserBody payload, map<string|string[]> headers = {}) returns oas:PrivateUser|error? {
        return self.genClient->/user.patch(payload, headers);
    }

    # List users blocked by the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/blocks(map<string|string[]> headers = {}, *oas:UsersListBlockedByAuthenticatedUserQueries queries) returns oas:SimpleUser[]|error? {
        return self.genClient->/user/blocks.get(headers, queries);
    }

    # Check if a user is blocked by the authenticated user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - If the user is blocked 
    resource isolated function get user/blocks/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/blocks/[username].get(headers);
    }

    # Block a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put user/blocks/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/blocks/[username].put(headers);
    }

    # Unblock a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete user/blocks/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/blocks/[username].delete(headers);
    }

    # List codespaces for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/codespaces(map<string|string[]> headers = {}, *oas:CodespacesListForAuthenticatedUserQueries queries) returns oas:CodespaceResponse|error? {
        return self.genClient->/user/codespaces.get(headers, queries);
    }

    # Create a codespace for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + return - Response when the codespace was successfully created 
    resource isolated function post user/codespaces(oas:UserCodespacesBody payload, map<string|string[]> headers = {}) returns oas:Codespace|error {
        return self.genClient->/user/codespaces.post(payload, headers);
    }

    # Get a secret for the authenticated user
    #
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get user/codespaces/secrets/[string secretName](map<string|string[]> headers = {}) returns oas:CodespacesSecret|error {
        return self.genClient->/user/codespaces/secrets/[secretName].get(headers);
    }

    # Create or update a secret for the authenticated user
    #
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response after successfully creating a secret 
    resource isolated function put user/codespaces/secrets/[string secretName](oas:SecretssecretNameBody7 payload, map<string|string[]> headers = {}) returns oas:EmptyObject|error? {
        return self.genClient->/user/codespaces/secrets/[secretName].put(payload, headers);
    }

    # Delete a secret for the authenticated user
    #
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete user/codespaces/secrets/[string secretName](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/codespaces/secrets/[secretName].delete(headers);
    }

    # List selected repositories for a user secret
    #
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get user/codespaces/secrets/[string secretName]/repositories(map<string|string[]> headers = {}) returns oas:MinimalRepositoryResponse|error {
        return self.genClient->/user/codespaces/secrets/[secretName]/repositories.get(headers);
    }

    # Set selected repositories for a user secret
    #
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - No Content when repositories were added to the selected list 
    resource isolated function put user/codespaces/secrets/[string secretName]/repositories(oas:SecretNameRepositoriesBody3 payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/codespaces/secrets/[secretName]/repositories.put(payload, headers);
    }

    # Add a selected repository to a user secret
    #
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - No Content when repository was added to the selected list 
    resource isolated function put user/codespaces/secrets/[string secretName]/repositories/[int repositoryId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/codespaces/secrets/[secretName]/repositories/[repositoryId].put(headers);
    }

    # Remove a selected repository from a user secret
    #
    # + secretName - The name of the secret
    # + headers - Headers to be sent with the request 
    # + return - No Content when repository was removed from the selected list 
    resource isolated function delete user/codespaces/secrets/[string secretName]/repositories/[int repositoryId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/codespaces/secrets/[secretName]/repositories/[repositoryId].delete(headers);
    }

    # Get a codespace for the authenticated user
    #
    # + codespaceName - The name of the codespace
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get user/codespaces/[string codespaceName](map<string|string[]> headers = {}) returns oas:Codespace|error? {
        return self.genClient->/user/codespaces/[codespaceName].get(headers);
    }

    # Delete a codespace for the authenticated user
    #
    # + codespaceName - The name of the codespace
    # + headers - Headers to be sent with the request 
    # + return - Accepted 
    resource isolated function delete user/codespaces/[string codespaceName](map<string|string[]> headers = {}) returns record {}|error? {
        return self.genClient->/user/codespaces/[codespaceName].delete(headers);
    }

    # Update a codespace for the authenticated user
    #
    # + codespaceName - The name of the codespace
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch user/codespaces/[string codespaceName](oas:CodespacescodespaceNameBody payload, map<string|string[]> headers = {}) returns oas:Codespace|error {
        return self.genClient->/user/codespaces/[codespaceName].patch(payload, headers);
    }

    # Export a codespace for the authenticated user
    #
    # + codespaceName - The name of the codespace
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post user/codespaces/[string codespaceName]/exports(map<string|string[]> headers = {}) returns oas:CodespaceExportDetails|error {
        return self.genClient->/user/codespaces/[codespaceName]/exports.post(headers);
    }

    # Get details about a codespace export
    #
    # + codespaceName - The name of the codespace
    # + exportId - The ID of the export operation, or latest. Currently only latest is currently supported
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get user/codespaces/[string codespaceName]/exports/[string exportId](map<string|string[]> headers = {}) returns oas:CodespaceExportDetails|error {
        return self.genClient->/user/codespaces/[codespaceName]/exports/[exportId].get(headers);
    }

    # List machine types for a codespace
    #
    # + codespaceName - The name of the codespace
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get user/codespaces/[string codespaceName]/machines(map<string|string[]> headers = {}) returns oas:CodespaceMachineResponse|error? {
        return self.genClient->/user/codespaces/[codespaceName]/machines.get(headers);
    }

    # Create a repository from an unpublished codespace
    #
    # + codespaceName - The name of the codespace
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post user/codespaces/[string codespaceName]/publish(oas:CodespaceNamePublishBody payload, map<string|string[]> headers = {}) returns oas:CodespaceWithFullRepository|error {
        return self.genClient->/user/codespaces/[codespaceName]/publish.post(payload, headers);
    }

    # Start a codespace for the authenticated user
    #
    # + codespaceName - The name of the codespace
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post user/codespaces/[string codespaceName]/'start(map<string|string[]> headers = {}) returns oas:Codespace|error? {
        return self.genClient->/user/codespaces/[codespaceName]/'start.post(headers);
    }

    # Stop a codespace for the authenticated user
    #
    # + codespaceName - The name of the codespace
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post user/codespaces/[string codespaceName]/stop(map<string|string[]> headers = {}) returns oas:Codespace|error {
        return self.genClient->/user/codespaces/[codespaceName]/stop.post(headers);
    }

    # Get list of conflicting packages during Docker migration for authenticated-user
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get user/docker/conflicts(map<string|string[]> headers = {}) returns oas:Package[]|error {
        return self.genClient->/user/docker/conflicts.get(headers);
    }

    # Set primary email visibility for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch user/email/visibility(oas:EmailVisibilityBody payload, map<string|string[]> headers = {}) returns oas:Email[]|error? {
        return self.genClient->/user/email/visibility.patch(payload, headers);
    }

    # List email addresses for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/emails(map<string|string[]> headers = {}, *oas:UsersListEmailsForAuthenticatedUserQueries queries) returns oas:Email[]|error? {
        return self.genClient->/user/emails.get(headers, queries);
    }

    # Add an email address for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post user/emails(oas:UserEmailsBody payload, map<string|string[]> headers = {}) returns oas:Email[]|error? {
        return self.genClient->/user/emails.post(payload, headers);
    }

    # Delete an email address for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete user/emails(oas:UserEmailsBody1 payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/emails.delete(payload, headers);
    }

    # List followers of the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/followers(map<string|string[]> headers = {}, *oas:UsersListFollowersForAuthenticatedUserQueries queries) returns oas:SimpleUser[]|error? {
        return self.genClient->/user/followers.get(headers, queries);
    }

    # List the people the authenticated user follows
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/following(map<string|string[]> headers = {}, *oas:UsersListFollowedByAuthenticatedUserQueries queries) returns oas:SimpleUser[]|error? {
        return self.genClient->/user/following.get(headers, queries);
    }

    # Check if a person is followed by the authenticated user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - if the person is followed by the authenticated user 
    resource isolated function get user/following/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/following/[username].get(headers);
    }

    # Follow a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put user/following/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/following/[username].put(headers);
    }

    # Unfollow a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete user/following/[string username](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/following/[username].delete(headers);
    }

    # List GPG keys for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/gpg_keys(map<string|string[]> headers = {}, *oas:UsersListGpgKeysForAuthenticatedUserQueries queries) returns oas:GpgKey[]|error? {
        return self.genClient->/user/gpg_keys.get(headers, queries);
    }

    # Create a GPG key for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post user/gpg_keys(oas:UserGpgKeysBody payload, map<string|string[]> headers = {}) returns oas:GpgKey|error? {
        return self.genClient->/user/gpg_keys.post(payload, headers);
    }

    # Get a GPG key for the authenticated user
    #
    # + gpgKeyId - The unique identifier of the GPG key
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get user/gpg_keys/[int gpgKeyId](map<string|string[]> headers = {}) returns oas:GpgKey|error? {
        return self.genClient->/user/gpg_keys/[gpgKeyId].get(headers);
    }

    # Delete a GPG key for the authenticated user
    #
    # + gpgKeyId - The unique identifier of the GPG key
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete user/gpg_keys/[int gpgKeyId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/gpg_keys/[gpgKeyId].delete(headers);
    }

    # List app installations accessible to the user access token
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - You can find the permissions for the installation under the permissions key 
    resource isolated function get user/installations(map<string|string[]> headers = {}, *oas:AppsListInstallationsForAuthenticatedUserQueries queries) returns oas:InstallationResponse|error? {
        return self.genClient->/user/installations.get(headers, queries);
    }

    # List repositories accessible to the user access token
    #
    # + installationId - The unique identifier of the installation
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - The access the user has to each repository is included in the hash under the permissions key 
    resource isolated function get user/installations/[int installationId]/repositories(map<string|string[]> headers = {}, *oas:AppsListInstallationReposForAuthenticatedUserQueries queries) returns oas:RepositoryResponse|error? {
        return self.genClient->/user/installations/[installationId]/repositories.get(headers, queries);
    }

    # Add a repository to an app installation
    #
    # + installationId - The unique identifier of the installation
    # + repositoryId - The unique identifier of the repository
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put user/installations/[int installationId]/repositories/[int repositoryId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/installations/[installationId]/repositories/[repositoryId].put(headers);
    }

    # Remove a repository from an app installation
    #
    # + installationId - The unique identifier of the installation
    # + repositoryId - The unique identifier of the repository
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete user/installations/[int installationId]/repositories/[int repositoryId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/installations/[installationId]/repositories/[repositoryId].delete(headers);
    }

    # Get interaction restrictions for your public repositories
    #
    # + headers - Headers to be sent with the request 
    # + return - Default response 
    resource isolated function get user/interaction\-limits(map<string|string[]> headers = {}) returns oas:InteractionLimitResponseAny|error? {
        return self.genClient->/user/interaction\-limits.get(headers);
    }

    # Set interaction restrictions for your public repositories
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put user/interaction\-limits(oas:InteractionLimit payload, map<string|string[]> headers = {}) returns oas:InteractionLimitResponse|error {
        return self.genClient->/user/interaction\-limits.put(payload, headers);
    }

    # Remove interaction restrictions from your public repositories
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete user/interaction\-limits(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/interaction\-limits.delete(headers);
    }

    # List user account issues assigned to the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/issues(map<string|string[]> headers = {}, *oas:IssuesListForAuthenticatedUserQueries queries) returns oas:Issue[]|error? {
        return self.genClient->/user/issues.get(headers, queries);
    }

    # List public SSH keys for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/keys(map<string|string[]> headers = {}, *oas:UsersListPublicSshKeysForAuthenticatedUserQueries queries) returns oas:Key[]|error? {
        return self.genClient->/user/keys.get(headers, queries);
    }

    # Create a public SSH key for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post user/keys(oas:UserKeysBody payload, map<string|string[]> headers = {}) returns oas:Key|error? {
        return self.genClient->/user/keys.post(payload, headers);
    }

    # Get a public SSH key for the authenticated user
    #
    # + keyId - The unique identifier of the key
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get user/keys/[int keyId](map<string|string[]> headers = {}) returns oas:Key|error? {
        return self.genClient->/user/keys/[keyId].get(headers);
    }

    # Delete a public SSH key for the authenticated user
    #
    # + keyId - The unique identifier of the key
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete user/keys/[int keyId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/keys/[keyId].delete(headers);
    }

    # List subscriptions for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/marketplace_purchases(map<string|string[]> headers = {}, *oas:AppsListSubscriptionsForAuthenticatedUserQueries queries) returns oas:UserMarketplacePurchase[]|error? {
        return self.genClient->/user/marketplace_purchases.get(headers, queries);
    }

    # List subscriptions for the authenticated user (stubbed)
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/marketplace_purchases/stubbed(map<string|string[]> headers = {}, *oas:AppsListSubscriptionsForAuthenticatedUserStubbedQueries queries) returns oas:UserMarketplacePurchase[]|error? {
        return self.genClient->/user/marketplace_purchases/stubbed.get(headers, queries);
    }

    # List organization memberships for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/memberships/orgs(map<string|string[]> headers = {}, *oas:OrgsListMembershipsForAuthenticatedUserQueries queries) returns oas:OrgMembership[]|error? {
        return self.genClient->/user/memberships/orgs.get(headers, queries);
    }

    # Get an organization membership for the authenticated user
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get user/memberships/orgs/[string org](map<string|string[]> headers = {}) returns oas:OrgMembership|error {
        return self.genClient->/user/memberships/orgs/[org].get(headers);
    }

    # Update an organization membership for the authenticated user
    #
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch user/memberships/orgs/[string org](oas:OrgsorgBody1 payload, map<string|string[]> headers = {}) returns oas:OrgMembership|error {
        return self.genClient->/user/memberships/orgs/[org].patch(payload, headers);
    }

    # List user migrations
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/migrations(map<string|string[]> headers = {}, *oas:MigrationsListForAuthenticatedUserQueries queries) returns oas:Migration[]|error? {
        return self.genClient->/user/migrations.get(headers, queries);
    }

    # Start a user migration
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post user/migrations(oas:UserMigrationsBody payload, map<string|string[]> headers = {}) returns oas:Migration|error? {
        return self.genClient->/user/migrations.post(payload, headers);
    }

    # Get a user migration status
    #
    # + migrationId - The unique identifier of the migration
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/migrations/[int migrationId](map<string|string[]> headers = {}, *oas:MigrationsGetStatusForAuthenticatedUserQueries queries) returns oas:Migration|error? {
        return self.genClient->/user/migrations/[migrationId].get(headers, queries);
    }

    # Download a user migration archive
    #
    # + migrationId - The unique identifier of the migration
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get user/migrations/[int migrationId]/archive(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/migrations/[migrationId]/archive.get(headers);
    }

    # Delete a user migration archive
    #
    # + migrationId - The unique identifier of the migration
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete user/migrations/[int migrationId]/archive(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/migrations/[migrationId]/archive.delete(headers);
    }

    # Unlock a user repository
    #
    # + migrationId - The unique identifier of the migration
    # + repoName - repo_name parameter
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete user/migrations/[int migrationId]/repos/[string repoName]/'lock(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/migrations/[migrationId]/repos/[repoName]/'lock.delete(headers);
    }

    # List repositories for a user migration
    #
    # + migrationId - The unique identifier of the migration
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/migrations/[int migrationId]/repositories(map<string|string[]> headers = {}, *oas:MigrationsListReposForAuthenticatedUserQueries queries) returns oas:MinimalRepository[]|error {
        return self.genClient->/user/migrations/[migrationId]/repositories.get(headers, queries);
    }

    # List organizations for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/orgs(map<string|string[]> headers = {}, *oas:OrgsListForAuthenticatedUserQueries queries) returns oas:OrganizationSimple[]|error? {
        return self.genClient->/user/orgs.get(headers, queries);
    }

    # List packages for the authenticated user's namespace
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/packages(map<string|string[]> headers = {}, *oas:PackagesListPackagesForAuthenticatedUserQueries queries) returns oas:Package[]|error {
        return self.genClient->/user/packages.get(headers, queries);
    }

    # Get a package for the authenticated user
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get user/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName](map<string|string[]> headers = {}) returns oas:Package|error {
        return self.genClient->/user/packages/[packageType]/[packageName].get(headers);
    }

    # Delete a package for the authenticated user
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete user/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/packages/[packageType]/[packageName].delete(headers);
    }

    # Restore a package for the authenticated user
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function post user/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName]/restore(map<string|string[]> headers = {}, *oas:PackagesRestorePackageForAuthenticatedUserQueries queries) returns error? {
        return self.genClient->/user/packages/[packageType]/[packageName]/restore.post(headers, queries);
    }

    # List package versions for a package owned by the authenticated user
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName]/versions(map<string|string[]> headers = {}, *oas:PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserQueries queries) returns oas:PackageVersion[]|error {
        return self.genClient->/user/packages/[packageType]/[packageName]/versions.get(headers, queries);
    }

    # Get a package version for the authenticated user
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + packageVersionId - Unique identifier of the package version
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get user/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName]/versions/[int packageVersionId](map<string|string[]> headers = {}) returns oas:PackageVersion|error {
        return self.genClient->/user/packages/[packageType]/[packageName]/versions/[packageVersionId].get(headers);
    }

    # Delete a package version for the authenticated user
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + packageVersionId - Unique identifier of the package version
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete user/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName]/versions/[int packageVersionId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/packages/[packageType]/[packageName]/versions/[packageVersionId].delete(headers);
    }

    # Restore a package version for the authenticated user
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + packageVersionId - Unique identifier of the package version
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post user/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName]/versions/[int packageVersionId]/restore(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/packages/[packageType]/[packageName]/versions/[packageVersionId]/restore.post(headers);
    }

    # List public email addresses for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/public_emails(map<string|string[]> headers = {}, *oas:UsersListPublicEmailsForAuthenticatedUserQueries queries) returns oas:Email[]|error? {
        return self.genClient->/user/public_emails.get(headers, queries);
    }

    # List repositories for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/repos(map<string|string[]> headers = {}, *oas:ReposListForAuthenticatedUserQueries queries) returns oas:Repository[]|error? {
        return self.genClient->/user/repos.get(headers, queries);
    }

    # Create a repository for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post user/repos(oas:UserReposBody payload, map<string|string[]> headers = {}) returns oas:Repository|error? {
        return self.genClient->/user/repos.post(payload, headers);
    }

    # List repository invitations for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/repository_invitations(map<string|string[]> headers = {}, *oas:ReposListInvitationsForAuthenticatedUserQueries queries) returns oas:RepositoryInvitation[]|error? {
        return self.genClient->/user/repository_invitations.get(headers, queries);
    }

    # Decline a repository invitation
    #
    # + invitationId - The unique identifier of the invitation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete user/repository_invitations/[int invitationId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/repository_invitations/[invitationId].delete(headers);
    }

    # Accept a repository invitation
    #
    # + invitationId - The unique identifier of the invitation
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function patch user/repository_invitations/[int invitationId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/repository_invitations/[invitationId].patch(headers);
    }

    # List social accounts for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/social_accounts(map<string|string[]> headers = {}, *oas:UsersListSocialAccountsForAuthenticatedUserQueries queries) returns oas:SocialAccount[]|error? {
        return self.genClient->/user/social_accounts.get(headers, queries);
    }

    # Add social accounts for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post user/social_accounts(oas:UserSocialAccountsBody payload, map<string|string[]> headers = {}) returns oas:SocialAccount[]|error? {
        return self.genClient->/user/social_accounts.post(payload, headers);
    }

    # Delete social accounts for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete user/social_accounts(oas:UserSocialAccountsBody1 payload, map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/social_accounts.delete(payload, headers);
    }

    # List SSH signing keys for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/ssh_signing_keys(map<string|string[]> headers = {}, *oas:UsersListSshSigningKeysForAuthenticatedUserQueries queries) returns oas:SshSigningKey[]|error? {
        return self.genClient->/user/ssh_signing_keys.get(headers, queries);
    }

    # Create a SSH signing key for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post user/ssh_signing_keys(oas:UserSshSigningKeysBody payload, map<string|string[]> headers = {}) returns oas:SshSigningKey|error? {
        return self.genClient->/user/ssh_signing_keys.post(payload, headers);
    }

    # Get an SSH signing key for the authenticated user
    #
    # + sshSigningKeyId - The unique identifier of the SSH signing key
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get user/ssh_signing_keys/[int sshSigningKeyId](map<string|string[]> headers = {}) returns oas:SshSigningKey|error? {
        return self.genClient->/user/ssh_signing_keys/[sshSigningKeyId].get(headers);
    }

    # Delete an SSH signing key for the authenticated user
    #
    # + sshSigningKeyId - The unique identifier of the SSH signing key
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete user/ssh_signing_keys/[int sshSigningKeyId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/ssh_signing_keys/[sshSigningKeyId].delete(headers);
    }

    # List repositories starred by the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/starred(map<string|string[]> headers = {}, *oas:ActivityListReposStarredByAuthenticatedUserQueries queries) returns oas:Repository[]|error? {
        return self.genClient->/user/starred.get(headers, queries);
    }

    # Check if a repository is starred by the authenticated user
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response if this repository is starred by you 
    resource isolated function get user/starred/[string owner]/[string repo](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/starred/[owner]/[repo].get(headers);
    }

    # Star a repository for the authenticated user
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function put user/starred/[string owner]/[string repo](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/starred/[owner]/[repo].put(headers);
    }

    # Unstar a repository for the authenticated user
    #
    # + owner - The account owner of the repository. The name is not case sensitive
    # + repo - The name of the repository without the .git extension. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete user/starred/[string owner]/[string repo](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/user/starred/[owner]/[repo].delete(headers);
    }

    # List repositories watched by the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/subscriptions(map<string|string[]> headers = {}, *oas:ActivityListWatchedReposForAuthenticatedUserQueries queries) returns oas:MinimalRepository[]|error? {
        return self.genClient->/user/subscriptions.get(headers, queries);
    }

    # List teams for the authenticated user
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get user/teams(map<string|string[]> headers = {}, *oas:TeamsListForAuthenticatedUserQueries queries) returns oas:TeamFull[]|error? {
        return self.genClient->/user/teams.get(headers, queries);
    }

    # List users
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users(map<string|string[]> headers = {}, *oas:UsersListQueries queries) returns oas:SimpleUser[]|error? {
        return self.genClient->/users.get(headers, queries);
    }

    # Get a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username](map<string|string[]> headers = {}) returns oas:UserResponse|error {
        return self.genClient->/users/[username].get(headers);
    }

    # Get list of conflicting packages during Docker migration for user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/docker/conflicts(map<string|string[]> headers = {}) returns oas:Package[]|error {
        return self.genClient->/users/[username]/docker/conflicts.get(headers);
    }

    # List events for the authenticated user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/events(map<string|string[]> headers = {}, *oas:ActivityListEventsForAuthenticatedUserQueries queries) returns oas:Event[]|error {
        return self.genClient->/users/[username]/events.get(headers, queries);
    }

    # List organization events for the authenticated user
    #
    # + username - The handle for the GitHub user account
    # + org - The organization name. The name is not case sensitive
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/events/orgs/[string org](map<string|string[]> headers = {}, *oas:ActivityListOrgEventsForAuthenticatedUserQueries queries) returns oas:Event[]|error {
        return self.genClient->/users/[username]/events/orgs/[org].get(headers, queries);
    }

    # List public events for a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/events/'public(map<string|string[]> headers = {}, *oas:ActivityListPublicEventsForUserQueries queries) returns oas:Event[]|error {
        return self.genClient->/users/[username]/events/'public.get(headers, queries);
    }

    # List followers of a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/followers(map<string|string[]> headers = {}, *oas:UsersListFollowersForUserQueries queries) returns oas:SimpleUser[]|error {
        return self.genClient->/users/[username]/followers.get(headers, queries);
    }

    # List the people a user follows
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/following(map<string|string[]> headers = {}, *oas:UsersListFollowingForUserQueries queries) returns oas:SimpleUser[]|error {
        return self.genClient->/users/[username]/following.get(headers, queries);
    }

    # Check if a user follows another user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - if the user follows the target user 
    resource isolated function get users/[string username]/following/[string targetUser](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/users/[username]/following/[targetUser].get(headers);
    }

    # List gists for a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/gists(map<string|string[]> headers = {}, *oas:GistsListForUserQueries queries) returns oas:BaseGist[]|error {
        return self.genClient->/users/[username]/gists.get(headers, queries);
    }

    # List GPG keys for a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/gpg_keys(map<string|string[]> headers = {}, *oas:UsersListGpgKeysForUserQueries queries) returns oas:GpgKey[]|error {
        return self.genClient->/users/[username]/gpg_keys.get(headers, queries);
    }

    # Get contextual information for a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/hovercard(map<string|string[]> headers = {}, *oas:UsersGetContextForUserQueries queries) returns oas:Hovercard|error {
        return self.genClient->/users/[username]/hovercard.get(headers, queries);
    }

    # Get a user installation for the authenticated app
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/installation(map<string|string[]> headers = {}) returns oas:Installation|error {
        return self.genClient->/users/[username]/installation.get(headers);
    }

    # List public keys for a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/keys(map<string|string[]> headers = {}, *oas:UsersListPublicKeysForUserQueries queries) returns oas:KeySimple[]|error {
        return self.genClient->/users/[username]/keys.get(headers, queries);
    }

    # List organizations for a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/orgs(map<string|string[]> headers = {}, *oas:OrgsListForUserQueries queries) returns oas:OrganizationSimple[]|error {
        return self.genClient->/users/[username]/orgs.get(headers, queries);
    }

    # List packages for a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/packages(map<string|string[]> headers = {}, *oas:PackagesListPackagesForUserQueries queries) returns oas:Package[]|error {
        return self.genClient->/users/[username]/packages.get(headers, queries);
    }

    # Get a package for a user
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName](map<string|string[]> headers = {}) returns oas:Package|error {
        return self.genClient->/users/[username]/packages/[packageType]/[packageName].get(headers);
    }

    # Delete a package for a user
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete users/[string username]/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/users/[username]/packages/[packageType]/[packageName].delete(headers);
    }

    # Restore a package for a user
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function post users/[string username]/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName]/restore(map<string|string[]> headers = {}, *oas:PackagesRestorePackageForUserQueries queries) returns error? {
        return self.genClient->/users/[username]/packages/[packageType]/[packageName]/restore.post(headers, queries);
    }

    # List package versions for a package owned by a user
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName]/versions(map<string|string[]> headers = {}) returns oas:PackageVersion[]|error {
        return self.genClient->/users/[username]/packages/[packageType]/[packageName]/versions.get(headers);
    }

    # Get a package version for a user
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + packageVersionId - Unique identifier of the package version
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName]/versions/[int packageVersionId](map<string|string[]> headers = {}) returns oas:PackageVersion|error {
        return self.genClient->/users/[username]/packages/[packageType]/[packageName]/versions/[packageVersionId].get(headers);
    }

    # Delete package version for a user
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + username - The handle for the GitHub user account
    # + packageVersionId - Unique identifier of the package version
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function delete users/[string username]/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName]/versions/[int packageVersionId](map<string|string[]> headers = {}) returns error? {
        return self.genClient->/users/[username]/packages/[packageType]/[packageName]/versions/[packageVersionId].delete(headers);
    }

    # Restore package version for a user
    #
    # + packageType - The type of supported package. Packages in GitHub's Gradle registry have the type maven. Docker images pushed to GitHub's Container registry (ghcr.io) have the type container. You can use the type docker to find images that were pushed to GitHub's Docker registry (docker.pkg.github.com), even if these have now been migrated to the Container registry
    # + packageName - The name of the package
    # + username - The handle for the GitHub user account
    # + packageVersionId - Unique identifier of the package version
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function post users/[string username]/packages/["npm"|"maven"|"rubygems"|"docker"|"nuget"|"container" packageType]/[string packageName]/versions/[int packageVersionId]/restore(map<string|string[]> headers = {}) returns error? {
        return self.genClient->/users/[username]/packages/[packageType]/[packageName]/versions/[packageVersionId]/restore.post(headers);
    }

    # List events received by the authenticated user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/received_events(map<string|string[]> headers = {}, *oas:ActivityListReceivedEventsForUserQueries queries) returns oas:Event[]|error {
        return self.genClient->/users/[username]/received_events.get(headers, queries);
    }

    # List public events received by a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/received_events/'public(map<string|string[]> headers = {}, *oas:ActivityListReceivedPublicEventsForUserQueries queries) returns oas:Event[]|error {
        return self.genClient->/users/[username]/received_events/'public.get(headers, queries);
    }

    # List repositories for a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/repos(map<string|string[]> headers = {}, *oas:ReposListForUserQueries queries) returns oas:MinimalRepository[]|error {
        return self.genClient->/users/[username]/repos.get(headers, queries);
    }

    # Get GitHub Actions billing for a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/settings/billing/actions(map<string|string[]> headers = {}) returns oas:ActionsBillingUsage|error {
        return self.genClient->/users/[username]/settings/billing/actions.get(headers);
    }

    # Get GitHub Packages billing for a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/settings/billing/packages(map<string|string[]> headers = {}) returns oas:PackagesBillingUsage|error {
        return self.genClient->/users/[username]/settings/billing/packages.get(headers);
    }

    # Get shared storage billing for a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/settings/billing/shared\-storage(map<string|string[]> headers = {}) returns oas:CombinedBillingUsage|error {
        return self.genClient->/users/[username]/settings/billing/shared\-storage.get(headers);
    }

    # List social accounts for a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/social_accounts(map<string|string[]> headers = {}, *oas:UsersListSocialAccountsForUserQueries queries) returns oas:SocialAccount[]|error {
        return self.genClient->/users/[username]/social_accounts.get(headers, queries);
    }

    # List SSH signing keys for a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/ssh_signing_keys(map<string|string[]> headers = {}, *oas:UsersListSshSigningKeysForUserQueries queries) returns oas:SshSigningKey[]|error {
        return self.genClient->/users/[username]/ssh_signing_keys.get(headers, queries);
    }

    # List repositories starred by a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/starred(map<string|string[]> headers = {}, *oas:ActivityListReposStarredByUserQueries queries) returns oas:StarredRepositoryResponse|error {
        return self.genClient->/users/[username]/starred.get(headers, queries);
    }

    # List repositories watched by a user
    #
    # + username - The handle for the GitHub user account
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Response 
    resource isolated function get users/[string username]/subscriptions(map<string|string[]> headers = {}, *oas:ActivityListReposWatchedByUserQueries queries) returns oas:MinimalRepository[]|error {
        return self.genClient->/users/[username]/subscriptions.get(headers, queries);
    }

    # Get all API versions
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get versions(map<string|string[]> headers = {}) returns string[]|error {
        return self.genClient->/versions.get(headers);
    }

    # Get the Zen of GitHub
    #
    # + headers - Headers to be sent with the request 
    # + return - Response 
    resource isolated function get zen(map<string|string[]> headers = {}) returns string|error {
        return self.genClient->/zen.get(headers);
    }

    // ============================================================
    // COMPOSITE OPERATIONS - hand-maintained in scripts/composites.bal
    // ============================================================

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

}

// ============================================================
// Module-level helpers for composite operations (hand-maintained
// alongside scripts/composites.bal, spliced in here since Ballerina
// does not allow top-level declarations inside a class body).
// ============================================================

# The combined CI status for a ref: legacy commit statuses plus Checks API runs.
#
# + statuses - The legacy combined commit status
# + checkRuns - Check runs reported through the Checks API
public type CombinedCiStatus record {|
    oas:CombinedCommitStatus statuses;
    oas:CheckRun[] checkRuns;
|};

# True if the given error represents an HTTP 404 response from the underlying client.
isolated function isNotFound(error err) returns boolean {
    map<anydata> detail = <map<anydata>> err.detail();
    anydata statusCode = detail["statusCode"];
    if statusCode is int {
        return statusCode == 404;
    }
    return err.message().includes("404");
}
