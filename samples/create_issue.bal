
// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
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

import ballerina/log;
import ballerinax/github;

github:GitHubConfiguration gitHubConfig = {
    accessToken: "<access token>"
};

github:Client githubClient = new (gitHubConfig);

public function main() {
    log:print("githubClient -> createIssue()");

    string repositoryOwner = "MadhurangaWije";
    string repositoryName = "github-connector";
    string issueTitle = "This is a test issue title";
    string issueContent = "This is the body of the test issue from the sample code";
    string[] issueLabelList = ["bug", "critical"];
    string[] issueAssigneeList = ["MadhurangaWije"];

    var createdIssue = githubClient->createIssue(repositoryOwner, repositoryName,
    issueTitle, issueContent, issueLabelList, issueAssigneeList);
    
    if (createdIssue is github:Issue) {
        log:print("Created Issue: "+ createdIssue.toString());
    } else {
        log:printError("Error: "+ createdIssue.toString());
    }
}