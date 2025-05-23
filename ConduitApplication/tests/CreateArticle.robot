*** Settings ***
Library           Browser
Resource          ../resources/LoginPage.robot
Resource          ../resources/ArticlePage.robot
Library           DataDriver    file=../resources/data/CreateArticle.csv

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
    Login to conduit application
    Launch browser with state    ${stateFile}
    Click          ${NewArticleLink}
    Fill Text      ${ArticleTitleInputField}     ${title}
    Fill Text      ${DescriptionInputField}      ${description}
    Fill Text      ${ArticalContentTextArea}     ${content}
    Fill Text      ${TagsInputField}             ${tags}
    Click    ${SubmitArticle}
    Get Text    ${ArticlePage}    contains    ${title}
