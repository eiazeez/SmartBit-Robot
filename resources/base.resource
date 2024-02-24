*** Settings ***
Documentation            Arquivo principal do projeto Robot

Library                  libs/Account.py
Library                  Browser
Library                  libs/database.py

Resource        pages/Landing.resource
Resource        pages/Welcome.resource
Resource        pages/Login.resource
Resource        pages/Accounts.resource

Resource        pages/components/Toast.resource
Resource        pages/components/BoxNotice.resource

*** Keywords ***
Start session
    New Browser    browser=chromium    headless=false
    New Page    http://localhost:3000/ 
