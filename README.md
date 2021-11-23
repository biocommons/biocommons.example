# Marvin Quote Test Package

This repo contains source for a simple package to reevaluate choices
for Python packaging.


## Developer Setup

Setup like this:

    python3 -m venv venv
    source venv/bin/activate
    pip install -u pip setuptools
    pip install -U pip setuptools

Install in development mode:

    pip install -e .[dev]

Code reformatting:

    black src tests
	isort src tests

Test:

    pytest   # for current environment
	tox      # for Python 3.9 and Python 3.10
	

