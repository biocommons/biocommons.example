"""biocommons.example test, adjacent to code"""

from .marvin import get_quote


def test_get_quote():
    """test get_quote"""
    assert get_quote() is not None
