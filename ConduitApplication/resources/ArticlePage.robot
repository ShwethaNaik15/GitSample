*** Settings ***
Library    Browser

*** Keywords ***
View newly created article
    [Documentation]    Opens an article and verifies its title is displayed
    [Arguments]    ${ArticleTitle}
    Open Article From Global Feed    ${ArticleTitle}
    Get Text    ${ArticlePage}    contains    ${ArticleTitle}

Update an article
    [Documentation]    Updates article content and verifies the changes are saved
    [Arguments]    ${ArticleTitle}    ${UpdatedContent}
    Open Article From Global Feed    ${ArticleTitle}
    Click    ${EditArticleButton}
    Sleep    5
    Fill Text      ${ArticalContentTextArea}      ${UpdatedContent}
    Click    ${SubmitArticle}
    Get Text    ${ArticlePage}    contains    ${UpdatedContent}

Delete an article
    [Documentation]    Deletes an article and confirms it no longer appears
    [Arguments]    ${ArticleTitle}
    Open Article From Global Feed    ${ArticleTitle}
    Sleep    5
    Click    ${DeleteArticleButton}
    ${text}=    Get Text    ${ArticlePage}
    Should Not Contain    ${text}    ${ArticleTitle}

Open article from Global Feed
    [Documentation]    Navigates to Global Feed and opens the specified article
    [Arguments]    ${ArticleTitle}
    Click    ${HomeLink}
    Click    ${GlobalFeedLink}
    ${ArticleName}=    Set Variable    //a[@class='preview-link']/h1[normalize-space(.)="${ArticleTitle}"]
    Click    xpath=${ArticleName}
