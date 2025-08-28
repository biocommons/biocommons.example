# biocommons.example Test Package

[![codecov](https://codecov.io/gh/biocommons/biocommons.example/graph/badge.svg?token=CCUMQQV5R6)](https://codecov.io/gh/biocommons/biocommons.example)

---

This repo provides a template for biocommons Python packages.  Here's how to use it:

1. Click the [Use this template](https://github.com/biocommons/example/generate)
   button. Name the new repo like "biocommons.something".
1. Clone your repo locally.
1. In the repo, type `make rename`. The new name will be chosen based on the repo name.
1. Remove this header.
1. Commit and push.

Delete this section in your generated template.

---

## Installation

To install from pypi: ```pip install biocommons.example```

## Developer Setup

### Prerequisites

- [GNU make](https://www.gnu.org/software/make/): Current mechanism for consistent invocation of developer tools.
  - Mac: [Install brew](https://brew.sh/), then [install make](https://formulae.brew.sh/formula/make)
  - Ubuntu: `sudo apt install make`
- [uv](https://docs.astral.sh/uv/): An extremely fast Python package and project manager, written in Rust.
  - All platforms: See the [uv installation instructions](https://docs.astral.sh/uv/getting-started/installation/).
- [zsh](https://www.zsh.org/): Shell used by the Makefile
  - Mac: included by default
  - Ubuntu: `sudo apt install zsh`

### One-time developer setup

Create a Python virtual environment and install dependencies:

    make devready

### Development

Activate your environment:

    source venv/bin/activate

Code reformatting:

    make reformat

Test:

    make test   # for current environment
    make tox    # for all supported versions

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

* Modern pyproject.toml with setuptools
* Versioning based on git tag (only)
* Easy development setup
* Support for namespaces
* Testing with coverage using pytest; tests may be in `tests/`, embedded in the package, and in doc strings
* Examples for logging and package data
* Command-line with argument parsing with argparse

## DevOps

* Quality tools: Code linting and reformatting with Ruff
* GitHub Actions for testing and packaging
