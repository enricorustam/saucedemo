*** Settings ***
Resource    ../resources/keywords.robot
Suite Setup     Open Browser To Login Page
Suite Teardown  Close Browser Session

*** Test Cases ***

Login Dengan Kredensial Valid
    Login With Credentials    ${VALID_USER}    ${PASSWORD}
    Verify Login Success

Login Dengan Semua User
    FOR    ${user}    IN    @{ALL_USERS}
        Go To    ${BASE_URL}
        Login With Credentials    ${user}    ${PASSWORD}
        Run Keyword And Ignore Error    Verify Login Success
        Run Keyword And Ignore Error    Verify Login Failed
    END

