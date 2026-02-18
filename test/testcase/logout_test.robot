*** Settings ***
Resource    ../resources/keywords.robot
Suite Setup     Open Browser To Login Page
Suite Teardown  Close Browser Session

*** Test Cases ***

Logout User
    Login With Credentials    ${VALID_USER}    ${PASSWORD}
    Verify Login Success
    Logout From Application
