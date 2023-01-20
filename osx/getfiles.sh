#!/bin/sh
mkdir -p $DOTFILES_DIR/files/config-nvim
cp ~/.aliases $DOTFILES_DIR/files/aliases
cp ~/.p10k.zsh $DOTFILES_DIR/files/p10k.zsh
cp -r ~/.config/nvim/init.lua ~/.config/nvim/lua $DOTFILES_DIR/files/config-nvim
