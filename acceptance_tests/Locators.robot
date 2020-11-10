*** Settings ***
Library         OperatingSystem
Library         SeleniumLibrary    plugins=TestingLibrarySelectorsPlugin
Suite Setup     Open test target
Suite Teardown  Close browser

*** Test Cases ***
Find by label
    FOR  ${i}  IN RANGE  1  6
        Element Attribute Value Should Be  label:By label test${i}  data-testid  by-label-test${i}
    END

Find by testid
    Element Text Should Be  testid:by-testid-test  By testid test

Find by text
    Element Attribute Value Should Be  text:By text test  data-testid  by-text-test

Find by title
    Element Attribute Value Should Be  title:Click to test by title  data-testid  by-title-test1
    Click button  title:Click to test by title
    Element Attribute Value Should Be  title:By title test2  data-testid  by-title-test2


*** Keywords ***
Open test target
    ${browser}=  Get environment variable  BROWSER  headlesschrome
    ${options}=  Get environment variable  BROWSER_OPTIONS  add_argument("--no-sandbox"); add_argument("--disable-gpu")
    Open browser  file://${CURDIR}/target.html  browser=${browser}  options=${options}
