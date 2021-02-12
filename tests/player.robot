*** Settings ***
Documentation           Testanto o player de paródias

*** Test Cases***
Reproduzir paródia Bug de Manhã
    Open Login Page
    Login With                      papito@parodify     pwd123
    Logout Link Should Be Visible

    Click                           css=a[href*=search]
    Get Text                        css=h2      equal       Buscar

    Click                           xpath=//img[contains(@src, "sertanejo.png")]/..
    Get Text                        css=h2      equal       Sertanejo

    Click                           xpath=//p[contains(text(), "Marcus e Debug")]/..
    Get Text                        css=h2      equal       Músicas

    Click                           xpath=//h2[contains(text(), "Some Class This")]/../..//div[contains(@class, "play")]//a