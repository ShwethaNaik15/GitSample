*** Settings ***
Library    Browser

*** Variables ***
${username}         rftestuser1@gamail.com
${password}         rftestuser1
${state_file}       storage/state.json

*** Test Cases ***
Login Test Case
    New Context    viewport={'width': 1420, 'height': 1080}
    New Browser    chromium    headless=false
    New Page    https://conduit-realworld-example-app.fly.dev/
    Click    ul.nav.navbar-nav.pull-xs-right > li:nth-child(2)

    # Perform login
    Type Text    input[name='email']       ${username}
    Type Text    input[name='password']    ${password}
    Click        button.btn.btn-lg.btn-primary.pull-xs-right
    Get Text     div h6    *=    Popular Tags

    # Save storage to disk
    ${state_file}=    Save Storage State
    Close Context

    # Create new context with saved state
    New Context    storageState=${state_file}

    # Create new context with saved state
    New Context    storageState=${state_file}
    New Page    https://conduit-realworld-example-app.fly.dev/

    # Login is not needed because authentication is read from state file
    Get Text    div h6    *=    Popular Tags
    Sleep    5s
