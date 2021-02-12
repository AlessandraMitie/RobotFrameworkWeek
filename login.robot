*** Settings ***
Documentation           Testes da página login

Library                 Browser

Resource                resources/login_actions.robot

#Gancho para tirar screenshot após a execução de cada teste
#Test Teardown           Take Screenshot

*** Test Cases ***
Login com sucesso
    Open Login Page
    Login With                  papito@parodify.com         pwd123
    Wait For Elements State     css=a[href$=sign_out]           visible     10

Senha incorreta
    Open Login Page
    Login With                  papito@parodify.com         abc123
    Alert Should Be             Oops! Dados de acesso incorretos!

E-mail não existe
    Open Login Page
    Login With                  lalala@parodify.com         pwd123
    Alert Should Be             Oops! Dados de acesso incorretos!

E-mail não informado
    Open Login Page
    Login With                  ${EMPTY}                    abc123
    Alert Should Be             Oops! Dados de acesso incorretos!

Senha não informada
    Open Login Page
    Login With                  papito@parodify.com          ${EMPTY}
    Alert Should Be             Oops! Dados de acesso incorretos!