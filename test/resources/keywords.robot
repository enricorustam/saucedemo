*** Settings ***
Library    SeleniumLibrary
Resource   variables.robot
Resource   locators.robot

*** Keywords ***

Open Browser To Login Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${LOGIN_BUTTON}

Login With Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=10s
    Clear Element Text    ${USERNAME_FIELD}
    Clear Element Text    ${PASSWORD_FIELD}
    Input Text    ${USERNAME_FIELD}    ${username}
    Input Text    ${PASSWORD_FIELD}    ${password}
    Click Button  ${LOGIN_BUTTON}

Verify Login Success
    Wait Until Element Is Visible    ${PRODUCT_TITLE}
    Element Text Should Be    ${PRODUCT_TITLE}    Products

Verify Login Failed
    Wait Until Page Contains Element    ${ERROR_MESSAGE}    timeout=10s

Verify Product List Displayed
    Wait Until Element Is Visible    ${PRODUCT_LIST}
    ${count}=    Get Element Count    ${PRODUCT_LIST}
    Should Be True    ${count} > 0

Add First Product To Cart
    Wait Until Element Is Visible    ${ADD_TO_CART_BTN}
    Click Element    ${ADD_TO_CART_BTN}

Verify Cart Badge Count
    [Arguments]    ${expected}
    Wait Until Element Is Visible    ${CART_BADGE}
    Element Text Should Be    ${CART_BADGE}    ${expected}

Open Cart
    Click Element    ${CART_ICON}

Checkout Without Data
    Click Button    ${CHECKOUT_BUTTON}
    Wait Until Element Is Visible    ${FIRSTNAME}   timeout=20s
    Click Button    ${CONTINUE_BTN}
    Wait Until Element Is Visible    ${ERROR_MESSAGE}   timeout=20s

Complete Checkout
    Click Button    ${CHECKOUT_BUTTON}
    Wait Until Element Is Visible    ${FIRSTNAME}   timeout=20s
    Input Text    ${FIRSTNAME}    Test
    Input Text    ${LASTNAME}     User
    Input Text    ${ZIPCODE}      12345
    Click Button   ${CONTINUE_BTN}
    Click Button   ${FINISH_BTN}
    Wait Until Element Is Visible    ${SUCCESS_MSG}

Logout From Application
    Click Element    ${MENU_BTN}
    Wait Until Element Is Visible    ${LOGOUT_LINK}
    Click Element    ${LOGOUT_LINK}
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    timeout=20s

Close Browser Session
    Close Browser

Go To Login Page
    Go To    ${BASE_URL}
    Wait Until Element Is Visible    ${USERNAME_FIELD}