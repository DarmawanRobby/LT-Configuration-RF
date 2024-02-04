*** Settings ***
Library     AppiumLibrary
Library     Env.py
Library     String
Library     ../lambdatest/LambdaTestStatus.py


*** Variables ***
${username}                 <-- YOUR USERNAME -->
${accesskey}                <-- YOUR ACCESS KEY -->
${REMOTE_URL}               https://${username}:${accesskey}@mobile-hub.lambdatest.com/wd/hub
${TIMEOUT}                  3000

${BUILD_TIMESTAMP}          ${EMPTY}

*** Keywords ***
Get Start Date
    IF    '${BUILD_TIMESTAMP}' == ''    Set Build Timestamp
    Log    build=${BUILD_TIMESTAMP}
    RETURN    ${BUILD_TIMESTAMP}

Set Build Timestamp
    ${current_datetime}    Get Time    result_format=day   time_=NOW
    Set Global Variable    ${BUILD_TIMESTAMP}    ${current_datetime}

Open app
    [Arguments]    ${Test Suite, Test Case}
    # Lamda setting
    # Variable                   Variable in file .Env
    ${LAMDA_DEVICE_NAME}         Get env    LAMDA_DEVICE_NAME
    ${LAMDA_PLATFORM_NAME}       Get env    LAMDA_PLATFORM_NAME
    ${LAMDA_PLATFORM_VERSION}    Get env    LAMDA_PLATFORM_VERSION
    ${LAMDA_APP_URL}             Get env    LAMDA_APP_URL
    ${LAMDA_BUILD_NAME}          Get env    LAMDA_BUILD_NAME
    ${LAMDA_PROJECT}             Get env    LAMDA_PROJECT
    ${LAMDA_ISREAL_MOBILE}       Get env    LAMDA_ISREAL_MOBILE
    ${LAMDA_W3C}                 Get env    LAMDA_W3C
    ${LAMDA_DEVICE_LOG}          Get env    LAMDA_DEVICE_LOG
    ${LAMDA_NETWORK_LOG}         Get env    LAMDA_NETWORK_LOG

    ${gettime}    Get Start Date

    &{LT_Options}    Create Dictionary
    ...    isRealMobile=${LAMDA_ISREAL_MOBILE}
    ...    platformVersion=${LAMDA_PLATFORM_VERSION}
    ...    deviceName=${LAMDA_DEVICE_NAME}
    ...    app=${LAMDA_APP_URL}
    ...    w3c=${LAMDA_W3C}
    ...    platformName=${LAMDA_PLATFORM_NAME}
    ...    build=${LAMDA_BUILD_NAME}_${SUITE_NAME}_${gettime}
    ...    name=${Test Suite, Test Case}
    ...    project=${LAMDA_PROJECT}
    ...    network=${LAMDA_NETWORK_LOG}
    ...    devicelog=${LAMDA_DEVICE_LOG}
    ...    autoGrantPermissions=true
    ...    visual=true
    &{DESIRED_CAPABILITIES}    Create Dictionary
    ...    LT:Options=&{LT_Options}
    Open Application    remote_url=${REMOTE_URL}    desired_capabilities=${DESIRED_CAPABILITIES}


Close App
    ${status}    Set Variable If    '${TEST_STATUS}'=='PASS'    passed    failed
    Execute Script    lambda-hook: {"action": "setTestStatus", "arguments": {"status": "${status}", "remark": "${TEST_MESSAGE} ${TEST_STATUS}"}}
    Log    ${TEST_STATUS}
    Close Application