#!/usr/bin/env zsh
set -euo pipefail

OMZ_DIR="${ZSH:-$HOME/.oh-my-zsh}"
ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$OMZ_DIR/custom}"

echo "Using ZSH_CUSTOM: $ZSH_CUSTOM_DIR"

mkdir -p "$ZSH_CUSTOM_DIR/themes"

echo "Installing 🍕"
install -m 0644 ./src/pizza.zsh-theme "$ZSH_CUSTOM_DIR/themes/pizza.zsh-theme"
echo "Installing profile"
install -m 0644 ./src/profile.zsh "$ZSH_CUSTOM_DIR/profile.zsh"
echo "Installing aliases"
install -m 0644 ./src/aliases.zsh "$ZSH_CUSTOM_DIR/aliases.zsh"

BACKUP="$HOME/.zshrc.bak.$(date +%Y%m%d%H%M%S)"

echo "Backing up zshrc to BACKUP"

if [[ -f "$HOME/.zshrc" ]]; then
  cp -a "$HOME/.zshrc" "$BACKUP"
fi

echo "Installing zshrc"
install -m 0644 ./src/zshrc "$HOME/.zshrc"

echo "Reloading"
source ~/.zshrc
