Ranger 配置
===

Ranger 是一个 vi 键位风格的控制台文件管理器。如果熟悉 vi/vim 的话，使用起来非常酸爽。

## 安装

通过 brew 安装 ranger

```bash
brew install ranger
```

## 配置

生成配置文件（仅第一次使用）

```bash
ranger --copy-config=all
```

将会在~/.config/ranger目录输出以下文件

- rc.conf - 选项设置和快捷键
- commands.py - 可以通过 `：` 执行的命令
- rifle.conf - 文件关联（用于打开文件的程序）
- scope.sh - 负责各种文件预览

## 基本用法

在 终端 执行 `ranger` 来启动 ranger

- ？ 打开帮助手册或列出快捷键、命令以及设置项
- l ，renurn 打开文件
- j，k 上下选择当前目录中的文件
- h 切换到上层目录
- [] 上层目录上移和下移
- yy , dd 复制，粘贴

知道这些基本的操作就可以直接上手了，然后可根据官方文档及说明文档来配置适合自己的操作。

## 安装插件

```bash
# 图标
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

```

## 其他配置

- 启动图片预览  

在 ~/.config/ranger/rc.conf 添加(如果你用 iterm2 的话)

```bash
set preview_images true
set preview_images_method w3m
set preview_images_method iterm2
```

- 显示文件夹图标

在 ~/.config/ranger/rc.conf 添加以下内容：

```bash
default_linemode devicons
```

## 参考

- 自定义键位绑定：https://github.com/ranger/ranger/wiki/Keybindings
- 参考官方文档： https://github.com/ranger/ranger/wiki/Official-User-Guide
- https://github.com/ranger/ranger/wiki/Plugins
- https://github.com/theniceboy/.config/tree/master/ranger
