# rf-se-dtl-selectors-plugin

[DOM testing library](https://testing-library.com/) inspired selectors for Robot Framework [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/).

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

Run acceptance tests in Docker container:

```bash
# Build image
docker build . -t atest

# Run tests
docker run --rm atest

# Run tests and get test output to ./out
docker run -v $(pwd)/out:/out --rm atest -d /out -L TRACE:INFO
```
