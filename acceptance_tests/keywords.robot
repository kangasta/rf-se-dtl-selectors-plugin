*** Settings ***
Resource        ${CURDIR}/resources/common.robot
Suite Setup     Open test target
Suite Teardown  Close browser

*** Test Cases ***
Get Xpath errors
    Run keyword and expect error
    ...  ValueError: Locator must be given as strategy:criteria format.
    ...  Get Xpath  not a valid locator
    Run keyword and expect error
    ...  ValueError: Strategy must be *
    ...  Get Xpath  unknown:strategy

Find elements with xpath
    [Template]  Find element with xpath
    alttext:By alt text test1  by-alt-text-test1
    label:By label test1  by-label-test1
    placeholder:By placeholder test  by-placeholder-test
    testid:by-testid-test  by-testid-test
    text:By text test  by-text-test
    title:Click to test by title  by-title-test1

*** Keywords ***
Find element with xpath
    [Arguments]  ${locator}  ${testid}
    ${xpath}=  Get Xpath  ${locator}
    Element Attribute Value Should Be  xpath:${xpath}  data-testid  ${testid}
