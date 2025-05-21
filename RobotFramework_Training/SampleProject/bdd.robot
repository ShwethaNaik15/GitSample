*** Settings ***
Library    Browser

*** Variables ***
${browser}    chromium

*** Test Cases ***
Valid Login
    Given browser is opened to login page
    When user "tomsmith" logs in with password "SuperSecretPassword!"
    Then should display success message

*** Keywords ***
Browser is opened to login page
    Open Browser    https://the-internet.herokuapp.com/login    ${browser}

User "${username}" logs in with password "${password}"
    Type Text    \#username    ${username}
    Type Text    \#password    ${password}
    Click        button.radius

Should display success message
    ${flashMessage}    Get Text    \#flash
    Get Text    \#flash    *=    You logged into a secure area!
