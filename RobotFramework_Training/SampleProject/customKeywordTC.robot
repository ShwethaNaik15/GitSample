*** Settings ***
# Library    Browser    auto_closing_level=KEEP
Library    Browser
Library    Collections
# Suite Setup    Open Browser    ${url}    ${browser}

*** Variables ***
${browser}      chromium
${username}     tomsmith
${password}     SuperSecretPassword!
${url}    https://testautomationpractice.blogspot.com/

*** Test Cases ***
Sample Test case

    ${sum}=    Add    2    4
    Should Be Equal As Integers    6    ${sum}
    ${changedName}    change nick name    TestUser    RobotTestUser

*** Keywords ***
Add
    [Arguments]    ${value1}    ${value2}
    ${sum}=    Evaluate    ${value1} + ${value2}
    RETURN    ${sum}

change nick name
    [Arguments]    ${oldName}    ${newName}
    Log To Console    ${newName}
    RETURN    ${newName}
