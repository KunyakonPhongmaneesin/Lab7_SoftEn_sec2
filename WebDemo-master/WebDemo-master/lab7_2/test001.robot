*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Open Form
    Open Browser To Form Page
    
Record Success
    Input Firstname    ${FIRST_NAME} 
    Input Lastname    ${LAST_NAME}
    
    Input contactperson    ${CONTACT_PERSON}
    Input relationship    ${RELATIONSHIP}
    Input email    ${EMAIL}
    Input phone    ${PHONE}
    Submit Credentials
    Complete Page Should Be Open
    Show message Our agent will contact you shortly
    Show message you for your patient.
    [Teardown]    Close Browser
    