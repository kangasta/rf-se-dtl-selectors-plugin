*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary
...         plugins=TestingLibrarySelectorsPlugin

*** Keywords ***
Open test target
    ${browser}=  Get environment variable  BROWSER  headlesschrome
    ${options}=  Get environment variable  BROWSER_OPTIONS  add_argument("--no-sandbox"); add_argument("--disable-gpu")
    Open browser  file://${CURDIR}/target.html  browser=${browser}  options=${options}
