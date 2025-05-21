*** Settings ***
# Library    Browser    auto_closing_level=KEEP
Library    Browser
Library    Collections
# Suite Setup    Open Browser    ${url}    ${browser}

*** Variables ***
${browser}      chromium
${username}     tomsmith
${password}     SuperSecretPassword!
${url}    https://testautomationpractice.blogspot.com/

*** Test Cases ***
Login To The Internet HerokuApp
    New Browser    ${browser}    headless=False
    New Context    viewport={'width': 1620, 'height': 1080}    ignoreHTTPSErrors=True
    New Page       https://the-internet.herokuapp.com/login

    Type Text      \#username    ${username}
    Type Text      \#password    ${password}
    Click          \#login >> .radius

    ${pageTitle}=  Get Title
    Should Be Equal    ${pageTitle}    The Internet
    ${pageTitle}=  Get Title    ==    The Internet
    Log To Console     ${pageTitle}

    ${currentUrl}=     Get Url
    Should Contain     ${currentUrl}    secure
    ${currentUrl}=     Get Url    *=    secure
    Log To Console     ${currentUrl}

Finding elements by inmplict selector
    Open Browser    https://www.saucedemo.com/
    Type Text    \#user-name    standard_user
    Type Text    //input[@name="password"]    secret_sauce
    Click    "Login"

Finding elements by explict selector
    Open Browser    https://www.saucedemo.com/
    Type Text    css=#user-name    standard_user
    Type Text    xpath=//input[@name="password"]    secret_sauce
    Click    text="Login"
    @{items}    Get Elements    .inventory_item_name
    ${first_item}    Get From List    ${items}    0
    ${item_text}    Get Text    ${first_item}    ==    Sauce Labs Backpack
    Log    ${item_text}

Finding elements by explict selector with RegEx
    Open Browser    https://testautomationpractice.blogspot.com/    chromium
    Click    text=/^Playwright.*$/i
    ${pageheading}    Get Element    //div[@class='post-outer']/div[1] >> .post-title.entry-title
    Get Text    ${pageheading}    ==    PlaywrightPractice

Handle Radio buttons

        Open Browser    ${url}    ${browser}
        Check Checkbox    \#male
        ${gender}=    Get Text    \#male
        Run Keyword If    '${gender}' == 'male'
        ...    Log    Selected gender is ${gender}


Handle Checbox
        Open Browser    ${url}    ${browser}
        Scroll To Element    \#sunday
        Check Checkbox    \#sunday
        Check Checkbox    \#monday
        Check Checkbox    \#tuesday
        Get Checkbox State    \#sunday    ==    True
        Uncheck Checkbox    \#sunday
        Sleep    5s

Handling alert
    Open Browser    https://testautomationpractice.blogspot.com/    ${browser}

    ${promise}=    Promise To    Wait For Alert    action=accept    text=I am an alert box!
    Click    \#alertBtn
    ${text}=    Wait For    ${promise}

    ${promise}=    Promise To    Wait For Alert    action=dismiss    text=Press a button!
    Click    \#confirmBtn
    ${text}=    Wait For    ${promise}

    ${promise}=    Promise To    Wait For Alert    action=accept    prompt_input=Hello
    Click    \#promptBtn
    ${text}=    Wait For    ${promise}

Handling multiple frames
    Open Browser    https://the-internet.herokuapp.com/iframe    ${browser}
    ${label}    Get Text    div > h3
    Log    The text is : ${label}

    ${txtfromFrame}    Get Text    iframe#mce_0_ifr >>> id=tinymce
    Log    ${txtfromFrame}

    ${txtfromFrame}    Get Text    span.tox-statusbar__branding
    Log    ${txtfromFrame}

Handle tabbed window
    Open Browser    https://the-internet.herokuapp.com/windows    ${browser}
    Sleep    10
    @{parentPageId}    Get Page Ids    ACTIVE
    Click    text=/^Click Here/
    ${childWindowHandle}=    Switch Page    NEW
    Sleep    5s
    Get Title    ==    New Window
    Close Page
    @{pageId}    Get Page Ids    CURRENT
    Get Title    ==    The Internet
     Log    ${pageId}
    Sleep    5s

Take And Embed Screenshot
     Open Browser    https://the-internet.herokuapp.com/windows    ${browser}
     Take Screenshot    fullPage=False    filename=test    fileType=jpeg    quality=80
     Take Screenshot    EMBED
