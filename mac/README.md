## 安装软件

### [brew](https://brew.sh/)
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### brew 清单
```bash
# neovim - 代替 vim
# autojump - 告别又臭又长的路径名，一键直达任何目录
# nvm - node 多版本管理
# bat - 带有语法高亮和Git集成的 cat(1) 克隆
# yarn - node 包管理工具比npm好用，更快
# tmux - 一个优秀的终端复用器类自由软件
# mycli - 为 MySQL 命令行客户端，提供语法高亮和提示功能的工具！
# zsh-syntax-highlighting
# watchman - 监控文件变化 for RN
# python
# node
# readline
# wget
# automake
# maven
# sqlite
# wine
# openssl
# tree
# cocoapods
# coreutils
# ios-deploy
# mysql@5.7
# usbmuxd
# autoconf
# flow
# ctop - https://github.com/bcicen/ctop
```

### brew cask 清单
```bash
# android-studio
# blisk
# genymotion
# sequel-pro
# tableplus
# mysql-workbench
# sourcetree
# virtualbox
# clipy
# Alfred
# AirDroid
# Charles
# Dash
# CheatSheet
# Flux
# IINA
# Franz
# IntelliJ IDEA
# iTerm2
# Keyboard Maestro
# Docker
# Kitematic
# LICEcap
# pap.er
# Postman
# WPS Office
# TeamViewer
# zoom.us
# Cakebrew
# hyper
# contexts https://contexts.co/
# typora https://www.typora.io
# f.lux https://justgetflux.com
# aText https://www.trankynam.com/atext/
# switchhosts
```

## zsh
- [iterm2](https://www.iterm2.com/downloads.html)

```bash
brew install zsh

zsh --version

# 将zsh设置为默认的Shell。
chsh -s /bin/zsh
```

### oh my zsh
```bash
# 安装
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# 卸载
uninstall_oh_my_zsh
```

### java8
```bash
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk8
```