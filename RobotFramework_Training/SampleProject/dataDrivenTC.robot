*** Settings ***
Library    Browser
Library           DataDriver
Library           DataDriver    file=loginData.xlsx    sheet_name=loginPage
Resource          resource.robot
Suite Setup       Open Browser To Login Page
Test Template     Invalid Login

*** Variables ***
${username}        ${EMPTY}
${password}        ${EMPTY}

*** Test Cases ***
Login with user ${username} and password ${password}    Default    UserData

*** Keywords ***
Invalid Login
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Pwd    ${password}
    Submit Credentials
    Login Should Have Failed    ${errMsg}
