"""biocommons.example test, within tests directory adjacent to source"""

from ..marvin import get_quote


def test_get_quote(all_quotes):
    """test get_quote"""
    # NB: all_quotes argument is a test fixture; see ./conftest.py
    assert get_quote() in all_quotes  # noqa: S101
