*** Settings ***
Documentation        Cenários de testes do Login SAC

Resource             ../resources/Base.resource

Test Setup           Start session
Test Teardown        Take Screenshot

*** Test Cases ***

Deve logar como gestor de academia

    ${email}    Set Variable    sac@smartbit.com

    Go to login page
    Submit login form    ${email}  pwd123
    User is logged in    ${email}

Não deve logar com senha incorreta
    [Tags]    inv_pass

    Go to login page
    Submit login form    sac@smartbit.com    SenhaIncorreta
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!  

Não deve logar com email não cadastrado
    [Tags]    404email

    Go to login page
    Submit login form    404@smartbit.com    SenhaIncorreta
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!  

Tentativa de login com dados incorretos
    [Template]    Login with verify notice
    ${EMPTY}            ${EMPTY}    Os campos email e senha são obrigatórios.
    ${EMPTY}            pwd123      Os campos email e senha são obrigatórios.
    sac@smartbit.com    ${EMPTY}    Os campos email e senha são obrigatórios.
    www.teste.com.br    pwd123      Oops! O email informado é inválido
    emailRuim%mail.com  pwd123      Oops! O email informado é inválido

*** Keywords ***
Login with verify notice
    [Arguments]        ${email}        ${pass}        ${output_message}
    
    Go to login page
    Submit login form    ${email}     ${pass}
    Notice should be     ${output_message}
