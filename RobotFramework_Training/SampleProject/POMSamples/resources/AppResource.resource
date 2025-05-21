*** Settings ***
Library           Browser

*** Variables ***
${baseUrl}        https://www.saucedemo.com/
${browser}        chromium

*** Keywords ***
LaunchApp
    Open Browser    ${baseUrl}    ${browser}

CloseApp
    Close Browser
