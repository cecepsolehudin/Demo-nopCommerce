*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}        https://demo.nopcommerce.com/

*** Test Cases ***
Homepage
    Open Browser                 ${url}                            ${browser}
    Maximize Browser Window
    Element Should Be Visible    //div[@class="header-logo"]
    Element Should Be Visible    //a[@class="ico-register"]
    Click Link                   //a[@class="ico-register"]    
    Sleep                        3s    

Register
    Element Should Be Visible       //div[@class="header-logo"]
    Element Should Be Visible       //div[@class="form-fields"]
    Select Radio Button             Gender                                M
    Input Text                      //input[@id="FirstName"]              Cecep
    Input Text                      //input[@id="LastName"]               Solehudin
    Page Should Contain List        //select[@name="DateOfBirthDay"]    
    Select From List By Value       //select[@name="DateOfBirthDay"]      16
    Page Should Contain List        //select[@name="DateOfBirthMonth"]
    Select From List By Value       //select[@name="DateOfBirthMonth"]    9
    Page Should Contain List        //select[@name="DateOfBirthYear"]
    Select From List By Value       //select[@name="DateOfBirthYear"]     1998
    Input Text                      //input[@id="Email"]                  testo56765@gmail.com
    Input Text                      //input[@id="Company"]                PT Untung Terus
    Page Should Contain Checkbox    //input[@id="Newsletter"]
    Select Checkbox                 Newsletter
    Input Text                      //input[@id="Password"]               78sdu7UIK
    Input Text                      //input[@id="ConfirmPassword"]        78sdu7UIK
    Click Element                   //button[@id="register-button"]
    Click Element                   //a[@class="button-1 register-continue-button"]        
    Sleep                           3s