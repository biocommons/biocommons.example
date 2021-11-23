import importlib.resources
import random

import yaml

quotes_stream = importlib.resources.open_text(__package__, "quotes.yaml")
quotes = yaml.load(quotes_stream, Loader=yaml.SafeLoader)["quotes"]


def get_quote() -> str:
    """return random Marvin quote"""
    return random.choice(quotes)
