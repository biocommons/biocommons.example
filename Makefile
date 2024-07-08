# Makefile for Python project

.DELETE_ON_ERROR:
.PHONY: FORCE
.PRECIOUS:
.SUFFIXES:

ifeq ("","$(shell command -v zsh)")
$(error "zsh not found; you must install zsh first")
endif

SHELL:=zsh -eu -o pipefail -o null_glob
SELF:=$(firstword $(MAKEFILE_LIST))

VE_DIR=venv

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
${VE_DIR}:
	python3 -mvenv $@; \
	source $@/bin/activate; \
	python3 -m ensurepip --upgrade; \
	pip install --upgrade pip setuptools wheel

#=> develop: install package in develop mode
.PHONY: develop
develop:
	pip install -e ".[dev]"
	pre-commit install

#=> install: install package
.PHONY: install
install:
	pip install "."

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
	pytest --cov src
test-docs:
	pytest docs
test-code:
	pytest src
test-%:
	pytest -m '$*' src

#=> tox -- run all tox tests
tox:
	tox

#=> cqa: execute code quality tests
cqa:
	ruff format --check
	ruff check

#=> reformat: reformat code
.PHONY: reformat
reformat:
	ruff check --fix
	ruff format

############################################################################
#= UTILITY TARGETS

#=> rename: rename files and substitute content for new repo name
.PHONY: rename
rename:
	./sbin/rename-package

#=> docs -- make sphinx docs
.PHONY: docs
docs: develop
	# RTD makes json. Build here to ensure that it works.
	make -C doc html json

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

#=> cleanest: remove files and directories that require more time/network fetches to rebuild
.PHONY: cleanest
cleanest: cleaner
	rm -frv .eggs .tox venv

#=> distclean: remove untracked files and other detritus
.PHONY: distclean
distclean: cleanest
	git clean -df

## <LICENSE>
## Copyright 2023 Source Code Committers
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
## </LICENSE>
