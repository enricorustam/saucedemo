*** Settings ***
Resource    ../resources/keywords.robot
Suite Setup     Open Browser To Login Page
Suite Teardown  Close Browser Session

*** Test Cases ***

Checkout Tanpa Data
    Login With Credentials    ${VALID_USER}    ${PASSWORD}
    Verify Login Success
    Add First Product To Cart
    Open Cart
    Checkout Without Data
    Close Browser Session