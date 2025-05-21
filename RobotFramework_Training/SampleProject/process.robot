*** Settings ***
Library    Process

*** Test Cases ***
Run Python Script And Validate Output
    ${result}=    Run Process    python    hello.py
    Sleep    10s
    Should Be Equal As Integers    ${result.rc}    0
    Log To Console    ${result.stdout}
    Should Be Equal As Strings    ${result.stdout}    Hello Welcome
