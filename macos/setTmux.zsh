#!/usr/bin/env zsh
set -euo pipefail

# echo "Installing tmux plugin manager"
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing tmux.conf"
install -m 0644 ./src/tmux.conf ~/.tmux.conf

tmux source ~/.tmux.conf

echo "Done. Start tmux and hit <prefix> + I to install plugins"
