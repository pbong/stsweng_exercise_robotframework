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
    # display error message
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
    # display error message
    Element Text Should Be    //*[@id="login_button_container"]/div/form/div[3]/h3   Epic sadface: Username and password do not match any user in this service
    # close browser
    [Teardown]    Close Browser

Problem User Have a Broken Inventory Page
    # open browser
    Open Browser    https://www.saucedemo.com/    chrome
    # set window size
    Maximize Browser Window
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    problem_user
    # input password
    Input Password    password    secret_sauce
    # click login button
    Click Button    login-button
    # display error message
    Element Attribute Value Should Be    //*[@id="item_4_img_link"]/img    src    https://www.saucedemo.com/static/media/sl-404.168b1cce.jpg
    # close browser
    [Teardown]    Close Browser

Sort Product Name (A to Z)
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
    # should sort by A-Z
    Select From List By Value    class:product_sort_container    az  
    # close browser
    [Teardown]    Close Browser

Sort Product Name (Z to A)
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
    # should sort by Z-A
    Select From List By Value    class:product_sort_container    za 
    # close browser
    [Teardown]    Close Browser

Sort Product Price (low to high)
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
    # should sort by low to high
    Select From List By Value    class:product_sort_container    lohi 
    # close browser
    [Teardown]    Close Browser

Sort Product Price (high to low)
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
    # should sort by low to high
    Select From List By Value    class:product_sort_container    hilo
    # close browser
    [Teardown]    Close Browser