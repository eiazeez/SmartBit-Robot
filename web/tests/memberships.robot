*** Settings ***
Documentation        Suíte de testes de adesões de planos

Resource             ../resources/Base.resource
Resource    ../resources/pages/components/Modal.resource

Test Setup           Start session
Test Teardown        Take Screenshot
Library    Telnet

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

Deve buscar por nome
    [Tags]    search

    ${data}    Get Json fixture    memberships    search

    Insert Membership    ${data}

    SignIn Admin
    Go to Memberships

    Search by name            ${data}[account][name]
    Should filter by name     ${data}[account][name]

Deve excluir uma matrícula
    [Tags]    remove

    ${data}    Get Json fixture    memberships    remove

    Insert Membership    ${data}

    SignIn Admin
    Go to Memberships

    Request removal    ${data}[account][name]
    Confirm removal

    Toast should be    Matrícula removida com sucesso.
    
    Membership should not be visible    ${data}[account][name]