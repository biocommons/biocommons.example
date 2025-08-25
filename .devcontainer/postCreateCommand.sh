#! /usr/bin/env bash

sudo apt-get update && \
    sudo xargs apt-get install -y --no-install-recommends < .devcontainer/packages.txt
    
curl -LsSf https://astral.sh/uv/install.sh | sh

uv sync

uvx pre-commit install --install-hooks
