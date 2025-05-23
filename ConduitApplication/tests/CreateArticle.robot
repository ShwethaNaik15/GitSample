*** Settings ***
Library           Browser
Resource          ../resources/LoginPage.resource
Resource          ../resources/ArticlePage.resource
Library           DataDriver    file=../resources/data/CreateArticle.csv
Suite Setup    Login to conduit application
Test Template     Create an Article

*** Variables ***
${title}        ${EMPTY}
${description}        ${EMPTY}
${content}        ${EMPTY}
${tags}        ${EMPTY}

*** Test Cases ***
Create new Article    ${title}    ${description}    ${content}    ${tags}

*** Keywords ***
Create an Article
    [Arguments]    ${title}    ${description}    ${content}    ${tags}
    Launch browser with state    ${stateFile}
    Navigate to new article page
    Enter article details    ${title}    ${description}    ${content}    ${tags}
    Sumbit an article
    Verify an article with title    ${title}
