*** Settings ***

Library    Browser


*** Test Cases ***
Geolocation Test
    New Browser    chromium    headless=false
    ${permissions}=    Create List    geolocation
    New Context    permissions=${permissions}
    Set Geolocation    33.748997    -84.387985    100

    New Page    https://oldnavy.gap.com/stores
    Sleep    3s

    ${storeList}=    Get Elements    //div[contains(text(), 'Atlanta')]
    Log    ${storeList}

    ${storeCount}=    Get Length    ${storeList}
    Log    ${storeCount}
    Should Be True    ${storeCount} > 0
