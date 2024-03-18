*** Settings ***
Documentation        Ações e elementos da página de Login

Library              Browser

*** Keywords ***
Go to login page

    Go To    http://localhost:3000/login

Submit login form
    [Arguments]        ${email}        ${pass}

    Fill Text    css=input[class=email]         ${email}
    Fill Text    css=input[type="password"]    ${pass}

    Click        css=button[type="submit"]