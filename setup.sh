#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
CONFIG_DIR="$HOME/.config"

err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
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

if [[ -f $ALIASES_TARGET ]]; then

  read -p "ALIASES_TARGET ($ALIASES_TARGET) already exists. Replace? [y/N]: " -n 1 -r
  echo
  
  if [[ $REPLY == "y" || $REPLY == "Y" ]]; then

    rm -fr "$ALIASES_TARGET"
    echo "Removed ($ALIASES_TARGET)"

    cp "$ALIASES_FILE" "$ALIASES_TARGET"
    echo "Copied ($ALIASES_FILE --> $ALIASES_TARGET)"

  else

    echo "Skipped ($ALIASES_FILE)"

  fi

else

  cp "$ALIASES_FILE" "$ALIASES_TARGET"
  echo "Copied ($ALIASES_FILE --> $ALIASES_TARGET)"

fi

for item in "$SCRIPT_DIR"/config/*; do
  
  target=$(basename "$item")

  if [[ -e $CONFIG_DIR/$target ]]; then
  
    read -p "$target already exists in .config. Replace? [y/N]: " -n 1 -r
    echo

    if [[ $REPLY == "y" || $REPLY == "Y" ]]; then

      rm -fr "${CONFIG_DIR:?}/${target:?}"
      echo "Removed ($CONFIG_DIR/$target)"

      cp -r "$item" "$CONFIG_DIR/$target"
      echo "Copied (./config/$target --> $CONFIG_DIR/$target)"
    
    else

      echo "Skipped (./config/$target)"
    
    fi

  else

    cp -r "$item" "$CONFIG_DIR/$target"
    echo "Copied (./config/$target --> $CONFIG_DIR/$target)"

  fi

done

echo "Setup complete"
exit 0