.DELETE_ON_ERROR:
.PHONY: FORCE
.PRECIOUS:
.SUFFIXES:

.DEFAULT_GOAL := help
default: help

SHELL:=/bin/bash

COLOR_RESET=\033[0m
COLOR_CYAN_BOLD=\033[1;36m
define ECHO_BANNER
	@echo -e "⏩$(COLOR_CYAN_BOLD)$(1)$(COLOR_RESET)"
endef

############################################################################
#= BASIC USAGE

.PHONY: help
help: ## Display help message
	@uvx python -c "import re; \
	[[print(f'- \033[36m{m[0]:<20}\033[0m {m[1]}') for m in re.findall(r'^([\sa-zA-Z_-]+):.*?## (.*)$$', open(makefile).read(), re.M)] for makefile in ('$(MAKEFILE_LIST)').strip().split()]" | sort


############################################################################
#= SETUP, INSTALLATION, PACKAGING

install: devready
.PHONY: devready
devready: ## Prepare local dev env: Create virtual env, install the pre-commit hooks
	$(call ECHO_BANNER, "Prepare local dev env: Create virtual env, install the pre-commit hooks")
	uv sync --dev
	uvx pre-commit install

.PHONY: build
build: ## Build package
	$(call ECHO_BANNER, "Building package")
	rm -fr dist
	uvx --from build pyproject-build --installer uv

.PHONY: publish
publish: ## Publish a release to PyPI.
	$(call ECHO_BANNER, "Publishing to PyPI.")
	uvx publish


############################################################################
#= TESTING AND CODE QUALITY

.PHONY: check
cqa check: ## Run code quality tools.
	$(call ECHO_BANNER, "Checking lock file consistency with 'pyproject.toml'")
	uv lock --locked
	$(call ECHO_BANNER, "Linting code: Running pre-commit")
	uvx pre-commit run -a
	$(call ECHO_BANNER, "Checking for obsolete dependencies: Running deptry")
	uvx deptry src

.PHONY: test
test: ## Test the code with pytest
	@echo "🚀 Testing code: Running pytest"
	pytest
	#uvx python -m pytest # --cov --cov-config=pyproject.toml --cov-report=xml


############################################################################
#= DOCUMENTATION

.PHONY: docs-test
docs-test: ## Test if documentation can be built without warnings or errors
	$(call ECHO_BANNER, "Testing whether docs can be build")
	uvx mkdocs build -s

.PHONY: serve
serve: ## Build and serve the documentation
	$(call ECHO_BANNER, "Build and serve docs for local development")
	uvx mkdocs serve


############################################################################
#= CLEANUP

.PHONY: clean
clean:  ## Remove temporary and backup files
	$(call ECHO_BANNER, "Remove temporary and backup files")
	rm -frv **/*~ **/*.bak

.PHONY: cleaner
cleaner: clean  ## Remove files and directories that are easily rebuilt
	$(call ECHO_BANNER, "Remove files and directories that are easily rebuilt")
	rm -frv .cache build dist docs/_build
	rm -frv **/__pycache__
	rm -frv **/*.egg-info
	rm -frv **/*.pyc
	rm -frv **/*.orig
	rm -frv **/*.rej

.PHONY: cleanest
cleanest: cleaner  ## Remove all files that can be rebuilt
	$(call ECHO_BANNER, "Remove files and directories that can be rebuilt")
	rm -frv .eggs .tox .venv venv

.PHONY: distclean
distclean: cleanest  ## Remove untracked files and other detritus
	@echo "❌ Remove untracked files and other detritus -- Too dangerous... do this yourself"
	# git clean -df
