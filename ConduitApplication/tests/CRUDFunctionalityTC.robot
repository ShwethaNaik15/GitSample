*** Settings ***
Library           Browser
Resource          ../resources/LoginPage.robot
Resource          ../resources/ArticlePage.robot

*** Variables ***
${ArticleTitle1}    RF Test Article 1
${ArticleTitle2}    RF Test Article 2
${ArticleTitle3}    RF Test Article 3
${UpdatedContent}    RF content is updated

*** Test Cases ***
Login into App
    Login to conduit application

View Article
    Launch browser with state    ${stateFile}
    View newly created article    ${ArticleTitle1}
    View newly created article    ${ArticleTitle2}
    View newly created article    ${ArticleTitle3}

Update an Article
    Launch browser with state    ${stateFile}
    Update an article    ${ArticleTitle1}    ${UpdatedContent}

Delete an Article
    Launch browser with state    ${stateFile}
    Delete an article    ${ArticleTitle2}
