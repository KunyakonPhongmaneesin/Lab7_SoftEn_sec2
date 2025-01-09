*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     demo
${VALID PASSWORD}    mode
${LOGIN URL}      http://${SERVER}/Form.html
${COMPLETE URL}      http://${SERVER}/Complete.html
${CHROME_PATH}    C:/Users/KKU650001/Downloads/ChromeForTesting/chrome-win64/chrome.exe
${CHROMEDRIVER}    C:/Users/KKU650001/Downloads/ChromeForTesting/chromedriver-win64/chromedriver.exe 
${FROM URL}     http://${SERVER}/Form.html
${FIRST_NAME}    Somsong
${LAST_NAME}    Sandee
${DESTINATION}    Europe
${CONTACT_PERSON}    Sodsai Sandee
${RELATIONSHIP}    MOTHER
${EMAIL}    somsong@kkumail.com
${PHONE}     081-111-1234
${INVALID_EMAIL}    somsong@
${INVALID_PHONE}    191
*** Keywords ***
Open Browser To Form Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${options.binary_location}    Set Variable    ${CHROME_PATH}
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path=r'${CHROMEDRIVER}')    sys, selenium.webdriver.chrome.service
    Create WebDriver    Chrome    options=${options}    service=${service}
    Go To    ${FROM URL}
    Maximize Browser Window
    Form Page Should Be Open

Form Page Should Be Open
    Title Should Be    Customer Inquiry

Complete Page Should Be Open
    Title Should Be    Completed

Input Firstname
    [Arguments]    ${FIRST_NAME}
    Input Text    firstname    ${FIRST_NAME}

Input Lastname
    [Arguments]    ${LAST_NAME}
    Input Text    lastname    ${LAST_NAME}

Input destination
    [Arguments]    ${DESTINATION}
    input Text    destination     ${DESTINATION}

Input contactperson
    [Arguments]    ${CONTACT_PERSON}
    Input Text    contactperson    ${CONTACT_PERSON}

Input relationship
    [Arguments]    ${RELATIONSHAIP}
    INput Text    relationship    ${RELATIONSHAIP}

Input email
    [Arguments]    ${EMAIL}
    Input Text    email    ${EMAIL}

Input phone
    [Arguments]    ${PHONE}
    Input Text    phone    ${PHONE}


Input invalid phone
    [Arguments]    ${INVALID_PHONE}
    Input Text    phone    ${INVALID_PHONE}

Input invalid email
    [Arguments]    ${INVALID_EMAIL}
    INput Text    email    ${INVALID_EMAIL}

Submit Credentials
    Click Button    submitButton

Show message Our agent will contact you shortly
    Element Text Should Be    xpath=//h1    Our agent will contact you shortly.
Show message you for your patient.
    Element Text Should Be    xpath=//h2    Thank you for your patient.
    
Show message enter a valid email address
    Element Text Should Be    id=errors    *Please enter a valid email address

Show message enter a phone number
    Element Text Should Be    id=errors    *Please enter a phone number

Show message enter a valid phone number, e.g., 081-234-5678, 081 2345678, or 081.234.5678)
    Element Text Should Be    id=errors    *Please enter a valid phone number, e.g., 081-234-5678, 081 2345678, or 081.234.5678)