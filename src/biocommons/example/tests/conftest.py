import importlib.resources

import pytest
import yaml


@pytest.fixture()
def all_quotes():
    quotes_stream = importlib.resources.files("example").joinpath("quotes.yaml").read_text()
    return yaml.load(quotes_stream, Loader=yaml.SafeLoader)["quotes"]
