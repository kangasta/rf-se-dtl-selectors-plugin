*** Settings ***
Resource        ${CURDIR}/resources/common.robot
Library         ${CURDIR}/libraries/xpath.py

*** Test Cases ***
Find by locator with regexp
    [Template]  Find element with regexp xpath
    alttext:/ALT TEXT TEST1/i  by-alt-text-test1
    placeholder:/holder test/  by-placeholder-test

*** Keywords ***
Find element with regexp xpath
    [Arguments]  ${locator}  ${testid}
    ${xpath}=  Get Xpath  ${locator}
    Xpath target testid should be  ${xpath}  ${testid}
