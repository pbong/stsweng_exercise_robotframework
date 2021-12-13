*** Settings ***
Documentation   A test suite that tests different items
...
...
...
Library         SeleniumLibrary

*** Test Cases ***
Valid Login
    # open browser
    Open Browser    https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    standard_user
    # input password
    Input Password    password    secret_sauce
    # click login button
    Click Button    login-button
    # should be open in products page
    Element Text Should Be    class:title    PRODUCTS
    # close browser
    [Teardown]    Close Browser

Locked Out Login
    # open browser
    Open Browser    https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    locked_out_user
    # input password
    Input Password    password    secret_sauce
    # click login button
    Click Button    login-button
    # should be open in products page
    Element Text Should Be    //*[@id="login_button_container"]/div/form/div[3]/h3   Epic sadface: Sorry, this user has been locked out.
    # close browser
    [Teardown]    Close Browser

Wrong Pasword Login
    # open browser
    Open Browser    https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    standard_user
    # input password
    Input Password    password    123456
    # click login button
    Click Button    login-button
    # should be open in products page
    Element Text Should Be    //*[@id="login_button_container"]/div/form/div[3]/h3   Epic sadface: Username and password do not match any user in this service
    # close browser
    [Teardown]    Close Browser