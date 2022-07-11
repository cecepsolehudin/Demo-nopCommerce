*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}            chrome
${url}                https://demo.nopcommerce.com/

*** Test Cases ***
Homepage
    Open Browser                 ${url}                             ${browser}
    Maximize Browser Window
    Element Should Be Visible    //div[@class="header-logo"]
    Element Should Be Visible    //a[@class="ico-login"]
    Click Link                   //a[@class="ico-login"]    
    Sleep                        3s    
    
LogIn
    Element Should Be Visible    //div[@class="header-logo"]
    Element Should Be Visible    //div[@class="form-fields"]    
    Input Text                   //input[@class="email"]            testo56765@gmail.com
    Input Text                   //input[@class="password"]         78sdu7UIK      
    Click Element                //button[@class="button-1 login-button"]      
    Sleep                        3s          
    Close Browser