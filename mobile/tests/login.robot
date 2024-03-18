*** Settings ***
Documentation        Suíte de testes de login

Resource             ../resources/Base.resource

Test Setup           Start session
Test Teardown        Finish session

*** Test Cases ***
Deve logar com cpf e IP

    Input Text        xpath=//android.widget.EditText[@resource-id="ipAddress"]    192.168.3.7
    Input Text        xpath=//android.widget.EditText[@resource-id="cpf"]          00000014141

    Click Element     xpath=//android.view.ViewGroup[@resource-id="btnLogin"]

    Wait Until Element Is Visible    
    ...    xpath=//android.widget.TextView[@resource-id="myAccountTitle"]
    ...    10
    
    Element Text Should Be    xpath=//android.widget.TextView[@resource-id="myAccountTitle"]    Sua transformação começa aqui!