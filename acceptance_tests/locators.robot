*** Settings ***
Resource        ${CURDIR}/resources/common.robot
Suite Setup     Open test target
Suite Teardown  Close browser

*** Test Cases ***
Find by alt text
    FOR  ${i}  IN RANGE  1  4
        Element Attribute Value Should Be  alttext:By alt text test${i}  data-testid  by-alt-text-test${i}
    END
    Run keyword and expect error  *
    ...  Element Attribute Value Should Be  alttext:By alt text test4  data-testid  by-alt-text-test4

Find by label
    FOR  ${i}  IN RANGE  1  6
        Element Attribute Value Should Be  label:By label test${i}  data-testid  by-label-test${i}
    END

Find by placeholder
    Element Attribute Value Should Be  placeholder:By placeholder test  data-testid  by-placeholder-test

Find by testid
    Element Text Should Be  testid:by-testid-test  By testid test

Find by text
    Element Attribute Value Should Be  text:By text test  data-testid  by-text-test

Find by title
    Element Attribute Value Should Be  title:Click to test by title  data-testid  by-title-test1
    Click button  title:Click to test by title
    Element Attribute Value Should Be  title:By title test2  data-testid  by-title-test2
