*** Settings ***
Documentation    Cenários de testes de pré-cadastro de clientes

Resource        ../resources/Base.resource
Resource    ../resources/pages/Welcome.resource

Test Setup            Start session
Test Teardown         Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro do cliente
    [Tags]    smoke

    ${account}    Create Dictionary
    ...           name=Azeez Testes
    ...           email=azeez@mail.com
    ...           cpf=06097411871

    Delete Account By Email    ${account}[email]

    Submit signup form    ${account}
    Verify welcome message


Tentativa de pré-cadastro
    [Template]    Attempt signup

    ${EMPTY}        azeez@mail.com        60521415063        Por favor informe o seu nome completo
    Azeez Tests     ${EMPTY}              60521415063        Por favor, informe o seu melhor e-mail
    Azeez Tests     azeez@mail.com        ${EMPTY}           Por favor, informe o seu CPF
    Azeez Tests     mail2mail.com         60521415063        Oops! O email informado é inválido
    Azeez Tests     mail@mail.com         12345678912        Oops! O CPF informado é inválido

*** Keywords ***

Attempt signup    
    [Arguments]        ${name}    ${email}    ${cpf}    ${output_message}

    ${account}    Create Dictionary
    ...            name=${name}
    ...            email=${email}
    ...            cpf=${cpf}

    Submit signup form    ${account}
    Notice should be    ${output_message}