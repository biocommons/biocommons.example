# Marvin Quote Test Package

This repo contains source for a simple package to reevaluate choices
for Python packaging.  It's also good fodder for a technical
challenge.


## Technical challenge

Please implement the following functionality using GitHub Actions:

* Test the repo on every commit using tox.
* When tagged in git (e.g., 0.1.0), package the repo and push to
  test.pypi.org.  [This
  doc](https://packaging.python.org/guides/publishing-package-distribution-releases-using-github-actions-ci-cd-workflows/)
  will help.
* Check code format (`black --check`, `isort --check-only`); fail
  commit if not formatted correctly.

To get started, fork this repo and submit one PR for each of the above
changes, since that's the way we'd do it for real.

PRs that provide other improvements are also welcome.



## Developer Setup

Setup like this:

	make devready
    source venv/bin/activate
	
No make? Do this instead:

    python3 -m venv venv
    source venv/bin/activate
    pip install -U pip setuptools
	pip install -e .[dev]

Code reformatting:

	make reformat

Test:

    pytest   # for current environment
    tox      # for Python 3.9 and Python 3.10

Build:

    git tag 0.0.4
    pip install build
    python -m build
    ls -l dist

Run it:

    snafu$ python3 -m marvinquote
    Marvin says:
    There's only one life-form as intelligent as me within thirty parsecs...
           
    snafu$ marvin-quote 
    Marvin says:
    You think you've got problems? What are you supposed to do if you...
       

