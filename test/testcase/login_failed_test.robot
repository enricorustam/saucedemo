*** Settings ***
Resource    ../resources/keywords.robot
Suite Setup     Open Browser To Login Page
Suite Teardown  Close Browser Session

*** Test Cases ***

Login Dengan Kredensial Tidak Valid
    Go To Login Page
    Login With Credentials    ${INVALID_USER}    ${INVALID_PASSWORD}
    Verify Login Failed