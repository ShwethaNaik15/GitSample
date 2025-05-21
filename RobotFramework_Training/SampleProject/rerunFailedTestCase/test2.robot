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
Login To The Internet HerokuApp
    New Browser    ${browser}    headless=False
    New Context    viewport={'width': 1620, 'height': 1080}    ignoreHTTPSErrors=True
    New Page       https://the-internet.herokuapp.com/login

    Type Text      \#username    ${username}
    Type Text      \#password    ${password}
    Click          \#login >> .radius

    ${pageTitle}=  Get Title
    Should Be Equal    ${pageTitle}    The Internet
    ${pageTitle}=  Get Title    ==    The Internet
    Log To Console     ${pageTitle}

    ${currentUrl}=     Get Url
    Should Contain     ${currentUrl}    secure
    ${currentUrl}=     Get Url    *=    secure
    Log To Console     ${currentUrl}
