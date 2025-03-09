#!/bin/bash

echo "Configuring macOS settings..."

# # 输入设置
# echo "Configuring input settings..."
# # 按键重复速度（越小越快）
# defaults write NSGlobalDomain KeyRepeat -int 2
# # 按键重复前的延迟（越小越快）
# defaults write NSGlobalDomain InitialKeyRepeat -int 15
# # 禁用自动纠正拼写
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# # 禁用智能引号
# defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# # 禁用智能破折号
# defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Finder 设置
echo "Configuring Finder settings..."
# 显示所有文件扩展名
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# 显示隐藏文件
defaults write com.apple.finder AppleShowAllFiles YES
# 显示状态栏
defaults write com.apple.finder ShowStatusBar -bool true
# 显示路径栏
defaults write com.apple.finder ShowPathbar -bool true
# 设置默认查看方式为列表
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# 搜索当前文件夹
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# 禁用文件预览动画
defaults write com.apple.finder DisableAllAnimations -bool true

# Dock 设置
echo "Configuring Dock settings..."
# 自动隐藏和显示
defaults write com.apple.dock autohide -bool true
# 自动隐藏和显示的延迟
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.5
# 最小化窗口效果
defaults write com.apple.dock mineffect -string "scale"
# # 不显示最近使用的应用程序
# defaults write com.apple.dock show-recents -bool false
# 调整图标大小
defaults write com.apple.dock tilesize -int 36

# Mission Control 设置
echo "Configuring Mission Control settings..."
# 禁用自动重新排列空间
defaults write com.apple.dock mru-spaces -bool false
# 设置热角
# 左上角：Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
# 右上角：桌面
defaults write com.apple.dock wvous-tr-corner -int 4

# 截图设置
echo "Configuring Screenshot settings..."
# 创建截图文件夹
mkdir -p ~/Pictures/Screenshots
# 修改默认保存位置
defaults write com.apple.screencapture location ~/Pictures/Screenshots
# 修改默认文件名前缀
defaults write com.apple.screencapture name "Screenshot"
# 禁用截图阴影
defaults write com.apple.screencapture disable-shadow -bool true

# # 截图快捷键设置
# echo "Configuring Screenshot shortcuts..."
# # 全屏截图 (Command-Shift-3)
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 28 "{ enabled = 1; value = { parameters = (65535, 20, 8388608); type = 'standard'; }; }"
# # 选区截图 (Command-Shift-4)
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 29 "{ enabled = 1; value = { parameters = (65535, 21, 8388608); type = 'standard'; }; }"
# # 窗口截图 (Command-Shift-4 then Space)
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 30 "{ enabled = 1; value = { parameters = (65535, 21, 8388608); type = 'standard'; }; }"
# # 录制全屏 (Command-Shift-5)
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 31 "{ enabled = 1; value = { parameters = (65535, 23, 8388608); type = 'standard'; }; }"

# # 安全性设置
echo "Configuring Security settings..."
# 要求密码唤醒
defaults write com.apple.screensaver askForPassword -int 0
# 密码延迟时间（0秒）
defaults write com.apple.screensaver askForPasswordDelay -int 0

# 触控板设置
echo "Configuring Trackpad settings..."
# 启用轻点点击
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# 启用三指拖动
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# 菜单栏设置
echo "Configuring Menu Bar settings..."
# 显示电池百分比
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# 显示蓝牙图标
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.bluetooth" -bool true

# 声音设置
echo "Configuring Sound settings..."
# 禁用开机声音
sudo defaults write com.apple.loginwindow LoginHook -string "osascript -e 'set volume with output muted'"

# 重启相关服务以应用更改
echo "Restarting system services..."
killall Finder
killall Dock
killall SystemUIServer

echo "macOS settings have been updated. Some changes may require a logout/restart to take effect." 
