#!/usr/bin/env bash

set -euo pipefail
shopt -s nullglob

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
CONFIG_DIR="$HOME/.config"

err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

copy() {

  local source="$1"
  local target="$2"
  local name="$3"

  if [[ -e "$target" ]]; then

    read -p "$name already exists. Replace? [y/N]: " -n 1 -r
    echo

    if [[ $REPLY == "y" || $REPLY == "Y" ]]; then

      rm -fr "$target"
      echo "Removed ($target)"

    else

      echo "Skipped ($name)"
      return
    
    fi

  fi

  cp -r "$source" "$target"
  echo "Copied ($source --> $target)"
  
}

if [[ $OSTYPE == "linux"* ]]; then

  ALIASES_TARGET="$HOME/.bash_aliases"
  ALIASES_FILE="$SCRIPT_DIR/bash_aliases.txt"

elif [[ $OSTYPE == "darwin"* ]]; then

  ALIASES_TARGET="$HOME/.zsh_aliases"
  ALIASES_FILE="$SCRIPT_DIR/zsh_aliases.txt"

else

  err "Unsupported OS ($OSTYPE)"
  exit 1

fi

# Copy alias file
copy "$ALIASES_FILE" "$ALIASES_TARGET" "$(basename "$ALIASES_FILE")"

# Create .config if not already there.
mkdir -p "$CONFIG_DIR"

for item in "$SCRIPT_DIR"/config/*; do
  
  target_name=$(basename "$item")

  copy "$item" "${CONFIG_DIR:?}/${target_name:?}" "$target_name"

done

echo "Setup complete"