#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/.dotfiles"

if [[ -x "$DOTFILES_DIR/scripts/install-macos.sh" && "$(uname -s)" == "Darwin" ]]; then
  "$DOTFILES_DIR/scripts/install-macos.sh"
fi

ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
[ -f "$HOME/.zshrc.local" ] || cp "$DOTFILES_DIR/zsh/.zshrc.local.example" "$HOME/.zshrc.local"

echo "✅ Dotfiles bootstrap complete."
echo "Next: edit ~/.zshrc.local for private tokens, then run: exec zsh"
