## 安装软件

### [brew](https://brew.sh/)

```bash
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/leoxin/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)
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
# coreutils  - greadlink 需要
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
# go2shell https://zipzapmac.com/go2shell
# another-redis-desktop-manager https://github.com/qishibo/AnotherRedisDesktopManager
```

## 安装 zsh

- [iterm2](https://www.iterm2.com/downloads.html)

```bash
brew install zsh

zsh --version

# 将zsh设置为默认的Shell。
chsh -s /bin/zsh
```

### oh my zsh 配置

```bash
# 安装 on my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 安装 PowerLine
# sudo easy_install pip
pip install powerline-status --user

# 安装 PowerFonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh

# 安装配色方案(新版iTerm2 已经默认安装)
# cd solarized/iterm2-colors-solarized/
# open .
# 在打开的finder窗口中，双击Solarized Dark.itermcolors和Solarized Light.itermcolors即可安装明暗两种配色

# 安装 agnoster 主题（已自带）
# git clone https://github.com/fcamblor/oh-my-zsh-agnoster-fcamblor.git
# cd oh-my-zsh-agnoster-fcamblor/
# ./install

# 安装插件
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# 卸载
uninstall_oh_my_zsh
```

### java8

```bash
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk8
```

## Mac升级bash到最新版本

由于bash3.2不支持关联数组，需要升级到bash4

mac自带的bash为3.2版本，而最新的bash是4.9，需要升级了，才能支持关联数组等新特性。

1. brew install bash
2. 安装到/usr/local/bin/bash里面。可以通过修改/etc/shells文件，来完成开机使用新版本的bash，或者修改环境变量（PATH）让 /usr/local/bin提前。
3. 但是，无法改变/bin/bash的版本，这里仍旧为3.2版本，这给使用脚本带来不便，因为默认都是#!/bin/bash
4. 细查后，发现原来mac系统禁止更改系统目录的权限，引入sip机制，需要先关闭，修改，再打开这一系列操作。
5. 下面是打开和关闭sip的步骤：
  - (1)重启OSX系统，然后按住Command+R
  - (2)出现界面之后，选择Utilities menu中Terminal
  - (3)在Terminal中输入csrutil disable关闭SIP(csrutil enable打开SIP)
  - (4)重启reboot OSX

6. 关闭sip后，加入软连接，在打开sip

```bash
# 这时候有两个 bash, 在PATH变量中，新版本（/usr/local/bin）的目录优先于旧版本（/bin），所以现在再检测Bash版本时就显示已是新版
which -a bash

sudo mv /bin/bash /bin/bash3.2
sudo ln -s /usr/local/bin/bash /bin/bash

# 由于 macOS 下的 sh 并不是直接链接 bash，而是 bash 的一个文件拷贝。所以还要替换默认的 sh 指向的命令为 bash，如下：
sudo mv /bin/sh /bin/sh.origin
sudo ln -s /usr/local/opt/bash/bin/bash /bin/sh
```

7. UNIX包含一个安全功能，该功能将可用作登录shell的shell（即登录到系统后使用的shell）限制为“受信任”shell列表。这些shell列在/etc/shells文件。

要将新安装的 Bash shell 设置成默认shell，它必须能够作为登录shell。将其添加到/etc/shells文件。以root用户身份编辑此文件：

```bash
$ sudo vim /etc/shells
/bin/bash
/bin/csh
/bin/ksh
/bin/sh
/bin/tcsh
/bin/zsh
/usr/local/bin/bash
```

现在如果打开一个新终端窗口，仍然会使用Bash 3.2。这是因为/bin/bash仍然是默认shell。修改成新shell，执行以下命令：

```bash
$ chsh -s /usr/local/bin/bash

# chsh命令仅修改当前用户的默认shell。如果想修改root用户，执行以下操作：这样当使用 sudo su ，以root用户身份打开shell时，也将使用新版Bash。
$ sudo chsh -s /usr/local/bin/bash
```
