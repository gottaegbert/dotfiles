#!/usr/bin/env bash
set -e
ln -sf "$HOME/.dotfiles/zsh/.zshrc" "$HOME/.zshrc"
[ -f "$HOME/.zshrc.local" ] || cp "$HOME/.dotfiles/zsh/.zshrc.local.example" "$HOME/.zshrc.local"
echo "Done. Edit ~/.zshrc.local for secrets."
