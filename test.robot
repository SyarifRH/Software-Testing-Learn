*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://d1cjkrpphak3fo.cloudfront.net/

*** Test Cases ***
Buka google
    Open Browser   ${URL}   chrome  
    Wait Until Element Is Visible   xpath://input[@id='normal_login_email']
    Input Text           //input[@id='normal_login_email']           iinhu@grr.la
    Input Password       //input[@id='normal_login_password']        12345678
    Click Element        //span[contains(text(),'Masuk')]
    Sleep    5
    
