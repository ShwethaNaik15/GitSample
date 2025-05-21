*** Settings ***
Resource        AppResource.resource
Variables       ../pages/loginPage.py

*** Variables ***
${username}     standard_user
${pwd}          secret_sauce

*** Keywords ***
Enter Username
    Type Text    ${Loginid}    ${username}

Enter Password
    Type Text    ${loginpwd}    ${pwd}

Click LoginBtn
    Click    ${loginBtn}
