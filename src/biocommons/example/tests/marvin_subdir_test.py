"""biocommons.example test, within tests directory adjacent to source
"""

from ..marvin import get_quote


def test_get_quote():
    """test get_quote"""
    assert get_quote() is not None
