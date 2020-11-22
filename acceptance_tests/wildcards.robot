*** Settings ***
Resource        ${CURDIR}/resources/common.robot
Suite Setup     Open test target
Suite Teardown  Close browser

*** Test Cases ***
Starts with
    [Template]  Check element count for locator
    testid:by-label*  5
    label:By label*  5
    alttext:By alt*  3

Ends with
    [Template]  Check element count for locator
    testid:*test1  3
    title:*title test2  1

Contains
    [Template]  Check element count for locator
    testid:*alt-text*  4
    placeholder:*placeholder*  1
    text:*test*  10

*** Keywords ***
Check element count for locator
    [Arguments]  ${locator}  ${count}
    ${elements}=  Get webelements  ${locator}
    Length should be  ${elements}  ${count}
