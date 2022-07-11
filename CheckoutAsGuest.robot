*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}      firefox
${url}          https://demo.nopcommerce.com/

*** Test Cases ***
Homepage
    Open Browser                 ${url}                                ${browser}
    Element Should Be Visible    //div[@class="header-logo"]
    Click Link                   Computers
    Sleep                        5s           

SelectProduct
    Element Should Be Visible       //div[@class="header-logo"]
    ${notebooks}                     Get WebElement                        (//a[@href="/notebooks"])[1]
    Execute Javascript               arguments[0].click();                 ARGUMENTS    ${notebooks}
    Sleep                            5s
    Page Should Contain List         //select[@name="products-orderby"]
    Select From List By Value        //select[@name="products-orderby"]    11
    Wait Until Element Is Visible    //div[@class="page-body"]
    Sleep                            1s            
    Click Button                     (//button[@class="button-2 product-box-add-to-cart-button"])[1]
    Sleep                            5s        

ProductDetail
    Element Should Be Visible        //div[@class="header-logo"]
    Click Button                     //button[@id="add-to-cart-button-4"]
    Sleep                            5s
    Click Link                       (//a[@href="/cart"])[1]
    Sleep                            5s      

ShoppingCart
    Element Should Be Visible        //div[@class="header-logo"]
    Page Should Contain List         //select[@id="checkout_attribute_1"]
    Select From List By Value        //select[@id="checkout_attribute_1"]    2
    Select Checkbox                  //input[@id="termsofservice"]
    Click Button                     //button[@id="checkout"]
    Sleep                            5s
    Click Button                     //button[@class="button-1 checkout-as-guest-button"]   
    Sleep                            5s         
    
BillingAddress
    Element Should Be Visible    //div[@class="header-logo"]
    Input Text                   //input[@id="BillingNewAddress_FirstName"]             Cecep
    Input Text                   //input[@id="BillingNewAddress_LastName"]              Solehudin
    Input Text                   //input[@id="BillingNewAddress_Email"]                 tes123@gmail.com
    Input Text                   //input[@id="BillingNewAddress_Company"]               PT. Untung Terus
    Page Should Contain List     //select[@id="BillingNewAddress_CountryId"]
    Select From List By Value    //select[@id="BillingNewAddress_CountryId"]            134
    Page Should Contain List     //select[@id="BillingNewAddress_StateProvinceId"]    
    Select From List By Value    //select[@id="BillingNewAddress_StateProvinceId"]      0
    Input Text                   //input[@name="BillingNewAddress.City"]                Jakarta   
    Input Text                   //input[@name="BillingNewAddress.Address1"]            Jl. Pembangunan
    Input Text                   //input[@name="BillingNewAddress.Address2"]            Jl. Perjuangan
    Input Text                   //input[@id="BillingNewAddress_ZipPostalCode"]         40000
    Input Text                   //input[@id="BillingNewAddress_PhoneNumber"]           0821234567890
    Input Text                   //input[@id="BillingNewAddress_FaxNumber"]             0219999999
    Click Button                 //button[@name="save"]
    Sleep                        5s   

ShippingMethod 
    Element Should Be Visible           //div[@class="header-logo"]
    Page Should Contain Radio Button    //input[@id="shippingoption_1"]
    Select Radio Button                 shippingoption    Next Day Air___Shipping.FixedByWeightByTotal
    Click Button                        //button[@class="button-1 shipping-method-next-step-button"]
    Sleep                               5s   

PaymentMethod
    Page Should Contain Radio Button    //input[@id="paymentmethod_1"]
    Select Radio Button                 paymentmethod    Payments.Manual
    Click Button                        //button[@class="button-1 payment-method-next-step-button"]    
    Sleep                               3s   

PaymentInformation
    Element Should Be Visible           //div[@class="header-logo"]
    Page Should Contain List            //select[@id="CreditCardType"]  
    Select From List By Value           //select[@id="CreditCardType"]            MasterCard   
    Input Text                          //input[@id="CardholderName"]             Cecep Solehudin
    Input Text                          //input[@id="CardNumber"]                 374245455400126      
    Page Should Contain List            //select[@id="ExpireMonth"]               
    Select From List By Value           //select[@id="ExpireMonth"]               9
    Page Should Contain List            //select[@id="ExpireYear"]  
    Select From List By Value           //select[@id="ExpireYear"]                2024
    Input Text                          //input[@id="CardCode"]                   002
    Click Button                        //button[@class="button-1 payment-info-next-step-button"]
    Sleep                               3s    
    Close Browser