*** Settings ***
Library    AppiumLibrary
Resource    ../resources/config.robot

Test Template    Open app
Test Teardown    Close App

*** Test Cases ***
TC001 - Open Application    ${SUITE_NAME}-${TEST_NAME}
    