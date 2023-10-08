#!/bin/bash

set -eu

export brew_bin=$([[ -d "/opt/homebrew/bin" ]] && echo "/opt/homebrew/bin" || echo "/usr/local/bin")
export sed=${brew_bin}/gsed
