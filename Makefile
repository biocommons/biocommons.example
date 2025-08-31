.DELETE_ON_ERROR:
.PHONY: FORCE
.PRECIOUS:
.SUFFIXES:

.DEFAULT_GOAL := help
default: help

ifeq ("","$(shell command -v zsh)")
$(error "zsh not found; you must install zsh first")
endif
SHELL:=zsh -eu -o pipefail -o null_glob

COLOR_RESET=\033[0m
COLOR_CYAN_BOLD=\033[1;36m
define INFO_MESSAGE
	@echo -e "⏩$(COLOR_CYAN_BOLD)$(1)$(COLOR_RESET)"
endef

############################################################################
#= BASIC USAGE

.PHONY: help
help: ## Display help message
	@uvx python -c "import re; \
	[[print(f'✦ \033[36m{m[0]:<20}\033[0m {m[1]}') for m in re.findall(r'^([\sa-zA-Z_-]+):.*?## (.*)$$', open(makefile).read(), re.M)] for makefile in ('$(MAKEFILE_LIST)').strip().split()]" | sort

############################################################################
#= SETUP, INSTALLATION, PACKAGING

install: devready
.PHONY: devready
devready: ## Prepare local dev env: Create virtual env, install the pre-commit hooks
	$(call INFO_MESSAGE, Prepare local dev env: Create virtual env and install the pre-commit hooks)
	uv sync --dev
	uv run pre-commit install
	@echo '⚠️ You must activate the virtual env with `source .venv/bin/activate`'

.PHONY: build
build: ## Build package
	$(call INFO_MESSAGE, "Building package")
	rm -fr dist
	uv build

############################################################################
#= FORMATTING, TESTING, AND CODE QUALITY

.PHONY: cqa
cqa: ## Run code quality assessments.
	$(call INFO_MESSAGE, "Checking lock file consistency")
	uv lock --locked
	$(call INFO_MESSAGE, "Linting and reformatting files")
	uv run pre-commit run -a
	$(call INFO_MESSAGE, "Checking for obsolete dependencies")
	uv run deptry src

.PHONY: test
test: ## Test the code with pytest
	@echo "🚀 Testing code: Running pytest"
	uv run pytest

############################################################################
#= DOCUMENTATION

.PHONY: docs-serve
docs-serve: ## Build and serve the documentation
	$(call INFO_MESSAGE, "Build and serve docs for local development")
	uv run mkdocs serve

.PHONY: docs-test
docs-test: ## Test if documentation can be built without warnings or errors
	$(call INFO_MESSAGE, "Testing whether docs can be build")
	uv run mkdocs build -s

############################################################################
#= CLEANUP

.PHONY: clean
clean:  ## Remove temporary and backup files
	$(call INFO_MESSAGE, "Remove temporary and backup files")
	rm -frv **/*~ **/*.bak

.PHONY: cleaner
cleaner: clean  ## Remove files and directories that are easily rebuilt
	$(call INFO_MESSAGE, "Remove files and directories that are easily rebuilt")
	rm -frv .cache build dist docs/_build
	rm -frv **/*.pyc **/__pycache__ **/*.egg-info
	rm -frv **/*.orig **/*.rej

.PHONY: cleanest
cleanest: cleaner  ## Remove all files that can be rebuilt
	$(call INFO_MESSAGE, "Remove files and directories that can be rebuilt")
	rm -frv .eggs .tox .venv venv

.PHONY: distclean
distclean: cleanest  ## Remove untracked files and other detritus
	@echo "❌ Remove untracked files and other detritus -- Too dangerous... do this yourself"
	# git clean -df
