// Copyright (c) 2018, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                              Organization object                                                  //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

# Represents a github organization.
# + id - Organization identification number
# + login - Organization login name
# + name - Organizaition public profile name
# + email - Organization public email
# + description - Organization public profile description
# + location - Organization public profile location
# + resourcePath - HTTP path for the resource
# + projectsResourcePath - HTTP path for the organization projects
# + projectsUrl - HTTP URL listing organization projects
# + url - HTTP URL for the organization
# + websiteUrl - Organization public profile URL
# + avatarUrl - Organization public avatar URL
public type Organization record {|
    string id = "";
    string login = "";
    string name = "";
    string email = "";
    string? description = "";
    string? location = "";
    string? resourcePath = "";
    string? projectsResourcePath = "";
    string? projectsUrl = "";
    string? url = "";
    string? websiteUrl = "";
    string? avatarUrl = "";
|};

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                       End of Organization object                                                  //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                              Repository object                                                    //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a github repository.
# + id - Repository identification number
# + name - Repository name
# + createdAt - Date and time the repository was created
# + updatedAt - Date and time the repository was updated
# + description - Description of the repository
# + forkCount - Number of forks there are of this repository in the entire network
# + hasIssuesEnabled - Indicates if the repository has issues feature enabled
# + hasWikiEnabled - Indicates if the repository has wiki feature enabled
# + isArchived - Indicates if the repository is unmaintained
# + isFork - Identifies if the repository is a fork
# + isLocked - Indicates if the repository has been locked or not
# + isMirror - Identifies if the repository is a mirror
# + isPrivate - Identifies if the repository is private
# + homepageUrl - Repository URL
# + lockReason - Reason the repository has been locked
# + mirrorUrl - Repository original mirror URL
# + url - HTTP URL for this repository
# + sshUrl - SSH URL to clone this repository
# + owner - Owner of the repository
# + primaryLanguage - Primary language of the repository code
# + stargazerCount - The count
public type Repository record {|
    string id = "";
    string name = "";
    string createdAt = "";
    string? updatedAt = "";
    string? description = "";
    int? forkCount = 0;
    boolean hasIssuesEnabled = false;
    boolean hasWikiEnabled = false;
    boolean isArchived = false;
    boolean isFork = false;
    boolean isLocked = false;
    boolean isMirror = false;
    boolean isPrivate = false;
    string? homepageUrl = "";
    string? lockReason = "";
    string? mirrorUrl = "";
    string? url = "";
    string? sshUrl = "";
    RepositoryOwner owner = {};
    Language primaryLanguage = {};
    int? stargazerCount = 0;
|};
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                           End of Repository object                                                //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                              RepositoryList object                                                //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a list of repositories.
public class RepositoryList {
    string repositoryListQuery = "";
    PageInfo pageInfo = {};
    Repository[] nodes = [];

    # Check if repository list next page is available.
    #
    # + return - Return true or false
    public isolated function hasNextPage() returns boolean {
        return self.pageInfo.hasNextPage;
    }

    # Check if repository list previous page is available.
    #
    # + return - Return true or false
    public isolated function hasPreviousPage() returns boolean {
        return self.pageInfo.hasPreviousPage;
    }

    # Get all the repositories in the repository list.
    #
    # + return - Array of Repository objects
    public isolated function getAllRepositories() returns Repository[] {
        return self.nodes;
    }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                         End of RepositoryList object                                              //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                              Project object                                                       //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a github project.
# + id - Project identification number
# + name - Project name
# + body - Project description body
# + number - Project number
# + createdAt - Date and time when the object was created
# + closed - Identifies whether the project is closed or not
# + closedAt - Date and time when the object was closed
# + updatedAt - Date and time when the object was last updated
# + resourcePath - HTTP path for this project
# + state - Identifies whether the project is open or closed
# + url - HTTP URL for this project
# + viewerCanUpdate - Identifies whether current viewer can update this object
# + creator - User who originally created the project
# + owner - Project owner (Repository or Organization)
public type Project record {|
    string id = "";
    string name = "";
    string body = "";
    int number = 0;
    string createdAt = "";
    string? closed = "";
    string? closedAt = "";
    string? updatedAt = "";
    string? resourcePath = "";
    string state = "";
    string url = "";
    boolean viewerCanUpdate = false;
    Creator creator = {};
    ProjectOwner owner = {};
|};

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             End of Project object                                                 //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                 ProjectList object                                                //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

# Represents a list of projects.
public class ProjectList {
    string listOwner = "";
    string projectListQuery = "";
    PageInfo pageInfo = {};
    Project[] nodes = [];

    # Check if project list next page is available.
    #
    # + return - Return true or false
    public isolated function hasNextPage() returns boolean {
        return self.pageInfo.hasNextPage;
    }

    # Check if project list previous page is available.
    #
    # + return - Return true or false
    public isolated function hasPreviousPage() returns boolean {
        return self.pageInfo.hasPreviousPage;
    }

    # Get all the projects in the project list.
    #
    # + return - Array of Project objects
    public isolated function getAllProjects() returns Project[] {
        return self.nodes;
    }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             End of ProjectList object                                             //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                              Column object                                                        //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a github Column.
# + id - Column identification number
# + name - Column name
public class Column {
    public string id = "";
    public string name = "";
    string columnQuery = "";
    string listOwner = "";
    CardList cards = {};

    # Get a list of cards of a column.
    #
    # + return - Card list object
    public isolated function getCardList() returns CardList {
        return self.cards;
    }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                              End of Column object                                                 //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                              ColumnList object                                                    //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#Represents a list of columns of a project.
public class ColumnList {
    string listOwner = "";
    string columnListQuery = "";
    PageInfo pageInfo = {};
    Column[] nodes = [];

    # Check if column list next page is available.
    #
    # + return - Return true or false
    public isolated function hasNextPage() returns boolean {
        return self.pageInfo.hasNextPage;
    }

    # Check if column list previosu page is available.
    #
    # + return - Return true or false
    public isolated function hasPreviousPage() returns boolean {
        return self.pageInfo.hasPreviousPage;
    }

    # Get all the columns in the column list.
    #
    # + return - Array of column objects
    public isolated function getAllColumns() returns Column[] {
        return self.nodes;
    }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                          End of ColumnList object                                                 //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                   Card object                                                     //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a github card.
# + id - Card identifcation number
# + note - Note in the card
# + state - State of the card (CONTENT_ONLY, NOTE_ONLY, REDACTED)
# + createdAt - Date and time when the object was created
# + updatedAt - Date and time when the object was last updated
# + url - HTTP URL for this card
# + creator - User who created this card
# + column - Project column this card is associated under
# + content - Card content
public type Card record {|
    string id = "";
    string? note = "";
    string state = "";
    string createdAt = "";
    string? updatedAt = "";
    string url = "";
    Creator creator = {};
    json column = {};
    json content = {};
|};
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                               End of Card object                                                  //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                              CardList object                                                      //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a list of cards of a column.
# + columnId - The coloum id
# + cardListQuery - The query of the CardList
# + listOwner - The owner list
# + pageInfo - The page info
# + nodes - The nodes
public type CardList record {|
    string columnId = "";
    string cardListQuery = "";
    string listOwner = "";
    PageInfo pageInfo = {};
    Card[] nodes = [];
|};
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                            End of CardList object                                                 //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                              PullRequest object                                                   //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a github pull request.
# + id - Pull request identification number
# + title - Pull request title
# + createdAt - Date and time when the object was created
# + updatedAt - Date and time when the object was last updated
# + closed - Identifies whether the pull request is closed or not
# + closedAt - Date and time when the object was closed
# + mergedAt - Date and time that the pull request was merged
# + state - State of the pull request (`CLOSED`, `MERGED`, `OPEN`)
# + number - Pull request number
# + url - HTTP URL for this pull request
# + body - Body of the Pull Request in Markdown format
# + changedFiles - Number of changed files in this pull request
# + additions - Number of additions in the pull request
# + deletions - Number of deletions in the pull request
# + resourcePath - HTTP path for the pull request
# + revertResourcePath - HTTP path for reverting the pull request
# + revertUrl - HTTP URL for reverting the pull request
# + headRefName - Name of the head Ref associated with the pull request
# + baseRefName - Name of the base Ref associated with the pull request
# + author - User who created the pull rquest
public type PullRequest record {|
    string id = "";
    string title = "";
    string createdAt = "";
    string? updatedAt = "";
    boolean closed = false;
    string? closedAt = "";
    string? mergedAt = "";
    string state = "";
    int number = 0;
    string url = "";
    string? body = "";
    int changedFiles = 0;
    int additions = 0;
    int deletions = 0;
    string? resourcePath = "";
    string? revertResourcePath = "";
    string? revertUrl = "";
    string? headRefName = "";
    string? baseRefName = "";
    Creator author = {};

|};
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                           End of PullRequest object                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             PullRequestList object                                                //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a list of github pull requests.
public class PullRequestList {
    string pullRequestListQuery = "";
    PageInfo pageInfo = {};
    PullRequest[] nodes = [];

    # Check if pull request list next page is available.
    #
    # + return - Return true or false
    public isolated function hasNextPage() returns boolean {
        return self.pageInfo.hasNextPage;
    }

    # Check if pull request list previous page is avaiable.
    #
    # + return - Return true or false
    public isolated function hasPreviousPage() returns boolean {
        return self.pageInfo.hasPreviousPage;
    }

    # Get all the pull requests in the pull request list.
    #
    # + return - Array of pull request objects
    public isolated function getAllPullRequests() returns PullRequest[] {
        return self.nodes;
    }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                          End of PullRequestList object                                            //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                Branch object                                                       //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a github branch.
# + name - Branch name
public type Branch record {|
    string name = "";
|};
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                              End of Branch object                                                  //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                IssueList object                                                   //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a list of github branches.
public class BranchList {
    string branchListQuery = "";
    PageInfo pageInfo = {};
    Branch[] nodes = [];

    # Check if issue list next page is available.
    #
    # + return - Return true or false
    public isolated function hasNextPage() returns boolean {
        return self.pageInfo.hasNextPage;
    }

    # Check if issue list previous page is avaiable.
    #
    # + return - Return true or false
    public isolated function hasPreviousPage() returns boolean {
        return self.pageInfo.hasPreviousPage;
    }

    # Get all the issues in the issue list.
    #
    # + return - Array of issue objects
    public isolated function getAllBranches() returns Branch[] {
        return self.nodes;
    }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                            End of IssueList object                                                //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                Issue object                                                       //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a github issue.
# + id - Issue identificaion number
# + bodyText - Body of the issue in text format
# + closed - Identifies whether the issue is closed or not
# + closedAt - Date and time when the object was closed
# + createdAt - Date and time when the object was created
# + author - User who created the issue
# + labels - List of labels associated with the issue
# + number - Issue number
# + state - State of the issue (`CLOSED`, `OPEN`)
# + title - Issue title
# + updatedAt - Date and time when the object was updated
# + url - HTTP URL of the issue
# + assignees - List of users assigned to the issue
public type Issue record {|
    string id = "";
    string? bodyText = "";
    string? closed = "";
    string? closedAt = "";
    string createdAt = "";
    Creator author = {};
    Label[] labels = [];
    int number = 0;
    string state = "";
    string title = "";
    string? updatedAt = "";
    string url = "";
    Assignee[] assignees = [];
|};
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                              End of Issue object                                                  //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                IssueList object                                                   //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a list of github issues.
public class IssueList {
    string issueListQuery = "";
    PageInfo pageInfo = {};
    Issue[] nodes = [];

    # Check if issue list next page is available.
    #
    # + return - Return true or false
    public isolated function hasNextPage() returns boolean {
        return self.pageInfo.hasNextPage;
    }

    # Check if issue list previous page is avaiable.
    #
    # + return - Return true or false
    public isolated function hasPreviousPage() returns boolean {
        return self.pageInfo.hasPreviousPage;
    }

    # Get all the issues in the issue list.
    #
    # + return - Array of issue objects
    public isolated function getAllIssues() returns Issue[] {
        return self.nodes;
    }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                            End of IssueList object                                                //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                               Creator object                                                      //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a github Creator.
# + login - Username of the creator
# + resourcePath - HTTP path of the creator
# + url - HTTP URL of the creator
# + avatarUrl - HTTP URL of the public avatar of the creator
public type Creator record {
    string login = "";
    string? resourcePath = "";
    string? url = "";
    string? avatarUrl = "";
    string? resource_path = "";
    string? avatar_url = "";
    int id?;
    string node_id?;
    string html_url?;
    string followers_url?;
    string following_url?;
    string gists_url?;
    string starred_url?;
    string subscriptions_url?;
    string organizations_url?;
    string repos_url?;
    string events_url?;
    string received_events_url?;
    string 'type?;
    boolean site_admin?;
};
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                            End of Creator object                                                  //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                              ProjectOwner object                                                  //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a github project owner.
# + id - Project owner identification number
# + projectsResourcePath - HTTP path listing owner projects
# + projectsUrl - HTTP URL listing owner projects
# + viewerCanCreateProjects - Identifies whether the current viewer can create new projects on the owner
# + __typename - The project owner type name
public type ProjectOwner record {|
    string id = "";
    string projectsResourcePath = "";
    string projectsUrl = "";
    string viewerCanCreateProjects = "";
    string __typename = "";

|};
//*********************************************************************************************************************
// ProjectOwner bound functions
//*********************************************************************************************************************
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                           End of ProjectOwner object                                              //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                            RepositoryOwner object                                                 //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a github repository owner.
# + id - Repository owner identification number
# + login - Username of the repository owner
# + url - HTTP URL of the owner
# + avatarUrl - HTTP URL of the public avatar of the repository owner
# + resourcePath - HTTP path of the repository owner recource
public type RepositoryOwner record {|
    string id = "";
    string login = "";
    string url = "";
    string? avatarUrl = "";
    string? resourcePath = "";
|};
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                          End RepositoryOwner object                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                               Content object                                                      //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a content in a github card.
# + title - Title of the card
# + url - HTTP URL for the content of the card
# + issueState - State of the issue (OPEN, CLOSED)
public type Content record {|
    string? title = "";
    string? url = "";
    string? issueState = "";
|};
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                           End of Content object                                                   //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                Language object                                                    //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a github language.
# + id - Language identification number
# + name - Name of the language
# + color - Color defined for the language
public type Language record {|
    string id = "";
    string? name = "";
    string? color = "";
|};
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             End of Language object                                                //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                PageInfo object                                                    //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a github page information.
# + hasNextPage - Identifies whether there is a next page of results
# + hasPreviousPage - Identifies whether there is a previous page of results
# + startCursor - Start cursor pointing to the begining of the current result set
# + endCursor - End cursor pointing to the end of the current result set
public type PageInfo record {|
    boolean hasNextPage = false;
    boolean hasPreviousPage = false;
    string? startCursor = "";
    string? endCursor = "";
|};
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                            End of PageInfo object                                                 //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                 Label object                                                      //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a github label.
# + id - Label identification number
# + name - Label name
# + description - Description of the label
# + color - Color of the label
public type Label record {|
    string id = "";
    string name = "";
    string? description = "";
    string? color = "";
|};
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             End of Label object                                                   //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                               Assignee object                                                     //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Represents a list of assignees to an issue.
# + id - Assignee identification number
# + login - Username of the user
# + email - Email of the user
# + bio - Bio description of the user
# + url - HTTP URL of the user profile
public type Assignee record {|
    string id = "";
    string login = "";
    string email = "";
    string? bio = "";
    string? url = "";
|};
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                            End of Assignee object                                                 //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                            User object                                                 //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public type User record {|
    int id ;
    string login;
    string url;
    string avatar_url;
    string node_id;
    string gravatar_id;
    string html_url;
    string followers_url;
    string following_url;
    string gists_url;
    string starred_url;
    string subscriptions_url;
    string organizations_url;
    string repos_url;
    string events_url;
    string received_events_url;
    string 'type;
    boolean site_admin;
    string? name;
    string? company;
    string blog;
    string? location;
    string? email;
    boolean? hireable;
    string? bio;
    string? twitter_username;
    int public_repos;
    int public_gists;
    int followers;
    int following;
    string created_at;
    string updated_at;
    int private_gists?;
    int total_private_repos?;
    int owned_private_repos?;
    int disk_usage?;
    int collaborators?;
    boolean two_factor_authentication?;
    Plan plan?;
|};

public type Plan record {|
    string name;
    int space;
    int collaborators;
    int private_repos;
|};
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                          End User object                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

public type JsonArray json[];

public type CreatePullRequest record {
    string title?;
    string head;
    string base;
    string body?;
    boolean maintainer_can_modify?;
    boolean draft?;
    int issue?;
};

public type UpdatePullRequest record {
    string title;
    string body;
    string base;
    string state;
    boolean maintainer_can_modify;
};

public type CreatePullRequestReviewComment record {
    string body;
    string commit_id?;
    string path?;
    int position;
    string side?;
    int line?;
    int start_line?;
    string start_side?;
    int in_reply_to?;

};

public type PullRequestReviewComment record {
    string url?;
    int pull_request_review_id?;
    int id?;
    int position?;
    int original_position?;
    Creator user={};
    string body?;
    string created_at?;
    string updated_at?;
    string html_url?;
    string pull_request_url?;
    // int start_line?;
    // int? original_start_line;
    // string? start_side="";
    int line?;
    int original_line?;
    string side?;
};

public type ReviewComment record {
    string path;
    string body;
    int position?;
    int line?;
    string side?;
    int start_line?;
    string start_side?;
};

public type CreatePullRequestReview record {
    string commit_id?;
    string body;
    string event;
    ReviewComment[] comments?; 
};

public type PullRequestReview record {
    int id=0;
    string node_id="";
    // Creator user={};
    string body="";
    string state="";
    string html_url="";
    string pull_request_url="";
    string submitted_at="";
    string commit_id="";
    string author_association="";
};

public type PullRequestReviewSubmission record {
    int id;
    string node_id;
    User user?;
    string body?;
    string state;
    string html_url;
    string pull_request_url;
    string submitted_at;
    string commit_id;
    string author_association?;
};

public type GistFile record {|
    string fileName;
    string content;
|};

public type CreateGist record {|
    string description?;
    boolean 'public;
    GistFile[] gistFiles;
|};

public type Gist record {
    string url;
    string forks_url;
    string commits_url;
    string id;
    string node_id;
    string git_pull_url;
    string git_push_url;
    string html_url;
    string created_at;
    string updated_at;
    string description?;
    int comments;
    string comments_url;
};

public type OrganizationMembership record {
    string url;
    string state;
    string role;
    string organization_url;
};

public type FoundIssue record {
    string id="";
    string url="";
    string repository_url="";
    string labels_url="";
    string comments_url="";
    string events_url="";
    string html_url="";
    int number=0;
    string state="";
    string title="";
    string body="";
};
