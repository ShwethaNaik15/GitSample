
*** Settings ***
# Library    Browser    auto_closing_level=KEEP
Library    Browser
Library    Collections
*** Variables ***
${browser}      chromium


*** Test Cases ***
Handling multiple frames
    Open Browser    https://the-internet.herokuapp.com/iframe    ${browser}
    ${label}    Get Text    div > h3
    Log    The text is : ${label}

    ${txtfromFrame}    Get Text    iframe#mce_0_ifr >>> id=tinymce
    Log    ${txtfromFrame}

    ${txtfromFrame}    Get Text    span.tox-statusbar__branding
    Log    ${txtfromFrame}
