*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${base_url}    https://reqres.in/api/users

*** Test Cases ***
Put Request
    Create Session    myPutSess    ${base_url}
    &{body}    Create Dictionary    first_name=Janet    last_name=Thomas    email=janet.weaver@gmail.com
    Log    ${body}
    &{header}    Create Dictionary
    Set To Dictionary    ${header}    Cache-control=no-cache
    Set To Dictionary    ${header}    x-api-key=reqres-free-v1
    ${response}    PUT On Session    myPutSess    /7    data=${body}    headers=${header}
    Log    ${response.status_code}
    Log    ${response.content}

    ${reqBody}=    Convert To String    ${response.content}
    Should Contain    ${reqBody}    Thomas


    ${getHeaderValue}=    Get from Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${getHeaderValue}    application/json; charset=utf-8
