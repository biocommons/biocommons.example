from marvinquote import __version__, get_quote


def test_version():
    assert __version__ is not None


def test_get_quote():
    assert get_quote is not None
