# rf-se-dtl-selectors-plugin

[![Build Status](https://travis-ci.org/kangasta/rf-se-dtl-selectors-plugin.svg?branch=main)](https://travis-ci.org/kangasta/rf-se-dtl-selectors-plugin)

[DOM testing library](https://testing-library.com/) inspired selectors for Robot Framework [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/).

## Installation

To install this plugin from [PyPI](https://pypi.org/project/rf-se-dtl-selectors-plugin/), run:

```bash
pip install rf-se-dtl-selectors-plugin
```

## Usage

In order to use selector provided by this plugin, load `SeleniumLibrary` with `TestingLibrarySelectorsPlugin` in the plugin array:

```robot
*** Settings ***
Library         SeleniumLibrary    plugins=TestingLibrarySelectorsPlugin

*** Test cases ***
Click input element
    Click element  placeholder:Search
```

The plugin provides `alttext`, `label`, `placeholder`, `testid`, `text`, and `title` selectors. See [acceptance_tests](./acceptance_tests) directory for usage examples. These locators are automatically registered when the plugin is initialized.

All attribute and text values are passed to `normalize-space()` XPath function before comparison with the given value.

In addition to the locator strategies, this plugin provides `Get Xpath` keyword to get the XPath expression for given locator. For example:

```robot
*** Settings ***
Library         SeleniumLibrary    plugins=TestingLibrarySelectorsPlugin

*** Test Cases ***
Find elements with xpath
    ${xpath}=  Get Xpath  placeholder:Search
    Click element  xpath:${xpath}
```

## Testing

Check and automatically fix formatting with:

```bash
pycodestyle TestingLibrarySelectorsPlugin
autopep8 -aaar --in-place TestingLibrarySelectorsPlugin
```

Run static analysis with:

```bash
pylint -E --enable=invalid-name,unused-import,useless-object-inheritance TestingLibrarySelectorsPlugin
```

Run unit tests:

```bash
# Run unit tests
python3 -m unittest discover -s unit_tests/

# Run unit tests with coverage analysis
coverage run \
    --branch \
    --source TestingLibrarySelectorsPlugin/ \
    -m unittest discover -s unit_tests/
coverage report -m
```

Run acceptance tests in Docker container:

```bash
# Build image
docker build . -t atest

# Run acceptance tests
docker run --rm atest

# Run acceptance tests and get test output to ./out
docker run -v $(pwd)/out:/out --rm atest -d /out -L TRACE:INFO
```
