# My Dotfiles

这个仓库使用 chezmoi 管理跨平台的 dotfiles 配置。

## 目录结构

- `mac/`: macOS 特定的配置文件
  - `.zshrc`: zsh 配置
  - `macos_settings.sh`: macOS 系统设置
- `windows/`: Windows 特定的配置文件
- `shared/`: 所有平台共享的配置文件
- `install/`: 安装脚本
  - `macos.sh`: macOS 环境配置脚本

## 包含的配置

- Shell 配置
  - Oh My Zsh (主题: sunrise)
  - 自定义别名和函数
- 开发环境
  - NVM (Node.js 版本管理)
  - Node.js (LTS 版本)
  - Miniforge (Python 环境，适配 Apple Silicon)
- macOS 系统设置
  - Finder 设置
  - Dock 设置
  - 键盘设置
  - 截图设置

## 新机器设置

### macOS

1. 安装 chezmoi:
```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
```

2. 初始化 dotfiles:
```bash
chezmoi init https://github.com/YOUR_USERNAME/dotfiles.git
```

3. 应用配置:
```bash
chezmoi apply
```

4. 运行安装脚本:
```bash
chmod +x ~/dotfiles/install/macos.sh
~/dotfiles/install/macos.sh
```

5. 应用 macOS 设置:
```bash
chmod +x ~/dotfiles/mac/macos_settings.sh
~/dotfiles/mac/macos_settings.sh
```

### Windows

```powershell
# 安装 chezmoi
winget install twpayne.chezmoi

# 初始化 dotfiles
chezmoi init https://github.com/YOUR_USERNAME/dotfiles.git

# 应用配置
chezmoi apply
```

## 更新配置

在任何机器上，运行以下命令来获取和应用最新的配置：

```bash
chezmoi update
```

## 添加新的配置文件

```bash
# 添加文件到 chezmoi
chezmoi add ~/.config/some-config

# 编辑文件
chezmoi edit ~/.config/some-config

# 应用更改
chezmoi apply

# 提交并推送更改
chezmoi cd
git add .
git commit -m "Add some-config"
git push
```

## 常见问题

### 1. Oh My Zsh 主题没有正确加载
确保在 `.zshrc` 中设置了正确的主题名称：
```bash
ZSH_THEME="sunrise"
```

### 2. Node.js 版本管理
使用 nvm 管理 Node.js 版本：
```bash
nvm install --lts  # 安装最新的 LTS 版本
nvm use --lts      # 使用最新的 LTS 版本
```

### 3. Python 环境
Miniforge 提供了针对 Apple Silicon 优化的 Python 环境：
```bash
conda create -n myenv python=3.9  # 创建新环境
conda activate myenv              # 激活环境
``` 
