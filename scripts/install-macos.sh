#!/usr/bin/env bash
set -euo pipefail

log() { printf "\033[1;34m[dotfiles]\033[0m %s\n" "$*"; }

if [[ "$(uname -s)" != "Darwin" ]]; then
  log "This installer is for macOS only."
  exit 1
fi

# 1) Homebrew
if ! command -v brew >/dev/null 2>&1; then
  log "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
else
  log "Homebrew already installed."
fi

# 2) Core tools
log "Installing core packages..."
brew update
brew install git zsh wget curl zinit powerlevel10k nvm pnpm bun neofetch || true

# 3) Oh My Zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  log "Installing Oh My Zsh..."
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  log "Oh My Zsh already installed."
fi

# 4) Powerlevel10k (repo fallback in case brew theme path is missing)
if [[ ! -d "$HOME/powerlevel10k" ]]; then
  log "Installing Powerlevel10k repo copy..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/powerlevel10k" || true
else
  log "Powerlevel10k repo already exists."
fi

# 5) Nerd Font hint
log "Optional: install MesloLGS NF for proper Powerlevel10k glyphs."
log "e.g. brew install --cask font-meslo-lg-nerd-font"

log "Dependency setup finished."
