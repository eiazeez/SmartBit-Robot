*** Settings ***
Documentation    Cenários de testes de pré-cadastro de clientes

Library         Browser

Resource        ../resources/base.resource

*** Test Cases ***
Deve iniciar o cadastro do cliente

    ${account}    Get Fake Account

    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000/ 

    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name        ${account}[name]
    Fill Text    id=email       ${account}[email]
    Fill Text    id=cpf         ${account}[cpf]

    Click    css=button >> text=Cadastrar

    Wait For Elements State
    ...    text=Falta pouco para fazer parte da família Smartbit!
    ...    visible    5

Campo nome deve ser obrigatório
    [Tags]    required

    ${account}    Get Fake Account

    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000/ 

    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Click    css=button >> text=Cadastrar

    Wait For Elements State
    ...    css=#signup .notice
    ...    visible    5
    
    Get Text    
    ...    css=#signup .notice  
    ...    equal    Por favor informe o seu nome completo

Campo email deve ser obrigatório
    [Tags]    required

    ${account}    Get Fake Account

    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000/ 

    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text    id=name        Isaac Douglas
    Fill Text    id=cpf    60521415063

    Click    css=button >> text=Cadastrar

    Wait For Elements State
    ...    css=#signup .notice
    ...    visible    5
    
    Get Text    
    ...    css=#signup .notice  
    ...    equal    Por favor, informe o seu melhor e-mail

Campo cpf deve ser obrigatório
    [Tags]    required

    ${account}    Get Fake Account

    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000/ 

    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text    id=name        Isaac Douglas
    Fill Text    id=email       mail@mail.com

    Click    css=button >> text=Cadastrar

    Wait For Elements State
    ...    css=#signup .notice
    ...    visible    5
    
    Get Text    
    ...    css=#signup .notice  
    ...    equal    Por favor, informe o seu CPF

Email no formato inválido
    [Tags]    inv

    ${account}    Get Fake Account

    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000/ 

    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text    id=name        Isaac Douglas
    Fill Text    id=email       mail2mail.com
    Fill Text    id=cpf    60521415063

    Click    css=button >> text=Cadastrar

    Wait For Elements State
    ...    css=#signup .notice
    ...    visible    5
    
    Get Text    
    ...    css=#signup .notice  
    ...    equal    Oops! O email informado é inválido

Cpf no formato inválido
    [Tags]    inv

    ${account}    Get Fake Account

    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000/ 

    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text    id=name        Isaac Douglas
    Fill Text    id=email       mail@mail.com
    Fill Text    id=cpf    12345678912

    Click    css=button >> text=Cadastrar

    Wait For Elements State
    ...    css=#signup .notice
    ...    visible    5
    
    Get Text    
    ...    css=#signup .notice  
    ...    equal    Oops! O CPF informado é inválido



