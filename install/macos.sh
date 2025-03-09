#!/bin/bash

# 安装 Homebrew（如果没有）
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 安装基本工具
brew install git curl wget

# 安装 oh-my-zsh（如果没有）
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# 安装 nvm（如果没有）
if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
    
    # 添加 NVM 配置到 .zshrc
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.zshrc
    
    # 载入 NVM
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    
    # 安装最新的 LTS 版本的 Node.js
    nvm install --lts
    nvm use --lts
fi

# 安装 Miniforge（如果没有）
if [ ! -d "$HOME/miniforge3" ]; then
    echo "Installing Miniforge..."
    curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
    bash Miniforge3-$(uname)-$(uname -m).sh -b
    rm Miniforge3-$(uname)-$(uname -m).sh
    
    # 初始化 conda
    ~/miniforge3/bin/conda init zsh
fi

# macOS 系统设置
# 显示隐藏文件
defaults write com.apple.finder AppleShowAllFiles YES

# 显示所有文件扩展名
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Dock 设置
# 自动隐藏和显示 Dock
defaults write com.apple.dock autohide -bool true

# 最小化窗口效果
defaults write com.apple.dock mineffect -string "scale"

# 重启 Finder 和 Dock 以应用更改
killall Finder
killall Dock

echo "Installation complete! Please restart your terminal." 
