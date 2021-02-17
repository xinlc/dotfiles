
## 我的常用软件

- [Awesome Mac](https://github.com/jaywcjlove/awesome-mac) - 作为一名程序员你应该知道 **Awesome**
- [MacWk](https://www.macwk.com) - 只提供精品Mac应用
- [少数派](https://sspai.com) - 软件资讯

### 系统工具

- [腾讯柠檬](https://lemon.qq.com) - mac系统优化清理工具
- [uTools](https://u.tools) - 生产力工具集
- [Alfred 4](https://www.alfredapp.com) - 本地搜索及应用快速启动
- [AltTab](https://github.com/lwouis/alt-tab-macos?source=https://macwk.com/soft/alttab) - 模拟 Windows Alt+Tab。建议快捷键设置成 Command+tab 代替系统默认 cmd+tab
- [Bartender 4](https://www.macbartender.com/Bartender4/) - 方便的管理菜单栏图标
- [Cakebrew](https://github.com/brunophilipe/Cakebrew) - Homebrew GUI
- [CheatSheet](https://www.mediaatelier.com/GrandTotal7/) - 快速查看mac应用快捷键
- [Clipy](https://github.com/Clipy/Clipy) - 历史剪切板。现在用的 Alfred 带的剪切板功能。
- [Flux](https://justgetflux.com) - f.lux 护眼神器
- [Logi Options](https://support.logi.com/hc/zh-cn/articles/360025297893) - Logitech Options 逻辑大师鼠标
- [Go2Shell](https://zipzapmac.com/go2shell) - 在当前目录打开终端
- [Thor](https://github.com/gbammc/Thor) - 快捷键打开应用 和 Manico 类似 (App Store)
- [PopClip](https://pilotmoon.com/popclip/) - 划词扩展工具 (App Store)
- Xnip - 最好用的mac长截图/截图工具 (App Store)
- Yoink - 一款移动复制文件效率工具 (App Store)
- Magnet - mac窗口整理神器 (App Store)
- Manico - 应用启动和切换工具 (App Store)
- The Unarchiver - 解压神器 (App Store)
- 超级右键 专业版 - 增强右键功能 (App Store)
- HazeOver - 提升工作专注力神器 (App Store)
- Dynamic Wallpaper - 动态壁纸 (App Store)

### 应用软件

- [V2rayU](https://github.com/yanue/V2rayU) - 科学上网，哎！通往世界的大门
- [网易云音乐](https://music.163.com/#/download) - 音乐
- [网易有道词典](http://cidian.youdao.com/index-mac.html) - 词典
- [百度网盘](https://pan.baidu.com/download#pan) - 网盘
- [钉钉](https://page.dingtalk.com/wow/dingtalk/act/download) - 企业办公工具
- [Bob](https://github.com/ripperhe/Bob) - 划词翻译和截图翻译工具
- [Chrome](https://www.google.cn/chrome/) - 最好用的浏览器没有之一
- [Firefox](http://www.firefox.com.cn) - 信仰浏览器
- [WPS Office](https://www.wps.cn) - 办公套件
- [XMind](https://www.xmind.cn) - 脑图神器
- [IINA](https://github.com/iina/iina) - 全能播放器
- Microsoft OneNote - 云笔记 (App Store)
- QQ - 童年生活方式 (App Store)
- 微信 - 一个生活方式 (App Store)

### 图形设计

- [drawio](https://github.com/jgraph/drawio-desktop) - 画图神器
- [ProcessOn](https://www.processon.com) - 国内版 Draw.io
- [OmniGraffle](https://www.omnigroup.com/omnigraffle/) - 画图神器
- [PDMan](https://gitee.com/robergroup/pdman) - 国产数据库建模工具
- [Sketch](https://www.sketch.com) - 最好用的矢量绘图软件
- [Photoshop](https://www.adobe.com/cn/products/photoshop.html) - 使用最多的图片处理工具

### 编程开发

- [iTerm2](https://github.com/gnachman/iTerm2) - 终端神器
- [SwitchHosts](https://github.com/oldj/SwitchHosts) - hosts 修改工具
- [Another Redis Desktop Manager](https://github.com/qishibo/AnotherRedisDesktopManager) - Redis 客户端
- [MySQL Workbench](https://dev.mysql.com/downloads/workbench/) - MySQL 官方客户端
- [Navicat Premium](http://www.navicat.com.cn) - 强大的数据库管理工具
- [Postman](https://www.postman.com/downloads/) - Api 调试神器
- [JMeter](http://jmeter.apache.org/download_jmeter.cgi) - 压测工具
- [Typora](https://www.typora.io) - 最好用的 Markdown 编辑器没有之一
- [Visual Studio Code](https://code.visualstudio.com) - 全能代码编辑器
- [IntelliJ IDEA](https://www.jetbrains.com/idea/) - java 开发集成环境
- [Android Studio](https://developer.android.com/studio) - Android 开发集成环境
- [Docker](https://www.docker.com/get-started) - 应用容器引擎
- [Charles](https://www.charlesproxy.com) - http抓包神器
- [Dash](https://kapeli.com/dash) - API文档和代码片段管理
- Xcode - 不做IOS开发最好也装，有的软件需要依赖 (App Store)

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
# contexts - https://contexts.co/
# typora - https://www.typora.io
# f.lux - https://justgetflux.com
# aText - https://www.trankynam.com/atext/
# switchhosts - https://github.com/oldj/SwitchHosts
# go2shell - https://zipzapmac.com/go2shell
# another-redis-desktop-manager - https://github.com/qishibo/AnotherRedisDesktopManager
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

## 日历设置

- 新建日历订阅

```bash
# 法定节假日
https://p10-calendars.icloud.com/published/2/MTI3Njk0MTQxNzEyNzY5NFRvxM53AOH-Px17vHeUETlZdUggoyEt2KnFiIqHg40FkRXfcQJjYoa2dULRarI9z4UlbHxK-kLOohfiRVSSP7Q

# 中国法定节假日
https://p22-calendars.icloud.com/published/2/RL1JwQQtKFudYOiicAG_adz9DdrozFeZzv5Uyrs4s3gyWobdzL1NZFH-ZHAsTfuAevtnzdqVdYmcRO_Y_dWtxeIdmzUA1TNkAt5RuotJmsg
```
