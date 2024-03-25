*** Settings ***
Documentation        Ações e elementos do componente Popup

Library              AppiumLibrary


*** Keywords ***
Popup text should be
   [Arguments]   ${text}   
    
   ${element}    Set Variable    xpath=//android.widget.TextView[@resource-id="android:id/message"]

    Wait Until Element Is Visible     ${element}    5
    Element Text Should Be            ${element}    ${text}