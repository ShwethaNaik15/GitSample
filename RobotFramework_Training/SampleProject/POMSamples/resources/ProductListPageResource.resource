*** Settings ***
Resource    AppResource.resource
Variables   ../pages/productListPage.py

*** Keywords ***
Verify Successful Login
    sleep    5s
    Get Text    ${homeHeader}    contains    Products

Add Item to Cart
    Click    ${itemOne}
    Click    ${itemTwo}
    sleep    3s

View Cart
    Click    ${cartLink}

Remove Item
    Click    ${removeItemOne}
