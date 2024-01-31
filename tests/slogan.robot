*** Settings ***

Library    Browser
Documentation    Teste para verificar o Slogan da Smartbit

*** Test Cases ***

Deve exibir o Slogan na Landing Page
    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000/ 
    Get Text    css=.headline h2    equal    Sua Jornada Fitness Começa aqui!

    Sleep    5