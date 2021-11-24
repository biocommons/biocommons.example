from importlib.metadata import PackageNotFoundError, version

try:
    __version__ = version(__package__)
except PackageNotFoundError:   # pragma: no cover
    # package is not installed
    __version__ = None
    pass


from .marvin import get_quote as get_quote_from_marvin
