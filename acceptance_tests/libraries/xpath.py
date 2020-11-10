from pathlib import Path
from re import search, IGNORECASE, MULTILINE, DOTALL

from lxml import etree

with open(Path(__file__).parent.parent / 'resources' / 'target.html') as f:
    html = etree.parse(f)

def _get_flags(flags_str=None):
    if flags_str is None:
        flags_str = ''

    flags = 0
    for flag_char in flags_str:
        if flag_char == 'i':
            flags |= IGNORECASE
        elif flag_char == 's':
            flags |= DOTALL
        elif flag_char == 'm':
            flags |= MULTILINE

    return flags

def _matches(ctx, value, regexp, flags_str=None):
    try:
        value = value[0]
    except IndexError:
        return False

    flags = _get_flags(flags_str)

    if search(regexp, value, flags):
        return True
    return False

ns = etree.FunctionNamespace(None)
ns['matches'] = _matches

def find_elements(xpath):
    return html.xpath(xpath)

def xpath_target_testid_should_be(xpath, expected):
    elements = find_elements(xpath)
    for element in elements:
        testid = element.get('data-testid')
        if testid != expected:
            raise AssertionError(f'Testid "{testid}" does not match expected testid "{expected}".')
