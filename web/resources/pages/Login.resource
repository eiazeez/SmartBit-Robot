*** Settings ***
Documentation        Ações e elementos da página de Login

Library              Browser
Variables            ../Env.py

*** Keywords ***
Go to login page

    Go To    ${BASE_URL}/login

Submit login form
    [Arguments]        ${email}        ${pass}

    Fill Text    css=input[id=email]         ${email}
    Fill Text    css=input[type="password"]    ${pass}

    Click        css=button[type="submit"]