Hammerspoon Config
===

在使用电脑的过程中，最优先的操作方式应该是**键盘**，而次等的方式才是鼠标，因为鼠标需要使用者在键盘和鼠标之间来回切换，因此影响效率。而 **“纯键盘操作”** 需要使用者记忆大量的键位和操作模式，所以**纯键盘**从来都是高阶操作。

鼠标长久以来都是顺应人的本能去设计的。但高阶操作是什么？高阶操作就是训练人克服本能，用**更有效**、**更科学**的但**非本能**的方式去应对，所以才需要大量的练习，大量的实战，从而形成肌肉记忆和思维定势去对抗本能。vim 如此,Hammerspoon 也如此。

有些了解过 Hammerspoon 可能把它看作一款窗口管理工具，用此来替代 Magent 等付费工具，但 Hammerspoon 的玩法绝不仅于此。

## Hammerspoon介绍

> [Hammerspoon](https://github.com/Hammerspoon/hammerspoon) 是一款**免费开源**的 app，通过桥接操作系统与 Lua 脚本引擎的方式，让我们可以通过编写 [Lua](http://www.lua.org/docs.html) 代码来实现操作应用程序、窗口、鼠标、文本、音频设备、电池、屏幕、剪切板、定位、wifi等。基本囊括了系统的各方面。

## 功能实现

本配置基于 vim 风格，实现了窗口管理，剪切板，倒计时，快速启动等功能。所有模式按照指定快捷键进入，所有模式都可以用 `esc` 或 `q`退出。在进入对应模式之前只有模式快捷键生效，进入对应模式之后此模式的操作快捷键生效。

**注：所有模式按 `esc` 和 `q` 退出。**

### 帮助面板

按下快捷键 `shift` + `option` + `/` 显示帮助面板查看各个模式快捷键。再按下对应快捷键切换模式。

### 窗口管理模式

按下前缀键 `Option` + `R` 进入窗口管理模式：

- 使用 `h、j、k、l` 移动为上下左右的半屏
- 使用 `y、u、i、o`（即 hjkl 上方按键）移动为左上/左下/右上/右下的四分之一窗口
- 使用 `c` 居中，按下 `=、-` 进行窗口大小缩放
- 使用 `w、s、a、d` 向上下左右移动窗口
- 使用 `H、J、K、L` 向左/下增减窗口大小
- 使用方向键 `上、下、左、右` 移动到相应方向上的显示器（多块显示器的话）
- 使用 `[,]` 左三分之二屏和右三分之二屏
- 使用 `space` 将窗口投送到另外一块屏幕（假如有两块以上显示器的话）
- 使用 `t` 光标移动到所在窗口的中间位置
- 使用 `tab` 显示帮助面板，查看键位图
- 使用 `G` 左三分之二居中分屏
- 使用 `Z` 展示显示
- 使用 `V` 编程显示
- 使用 `t` 将光标移至所在窗口的中心位置
- 使用 `X` 三分之一居中分屏

注：如设置程序坞自动隐藏请修改  `~/.hammerspoon/Spoons/WinWin.spoon/init.lua.bak` 为`init.lua`

### 应用快速切换

按下前缀键 `Option` + `tab` 显示窗口提示，按下对应应用显示的字母快速切换。

### KSheet - 展示应用快捷键

按下快捷键 `Option` + `s` 展示当前应用快捷键，按 `q` 或者 `esc` 退出。

### 快速启动

按下快捷键 `Option` + `a` 打开快速启动，按下对应字母快速打开应用。

### AClock - 显示当前时间

按下 `Option` + `t` 显示当前时间。

### 倒计时（番茄钟）

按下 `Option` + `i` 打开倒计时面板，按下对应数字开始计时。

- 使用 `空格` 可暂停/恢复倒计时。

### clipshowM 剪切板

按下 `Option` + `c` 打开剪切板面板。

功能：

- 保存会话
- 恢复上一个会话
- 在浏览器中打开
- 使用百度搜索
- 使用谷歌搜索
- 保存到桌面
- 使用 github 搜索
- 在 Sublime Text 打开

### 顶部实时显示网速

没有模式快捷键，默认开启。

## 自定义配置

按照注释编辑私有配置文件 `~/.hammerspoon/private/config.lua` 即可。

```bash
vim ~/.hammerspoon/private/config.lua
```

#### 可自定义范围

- 指定要启用模块
- 找到配置文件启用模块，注释对应模块可禁止用对应功能。
- 绑定快速启动 app 及快捷键
- 自定义模式快捷键
- 自定义 hammerspoon 快捷键绑定

## 参考

- [Hammerspoon doc](https://www.hammerspoon.org/go/)
- [Hammerspoon Spoons](https://www.hammerspoon.org/Spoons/)
- [awesome-hammerspoon](https://github.com/ashfinal/awesome-hammerspoon)
- [hammerspoon_config](https://github.com/zuorn/hammerspoon_config)
- [sugood hammerspoon](https://github.com/sugood/hammerspoon)
- [hammerspoon-kuranado](https://github.com/KURANADO2/hammerspoon-kuranado)
