from unittest import TestCase
from unittest.mock import MagicMock, patch

from TestingLibrarySelectorsPlugin import TestingLibrarySelectorsPlugin

class WarningsTest(TestCase):
    @patch('TestingLibrarySelectorsPlugin._plugin.warn')
    def test_regexp_warning(self, warn_mock):
        plugin = TestingLibrarySelectorsPlugin(MagicMock())
        plugin.get_xpath('title:/regexp/i')
        warn_mock.assert_called_once()

        warning_msg = warn_mock.call_args[0][0]
        self.assertIn(
            'This might not be supported by your target browser',
            warning_msg
        )

    @patch('TestingLibrarySelectorsPlugin._plugin.warn')
    def test_whitespace_warning(self, warn_mock):
        plugin = TestingLibrarySelectorsPlugin(MagicMock())
        for locator in [
            'alttext: a b',
            'label:a b ',
            'placeholder:a  b',
            'testid: a\tb',
            'text: a\nb',
        ]:
            plugin.get_xpath(locator)
            warn_mock.assert_called_once()

            warning_msg = warn_mock.call_args[0][0]
            self.assertIn(
                'The value obtained with XPath expression will be passed '
                'through normalize-space function',
                warning_msg
            )

            warn_mock.reset_mock()
