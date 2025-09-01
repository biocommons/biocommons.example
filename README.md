# biocommons.example

[![Release](https://img.shields.io/github/v/release/biocommons/python-package)](https://img.shields.io/github/v/release/biocommons/python-package)
[![Build status](https://img.shields.io/github/actions/workflow/status/biocommons/python-package/main.yml?branch=main)](https://github.com/biocommons/python-package/actions/workflows/main.yml?query=branch%3Amain)
[![codecov](https://codecov.io/gh/biocommons/python-package/branch/main/graph/badge.svg)](https://codecov.io/gh/biocommons/python-package)
[![Commit activity](https://img.shields.io/github/commit-activity/m/biocommons/python-package)](https://img.shields.io/github/commit-activity/m/biocommons/python-package)
[![License](https://img.shields.io/github/license/biocommons/python-package)](https://img.shields.io/github/license/biocommons/python-package)

Package Description

This is a [biocommons](https://biocommons.org/) project.

- **Github repository**: <https://github.com/biocommons/python-package/>
- **Documentation** <https://biocommons.github.io/python-package/>

## Python Package Installation

Install from PyPI using one or more of the following:

- `pip install biocommons.example`
- `uv pip install biocommons.example`
- Add `biocommons.example` to dependencies in `pyproject.toml` or `requirements.txt`

## Developer Setup

### Install Prerequisites

These tools are required to get started:

- [git](https://git-scm.com/): Version control system
- [GNU make](https://www.gnu.org/software/make/): Current mechanism for consistent invocation of developer tools.
- [uv](https://docs.astral.sh/uv/): An extremely fast Python package and project manager, written in Rust.

#### MacOS or Linux Systems

- [Install brew](https://brew.sh/)
- `brew install git make uv`

#### Linux (Debian-based systems)

You may also install using distribution packages:

    sudo apt install git make

Then install uv using the [uv installation instructions](https://docs.astral.sh/uv/getting-started/installation/).

### One-time developer setup

Create a Python virtual environment, install dependencies, install pre-commit hooks, and install an editable package:

    make devready

### Development

**N.B.** Developers are strongly encouraged to use `make` to invoke tools to
ensure consistency with the CI/CD pipelines.  Type `make help` to see a list of
supported targets.

Try it:

    $ source venv/bin/activate

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
















## Getting started with your project

### 1. Create a New Repository

First, create a repository on GitHub with the same name as this project, and then run the following commands:

```bash
git init -b main
git add .
git commit -m "init commit"
git remote add origin git@github.com:biocommons/python-package.git
git push -u origin main
```

### 2. Set Up Your Development Environment

Then, install the environment and the pre-commit hooks with

```bash
make install
```

This will also generate your `uv.lock` file

### 3. Run the pre-commit hooks

Initially, the CI/CD pipeline might be failing due to formatting issues. To resolve those run:

```bash
uv run pre-commit run -a
```

### 4. Commit the changes

Lastly, commit the changes made by the two steps above to your repository.

```bash
git add .
git commit -m 'Fix formatting issues'
git push origin main
```

You are now ready to start development on your project!
The CI/CD pipeline will be triggered when you open a pull request, merge to main, or when you create a new release.

To finalize the set-up for publishing to PyPI, see [here](https://fpgmaas.github.io/cookiecutter-uv/features/publishing/#set-up-for-pypi).
For activating the automatic documentation with MkDocs, see [here](https://fpgmaas.github.io/cookiecutter-uv/features/mkdocs/#enabling-the-documentation-on-github).
To enable the code coverage reports, see [here](https://fpgmaas.github.io/cookiecutter-uv/features/codecov/).

## Releasing a new version

- Create an API Token on [PyPI](https://pypi.org/).
- Add the API Token to your projects secrets with the name `PYPI_TOKEN` by visiting [this page](https://github.com/biocommons/python-package/settings/secrets/actions/new).
- Create a [new release](https://github.com/biocommons/python-package/releases/new) on Github.
- Create a new tag in the form `*.*.*`.

For more details, see [here](https://fpgmaas.github.io/cookiecutter-uv/features/cicd/#how-to-trigger-a-release).

---

Repository initiated with [fpgmaas/cookiecutter-uv](https://github.com/fpgmaas/cookiecutter-uv).
