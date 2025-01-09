*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}          localhost:7272
${BROWSER}         Chrome
${DELAY}           0
${VALID USER}      demo
${VALID PASSWORD}  mode
${LOGIN URL}       http://${SERVER}/
${WELCOME URL}     http://${SERVER}/welcome.html
${ERROR URL}       http://${SERVER}/error.html
${CHROME_PATH}     C:/Users/KKU650001/Downloads/ChromeForTesting/chrome-win64/chrome.exe
${CHROMEDRIVER}    C:/Users/KKU650001/Downloads/ChromeForTesting/chromedriver-win64/chromedriver.exe

*** Keywords ***
Open Browser To Login Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${options.binary_location}    Set Variable    ${CHROME_PATH}
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path=r'${CHROMEDRIVER}')    sys, selenium.webdriver.chrome.service
    Create WebDriver    Chrome    options=${options}    service=${service}
    Go To    ${LOGIN URL}
    Maximize Browser Window
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login Page

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    id=username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id=password_field    ${password}

Submit Credentials
    Click Button    id=login_button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page
