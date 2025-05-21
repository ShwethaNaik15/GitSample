*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${base_url}       https://demoqa.com/utilities/weather/city
${city}           chennai

*** Test Cases ***
*** Keywords ***
Get Weather Response
    Create Session         myGetSess        ${base_url}
    ${response}=           Get On Session   myGetSess    /${city}
    RETURN               ${response}


*** Test Cases ***
Validate Status and Content
    ${response}=    Get Weather Response
    Status Should Be               200                    ${response}
    Should Be Equal As Strings     ${response.reason}     OK
    ${reqBody}=                    Convert To String      ${response.content}
    Should Contain                 ${reqBody}             chennai

Validate Content Header
    ${response}=    Get Weather Response
    Log To Console                 ${response.headers}[Content-Type]
    Dictionary Should Contain Key  ${response.headers}     Content-Type
