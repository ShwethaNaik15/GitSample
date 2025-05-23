*** Settings ***
Library    Browser
Variables       ../locators.py

*** Variables ***
${URL}    https://conduit-realworld-example-app.fly.dev/#/
${Email}    rftestuser@gmail.com
${UserName}    rftestuser
${Password}    rftestuser

*** Keywords ***
Login to conduit application
    [Documentation]    Launches browser, logs into Conduit app, saves session state for reuse
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1420, 'height': 1080}
    New Page    ${URL}
    Click    ${LoginLink}
    Fill Text    ${EmailInputField}    ${Email}
    Fill Text    ${PasswordInputField}    ${Password}
    Click        ${LoginButton}
    Get Text    ${UserProfile}    contains    ${UserName}
    ${stateFile}=    Save Storage State
    Close Context
    Set Suite Variable    ${stateFile}    ${stateFile}

Launch browser with state
    [Documentation]    Launches browser with previously saved storage state to continue session
    [Arguments]    ${stateFile}
    New Browser    chromium    headless=false
    ${context}=    Create Dictionary    storageState=${stateFile}
    New Context    &{context}
    New Page    ${URL}
