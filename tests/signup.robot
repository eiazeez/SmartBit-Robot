*** Settings ***
Documentation    Cenários de testes de pré-cadastro de clientes

Library         Browser

Resource        ../resources/base.resource

*** Test Cases ***
Deve iniciar o cadastro do cliente

    ${account}    Get Fake Account

    Start session
    Submit signup form    ${account}

    Wait For Elements State
    ...    text=Falta pouco para fazer parte da família Smartbit!
    ...    visible    5

Campo nome deve ser obrigatório
    [Tags]    required

    ${account}    Create Dictionary
    ...            name=${EMPTY}
    ...            email=azeez@azcode.com
    ...            cpf=72885892005

    Start session
    Submit signup form    ${account}
    Notice should be   Por favor informe o seu nome completo

Campo email deve ser obrigatório
    [Tags]    required

   ${account}    Create Dictionary
    ...            name=Azeez
    ...            email=${EMPTY}
    ...            cpf=72885892005

    Start session
    Submit signup form    ${account}
    Notice should be    Por favor, informe o seu melhor e-mail

Campo cpf deve ser obrigatório
    [Tags]    required

    ${account}    Create Dictionary
    ...            name=Azeez
    ...            email=azeez@azcode.com
    ...            cpf=${EMPTY}

    Start session
    Submit signup form    ${account}
    Notice should be    Por favor, informe o seu CPF

Email no formato inválido
    [Tags]    inv

    ${account}    Create Dictionary
    ...            name=Isaac Douglas
    ...            email=mail2mail.com
    ...            cpf=60521415063

    Start session
    Submit signup form    ${account}
    Notice should be    Oops! O email informado é inválido

Cpf no formato inválido
    [Tags]    inv

    ${account}    Create Dictionary
    ...            name=Isaac Douglas
    ...            email=mail@mail.com
    ...            cpf=12345678912

    Start session
    Submit signup form    ${account}
    Notice should be    Oops! O CPF informado é inválido

*** Keywords ***
Start session

    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000/ 

Submit signup form
    [Arguments]    ${account}
    
    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name        ${account}[name]
    Fill Text    id=email       ${account}[email]
    Fill Text    id=cpf         ${account}[cpf]

    Click    css=button >> text=Cadastrar

Notice should be
    [Arguments]    ${target}

    ${element}    Set Variable    css=#signup .notice   

    Wait For Elements State
    ...    ${element}
    ...    visible    5

    Get Text    
    ...    ${element}
    ...    equal    ${target}
    