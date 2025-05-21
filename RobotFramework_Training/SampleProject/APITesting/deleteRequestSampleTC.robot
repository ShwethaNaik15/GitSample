*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary



*** Variables ***
${base_url}    https://reqres.in/api/users
${url}    https://gorest.co.in/public/v2


*** Test Cases ***
Delete Request
    Create Session    myDelSess    ${base_url}
    &{header}=    Create Dictionary
    Set To Dictionary    ${header}    Cache-control=no-cache
    Set To Dictionary    ${header}    x-api-key=reqres-free-v1
    ${response}    DELETE On Session    myDelSess    /6    headers=${header}

Delete Request with Header
    Create Session    myDelSess    ${url}
    &{header}    Create Dictionary    Authorization=Bearer da1f7e570214c8b4ede62b16aabf019012f6311da8c2c433b8e51a630043afdf
    ${response}    DELETE On Session    myDelSess    /users/7436308    headers=&{header}
