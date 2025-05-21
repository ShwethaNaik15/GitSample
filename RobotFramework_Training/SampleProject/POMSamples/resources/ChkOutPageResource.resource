*** Settings ***
Resource    AppResource.resource
Variables    ../pages/checkoutPage.py

*** Variables ***
${firstNameValue}    Test
${lastNameValue}    User
${postalCodeValue}    12345
${successMessage}    Thank you for your order!

*** Keywords ***
Provide User Details
    Type Text    ${firstName}    ${firstNameValue}
    Type Text    ${lastName}    ${lastNameValue}
    Type Text    ${postalCode}    ${postalCodeValue}
    Click    ${continueButton}
    Sleep    35s

Confirm Order
    Click    ${finishButton}

Verfiy Order Summary
    Get Text    ${checkoutComplete}    ==    ${successMessage}
