#!/usr/bin/env zsh
set -euo pipefail

OMZ_DIR="${ZSH:-$HOME/.oh-my-zsh}"
ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$OMZ_DIR/custom}"

echo "Using ZSH_CUSTOM: $ZSH_CUSTOM_DIR"

mkdir -p "$ZSH_CUSTOM_DIR/themes"

install -m 0644 ./src/pizza.zsh-theme "$ZSH_CUSTOM_DIR/themes/pizza.zsh-theme"
install -m 0644 ./src/profile.zsh "$ZSH_CUSTOM_DIR/profile.zsh"
install -m 0644 ./src/aliases.zsh "$ZSH_CUSTOM_DIR/aliases.zsh"

BACKUP="$HOME/.zshrc.bak.$(date +%Y%m%d%H%M%S)"

echo "Backing up zshrc to BACKUP"

if [[ -f "$HOME/.zshrc" ]]; then
  cp -a "$HOME/.zshrc" "$BACKUP"
fi

install -m 0644 ./src/zshrc "$HOME/.zshrc"

echo "Installing Brewfile"
brew bundle --file=./src/Brewfile

echo "cloning nvim config"
NVIM_DIR="$HOME/.config/nvim"
echo "$NVIM_DIR"
if [[ -e NVIM_DIR ]]; then
  echo "$NVIM_DIR already exists, delete? (y/n)"
  read DEL_INPUT
  if [ "$DEL_INPUT" == "y" ] || [ "$DEL_INPUT" == "Y" ]]; then
    rm -r NVIM_DIR
    git clone git@github.com:Ryan-McBride/nvim-config.git NVIM_DIR
  fi
else
  echo "nope"
fi

echo "installing nvm"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

echo "Installing iTerm2 theme (set the font to Hack-NFM 12pt while you're over there)"
open ./src/Dracula.itermcolors

echo "Installing karabiner elements JSON (not sure if installing karabiner after these steps overwrites anything but probably not)"
mkdir -p ~/.config/karabiner
cp ./src/karabiner.json ~/.config/karabiner/karabiner.json

echo "Done. Restart your shell or: exec zsh"
