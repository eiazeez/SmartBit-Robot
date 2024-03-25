*** Settings ***
Documentation        Suíte de testes da funcionalidade de cadastro de medidas no app Android

Resource             ../resources/Base.resource

Test Setup           Start session
Test Teardown        Finish session

*** Test Cases ***
Deve poder criar minhas medidas

    ${data}        Get Json fixture        update
    Insert Membership        ${data}

    Signin with document    ${data}[account][cpf]
    User is logged in

    Touch my body
    Send weight and height        ${data}[account]

    Popup text should be          Seu cadastro foi atualizado com sucesso

    Set user token
    ${account}    Get account by name        ${data}[account][name]

    Should Be Equal        ${account}[weight]    ${data}[account][weight]
    Should Be Equal        ${account}[height]    ${data}[account][height]
