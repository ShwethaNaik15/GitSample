*** Settings ***
Library    AxeLibrary
Library    SeleniumLibrary

*** Test Cases ***
Google Accessibility Test
    Open Browser    https://robotframework.org/    chrome

    # Execute accessibility tests
    ${results.violations}=    Run Accessibility Tests    result_file.json
    Log To Console    Violations Count: ${results.violations}

    # Log violation result to log.html
    Log Readable Accessibility Result    violations

    # To get violations on log in JSON format
    Get Json Accessibility Result

    # Close Browser
