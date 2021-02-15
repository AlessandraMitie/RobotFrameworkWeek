*** Settings ***
Documentation           Ações da página de login


*** Keywords ***
Open Login Page
    #Open Browser        https://parodify.herokuapp.com/users/sign_in        chromium
    New Browser         ${browser}        ${headless}
    # ao rodar o comando dos testes no terminal: robot -d ./logs -v browser:chromium -v headless:false tests\player.robot
    # a tag -v é a variável de ambiente. No cado, as variáveis são ${browser} e ${headless}

    New Page            https://parodify.herokuapp.com/users/sign_in

Login With
    [Arguments]         ${email_arg}                    ${pass_arg}
    Fill Text           css=input[name*=email]          ${email_arg}
    Fill Text           css=#user_password              ${pass_arg}
    Click               css=input[value="Log in"]

Alert Should Be
    [Arguments]         ${expect_arg}
    Get Text            css=.is-danger .message-body    ==      ${expect_arg}