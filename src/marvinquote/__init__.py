from importlib.metadata import PackageNotFoundError, version

try:
    __version__ = version(__package__)
except PackageNotFoundError:
    # package is not installed
    __version__ = None
    pass


from .marvin import get_quote
