*** Settings ***
Documentation        Suíte de testes de login

Resource             ../resources/Base.resource

Test Setup           Start session
Test Teardown        Finish session

*** Test Cases ***
Deve logar com IP e CPF

    ${data}        Get Json fixture    login
    Insert Membership        ${data}

    Signin with document     ${data}[account][cpf]
    User is logged in

Não deve logar com CPF não cadastrado

    Signin with document    46104756000
    Popup text should be    Acesso não autorizado! Entre em contato com a central de atendimento

Não deve logar com CPF inválido

    Signin with document    4610475600
    Popup text should be    CPF inválido, tente novamente