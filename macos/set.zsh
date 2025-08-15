#!/usr/bin/env zsh
set -euo pipefail

OMZ_DIR="${ZSH:-$HOME/.oh-my-zsh}"
ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$OMZ_DIR/custom}"

echo "Using ZSH_CUSTOM: $ZSH_CUSTOM_DIR"

mkdir -p "$ZSH_CUSTOM_DIR/themes"

install -m 0644 ./src/pizza.zsh-theme "$ZSH_CUSTOM_DIR/themes/pizza.zsh-theme"
install -m 0644 ./src/profile.zsh "$ZSH_CUSTOM_DIR/profile.zsh"
install -m 0644 ./src/aliases.zsh "$ZSH_CUSTOM_DIR/aliases.zsh"

if [[ -f "$HOME/.zshrc" ]]; then
  cp -a "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%Y%m%d%H%M%S)"
fi

install -m 0644 ./src/zshrc "$HOME/.zshrc"

echo "Done. Restart your shell or: exec zsh"
