*** Settings ***
Documentation        Suíte de testes de adesões de planos

Resource             ../resources/Base.resource

Test Setup           Start session
Test Teardown        Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova adesão
 
   ${data}    Get Json fixture    memberships    create

    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account]
    
    SignIn Admin

    Go to Memberships
    Create new membership    ${data}

    Toast should be    Matrícula cadastrada com sucesso.

Não deve realizar adesão duplicada

    [Tags]        Dup

    ${data}    Get Json fixture    memberships    duplicate

    Insert Membership        ${data}
    SignIn Admin

    Go to Memberships
    Create new membership    ${data}
    
    Toast should be    O usuário já possui matrícula.

    