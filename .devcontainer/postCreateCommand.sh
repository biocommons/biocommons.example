#! /usr/bin/env bash

curl -LsSf https://astral.sh/uv/install.sh | sh
uv sync --link-mode=copy
uv run --link-mode=copy pre-commit install --install-hooks
