*** Settings ***
Library    Browser

*** Variables ***
${BROWSER}    chromium

*** Test Cases ***
Using PageLoad Timeout
    New Browser    ${BROWSER}    headless=false
    New Page    http://uitestingplayground.com/

    # Since page timeout is 10s, the below click will fail
    # Set Browser Timeout    5s
    # Without setting the Browser timeout, the below click will wait for default timeout

    Click    "Load Delay"
    Wait For Load State    load


    Click    "Button Appearing After Delay"
    Sleep    2s
    Log To Console    Page loaded successfully

    # This will pass if the page is loaded
    Get Url    contains    loaddelay
