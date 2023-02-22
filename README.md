# myome.example Test Package

This repo provides a template for biocommons Python packages.  Here's how to use it:

1. Click the [Use this template](https://github.com/myome/example/generate) button.
1. Clone your repo locally.
1. In the repo, type `make rename`. The new name will be chosen based on the repo name.
1. Remove this header.
1. Commit and push.


## Code Quality Status

| Workflow | Description             | Status                                                                       |
|----------|-------------------------|------------------------------------------------------------------------------|
| Pylint   | static code analysis    | ![Pylint](https://github.com/myome/example/actions/workflows/pylint.yaml/badge.svg) |
| Flake8   | style guide enforcement | ![Flake8](https://github.com/myome/example/actions/workflows/flake8.yaml/badge.svg) |
| Bandit   | security checks         | ![Bandit](https://github.com/myome/example/actions/workflows/bandit.yaml/badge.svg) |
| Pytest   | unit testing            | ![Tests](https://github.com/myome/example/actions/workflows/pytest.yaml/badge.svg)  |

## Installation

To install from inside the myome VPC: ```pip install -i https://pypi.myome.info/simple myome-example```

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

    $ python3 -m myome.example
    Marvin says:
    There's only one life-form as intelligent as me within thirty parsecs...
           
    $ marvin-quote 
    Marvin says:
    You think you've got problems? What are you supposed to do if you...
    
    $ ipython
    >>> from myome.example import __version__, get_quote_from_marvin
    >>> __version__
    '0.1.dev8+gd5519a8.d20211123'
    >>> get_quote()
    "The first ten million years were the worst, ...


# Features

## Code structure and features
* Modern pyproject.toml with setuptools, versioning based on git tag (only)
* Easy development setup
* Support for namespaces
* Complete testing setup: pytest, doctesting, tox; tests with adjacent
  tests and intgeration tests
* Examples for logging, package data
* Command-line with argument parsing with argparse

## DevOps
* Quality tools: Code reformatting with black and isort
* GitHub Actions for testing and packaging

# To Do

* Docs (mkdocs w/mkdocstrings or sphinx)
* Dockerfile
* test only certain tags
* fixture example
