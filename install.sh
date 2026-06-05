#!/usr/bin/env bash
set -euo pipefail

curl -fsSL https://hostess.sh/install.sh | bash

if ! command -v hostess >/dev/null 2>&1; then
  if [ -x "$HOME/.local/bin/hostess" ]; then
    echo "$HOME/.local/bin" >> "$GITHUB_PATH"
    export PATH="$HOME/.local/bin:$PATH"
  else
    echo "hostess was installed, but could not be found on PATH" >&2
    exit 1
  fi
fi

hostess --version
