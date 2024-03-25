*** Settings ***
Documentation        Arquivo principal do projeto de testes automatizados para Mobile

Library             AppiumLibrary
Library             JSONLibrary

Library             ../../libs/Database.py

Resource            ./screens/login.resource
Resource            ./screens/account.resource
Resource            ./components/menu.resource
Resource            ./screens/mybody.resource
Resource            ./components/popup.resource
Resource            ../../services/Service.resource

*** Keywords ***
Start session

    Open Application        http://localhost:4723
    ...                     platformName=Android
    ...                     automationName=UIAutomator2
    ...                     deviceName=Emulator
    ...                     udid=emulator-5554
    ...                     app=${EXECDIR}/app/smartbit-beta.apk
    ...                     autoGrantPermissions=true

    Wait Until Page Contains        IP da API        30

Finish session

    Capture Page Screenshot
    Close Application

Get Json fixture
    [Arguments]        ${scenario}

    ${data}    Load Json From File    
    ...    ${EXECDIR}/resources/fixtures/data.json
    ...    encoding=utf-8
    
    [RETURN]          ${data}[${scenario}]