*** Settings ***
Documentation        Suíte de testes de adesões de planos

Resource             ../resources/Base.resource

Test Setup           Start session
Test Teardown        Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova adesão
    
     ${email}    Set Variable    sac@smartbit.com

    Go to login page
    Submit login form    ${email}  pwd123
    User is logged in    ${email}

    Go to Enrolls
    Go to Enroll form

    Select account       Azeez Test    07427057066
    Select plan          Plano Black
    
*** Keywords ***
Go to Enrolls

    Click                css=a[href="/memberships"]
    
    Wait For Elements State    
    ...    css=h1 >> text=Matrículas
    ...    visible    5
    
Go to Enroll form

    Click                css=a[href="/memberships/new"]

    Wait For Elements State    
    ...    css=h1 >> text=Nova matrícula
    ...    visible    5
    
Select account
    [Arguments]        ${name}        ${cpf}

    Fill Text            css=input[aria-label=select_account]    ${name}
    Click                css=[data-testid="${cpf}"]

Select plan
    [Arguments]        ${plan}

    Fill Text            css=input[aria-label="select_plan"]    ${plan}
    Click                css=div[id*=option] >> text=${plan}