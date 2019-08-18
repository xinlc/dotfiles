## 安装软件

### [brew](https://brew.sh/)
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### brew 清单
```bash
# neovim
# python
# watchman
# autojump
# node
# readline
# wget
# automake
# maven
# nvm
# sqlite
# wine
# bat
# openssl
# tree
# cocoapods
# yarn
# coreutils
# ios-deploy
# mysql@5.7
# usbmuxd
# zsh-syntax-highlighting
# autoconf
# flow
```

### brew cask 清单
```bash
# android-studio
# blisk
# genymotion
# sequel-pro
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