# Ballerina GitHub Endpoint - Tests

###### GitHub brings together the world's largest community of developers to discover, share, and build better software. From open source projects to private team repositories, GitHub is an all-in-one platform for collaborative development.

The Ballerina GitHub endpoint allow users to access the GitHub API through ballerina. This endpoint uses the GitHub GraphQL API v4.0

| Ballerina Version | GitHub API Version |
|-------------------|--------------------|
| SwanLake Preview 8| v4                 |

## Running tests

Initialize a ballerina project
```
ballerina init
```

All the tests inside this module will make HTTP calls to the GitHub GraphQL API v4. If the HTTP call fails, then so will the test case.

In order to run the tests, the user will need to have a GitHub Personal Access Token. The token can be obtained by visiting

**https://github.com/{profile} -> Settings -> Developer Settings -> Personal access tokens**

and provide the obtained token to the client endpoint configuration by adding the following fields to the `ballerina
.conf`

```.conf
ACCESS_TOKEN="ACCESS_TOKEN"
ORG_NAME = ""
RESOURCE_PATH = ""
```

```ballerina
github4:GitHubConfiguration gitHubConfig = {
    accessToken: "access_token"
};
 
github4:Client githubClient = new (gitHubConfig);
```

Run tests :
```
ballerina test github4 --config ballerina.conf
```