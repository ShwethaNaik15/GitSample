*** Settings ***
Library           JSONLibrary
Library           RequestsLibrary
Library           Collections

*** Variables ***
${base_url}       https://jsonplaceholder.typicode.com
${url}            https://gorest.co.in/public-api

*** Test Cases ***
Post_Request
    Create Session       myPostSess    ${base_url}    verify=true

    &{body}=             Create Dictionary    title=foo    body=bar    userId=9000
    Log                  ${body}

    &{header}=           Create Dictionary    Cache-Control=no-cache

    ${response}=         Post On Session       myPostSess    /posts    data=${body}    headers=${header}
    Log                  ${response.status_code}
    Log                  ${response.content}

    ${status_code}=      Convert To String      ${response.status_code}
    Should Be Equal      ${status_code}         201

    # Check `id` from Response Body
    ${id}=               Get Value From Json    ${response.json()}    id
    ${idFromList}=       Get From List          ${id}                0
    ${idFromListAsString}=   Convert To String  ${idFromList}
    Should Be Equal As Strings    ${idFromListAsString}    101

Post_RequestWithBearerToken
    Create Session       myPostSess    ${url}    verify=true

    &{body}=             Create Dictionary    name=TestAutomation123    gender=female    email=x1y1z1@example.com
    Log                  ${body}

    &{header}=           Create Dictionary    authorization=Bearer b8c872237c14c3cd079cbcecf302025

    ${response}=         Post On Session      myPostSess      /users    data=${body}    headers=${header}
    Log                  ${response.status_code}
    Log                  ${response.content}

    ${getHeaderValue}=   Get From Dictionary   ${response.headers}    Content-Type
    Should Be Equal      ${getHeaderValue}     application/json; charset=utf-8
