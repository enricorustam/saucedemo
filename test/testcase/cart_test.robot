*** Settings ***
Resource    ../resources/keywords.robot
Suite Setup     Open Browser To Login Page
Suite Teardown  Close Browser Session

*** Test Cases ***

Add Product To Cart
    Login With Credentials    ${VALID_USER}    ${PASSWORD}
    Verify Login Success
    Add First Product To Cart
    Verify Cart Badge Count    1
    Open Cart
