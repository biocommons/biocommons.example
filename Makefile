# Makefile for Python project

.DELETE_ON_ERROR:
.PHONY: FORCE
.PRECIOUS:
.SUFFIXES:

SHELL:=/bin/bash -e -o pipefail
SELF:=$(firstword $(MAKEFILE_LIST))

PY_VERSION:=3.10
VE_DIR=venv/${PY_VERSION}

TEST_DIRS:=tests
DOC_TESTS:=src ./README.md


############################################################################
#= BASIC USAGE
default: help

#=> help -- display this help message
help:
	@sbin/makefile-extract-documentation "${SELF}"


############################################################################
#= SETUP, INSTALLATION, PACKAGING

#=> devready: create venv, install prerequisites, install pkg in develop mode
.PHONY: devready
devready:
	make ${VE_DIR} && source ${VE_DIR}/bin/activate && make develop
	@echo '#################################################################################'
	@echo '###  Do not forget to `source ${VE_DIR}/bin/activate` to use this environment  ###'
	@echo '#################################################################################'

#=> venv: make a Python 3 virtual environment
venv: ${VE_DIR}
${VE_DIR}: venv/%:
	python$* -mvenv $@; \
	source $@/bin/activate; \
	python -m ensurepip --upgrade; \
	pip install --upgrade pip setuptools wheel

#=> develop: install package in develop mode
.PHONY: develop install
develop:
	@if [ -z "$${VIRTUAL_ENV}" ]; then echo "Not in a virtual environment; see README.md" 1>&2; exit 1; fi
	pip install -e .[dev]

#=> install: install package
install:
	pip install .

#=> build: make sdist and wheel
.PHONY: build
build: %:
	python -m build


############################################################################
#= TESTING
# see test configuration in setup.cfg

#=> test: execute tests
#=> test-code: test code (including embedded doctests)
#=> test-docs: test example code in docs
.PHONY: test test-code test-docs
test:
	pytest
test-code:
	pytest src
#test-docs:
#	pytest docs

#=> tox -- run all tox tests
tox:
	tox


############################################################################
#= UTILITY TARGETS

#=> reformat: reformat code with yapf and commit
.PHONY: reformat
reformat:
	@if ! git diff --cached --exit-code >/dev/null; then echo "Repository not clean" 1>&2; exit 1; fi
	black src tests
	isort src tests
	git commit -a -m "reformatted with black and isort"

#=> rename: rename files and substitute content for new repo name
.PHONY: rename
rename:
	./sbin/rename-package

# #=> docs -- make sphinx docs
# .PHONY: docs
# docs: develop
# 	# RTD makes json. Build here to ensure that it works.
# 	make -C doc html json


############################################################################
#= CLEANUP

#=> clean: remove temporary and backup files
.PHONY: clean
clean:
	rm -frv **/*~ **/*.bak

#=> cleaner: remove files and directories that are easily rebuilt
.PHONY: cleaner
cleaner: clean
	rm -frv .cache build dist docs/_build
	rm -frv **/__pycache__
	rm -frv **/*.egg-info
	rm -frv **/*.pyc
	rm -frv **/*.orig
	rm -frv **/*.rej

#=> cleanest: remove files and directories that are more expensive to rebuild
.PHONY: cleanest
cleanest: cleaner
	rm -frv .eggs .tox venv

#=> distclean: remove untracked files and other detritus
.PHONY: distclean
distclean: cleanest
	git clean -df
