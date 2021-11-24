# biocommons.example Test Package

This repo contains source for a simple package to reevaluate choices
for Python packaging.



## Developer Setup

Setup like this:

	make devready
    source venv/bin/activate
	
Code reformatting:

	make reformat

Test:

    make test   # for current environment
    make tox    # for Python 3.9 and Python 3.10

Build:

    git tag 0.0.0
	make build

Try it:

    $ python3 -m biocommons.example
    Marvin says:
    There's only one life-form as intelligent as me within thirty parsecs...
           
    $ marvin-quote 
    Marvin says:
    You think you've got problems? What are you supposed to do if you...
	
	$ ipython
	>>> from biocommons.example import __version__, get_quote_from_marvin
	>>> __version__
	'0.1.dev8+gd5519a8.d20211123'
	>>> get_quote()
	"The first ten million years were the worst, ...


# Features

## Code structure and features
* Modern pyproject.toml with setuptools, versioning based on git tag (only)
* Easy development setup
* Complete testing setup: pytest, doctesting, tox
* Examples for logging, namespaces, package data
* Command-line with argument parsing with argparse

## DevOps
* Quality tools: Code reformatting with black and isort
* GitHub Actions for testing and packaging


# To Do

* pylint and mypy static analysis
* Sphinx docs
* Test examples in Sphinx
* Dockerfile
* test only certain tags
* fixture example
