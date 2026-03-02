# My Dotfiles

这个仓库管理跨设备可迁移的 shell / 开发环境配置。

## 快速开始（新 Mac）

```bash
git clone https://github.com/gottaegbert/dotfiles.git ~/.dotfiles
~/.dotfiles/scripts/bootstrap.sh
```

`bootstrap.sh` 会自动：
1. 安装基础依赖（Homebrew、oh-my-zsh、powerlevel10k、zinit、nvm、pnpm、bun 等）
2. 软链 `~/.zshrc` 到 `~/.dotfiles/zsh/.zshrc`
3. 初始化 `~/.zshrc.local` 私密配置文件

然后编辑 `~/.zshrc.local` 填入私密环境变量（不会进 Git）。

## 当前结构

- `zsh/.zshrc`: 可公开、可版本化的主配置
- `zsh/.zshrc.local.example`: 私密变量模板
- `scripts/install-macos.sh`: 新机器依赖安装器
- `scripts/bootstrap.sh`: 新机器一键初始化

## 隐私与密钥

- 真实密钥放 `~/.zshrc.local`
- `.gitignore` 已忽略 `*.local`、`.env*`、`secrets/`
- 若历史曾暴露 token，请尽快 rotate

## 兼容你旧的 chezmoi 方案

如果后续要恢复 chezmoi，也可以把当前 `zsh/` 内容迁入 chezmoi 管理，不冲突。
