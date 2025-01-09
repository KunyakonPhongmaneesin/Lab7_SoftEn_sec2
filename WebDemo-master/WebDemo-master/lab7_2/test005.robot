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
    Input destination    ${DESTINATION}
    Input contactperson    ${CONTACT_PERSON}
    Input relationship    ${RELATIONSHIP}
    Input email    ${EMAIL} 
    Input invalid phone    ${INVALID_PHONE}  
    Submit Credentials
    Form Page Should Be Open
    Show message enter a valid phone number, e.g., 081-234-5678, 081 2345678, or 081.234.5678)
    [Teardown]    Close Browser
    