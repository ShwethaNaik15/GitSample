*** Settings ***
Library           Browser
Resource          ../resources/LoginPage.robot
Resource          ../resources/ArticlePage.robot
Library           DataDriver

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
    Log    Title: ${title}
    Login to conduit application
    Click          ${NewArticleLink}
    Fill Text      ${ArticleTitleInputField}     ${title}
    Fill Text      ${DescriptionInputField}      ${description}
    Fill Text      ${ArticalContentTextArea}     ${content}
    Fill Text      ${TagsInputField}             ${tags}
    Click    ${SubmitArticle}
    Get Text    ${ArticlePage}    contains    ${title}
