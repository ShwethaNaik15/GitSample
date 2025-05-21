*** Settings ***
Library    Browser

*** Variables ***
${BROWSER}         chromium
${VALID USER}      tomsmith
${VALID PASSWORD}  SuperSecretPassword!
${LOGIN URL}       https://the-internet.herokuapp.com/login
${LOGIN BUTTON}    //button[@class='radius']
${errMsg}          invalid!

*** Keywords ***
Open Browser To Login Page
    Set Browser Timeout    15s
    Open Browser    ${LOGIN URL}    ${BROWSER}

Go To Login Page
    Go To    ${LOGIN URL}

Input Username
    [Arguments]    ${username}
    Type Text    \#username    ${username}

Input Pwd
    [Arguments]    ${password}
    Type Text    \#password    ${password}

Submit Credentials
    Click    ${LOGIN BUTTON}

Login Should Have Failed
    [Arguments]    ${errMsg}
    Get Text    \#flash    *=    ${errMsg}
