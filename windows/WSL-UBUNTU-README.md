## win10 安装 Ubuntu 子系统

## 启动 WSL

1. 启动开发者模式:

设置——>更新和安全——>开发者选项——>开发人员模式

2. 打开windows下的Linux子系统

控制面板——>程序和功能——>启用或关闭Windows功能——>适用于Linux的Windows子系统——>确定——>重启(开机可能需要长时间，耐心等待即可）

3. 下载并安装Ubuntu

在应用商店中搜索Ubuntu，选择Ubuntu 18.04 LTS长期支持版，点击获取进行下载及安装，安装完毕点击启动会打开bash命令行提示我们设置用户名（常用的不具有root权限的用户）和密码。这样我们就拥有了Ubuntu子系统。
子系统所在目录为：C:\Users\【你的windows用户名】\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs

## Ubuntu安装后的一些配置

### 修改软件源

Ubuntu软件源的源列表文件位于 /etc/apt/sources.list

首先，备份原来的数据源配置文件：

```bash
sudo cp /etc/apt/sources.list /etc/apt/sources.list_backup
```

修改数据源配置文件

```bash
sudo vim /etc/apt/sources.list
```

建议，更改为阿里镜像源。

用 vim 编辑/etc/apt/sources.list 文件，可以用下面命令快捷的修改字符：

```bash
:%s/http:\/\/archive.ubuntu.com/https:\/\/mirrors.aliyun.com/
```
 

最后，更新配置：

```bash
sudo apt update

sudo apt upgrade
```

### 配置Ubuntu子系统图形桌面

安装WSL之后，Linux是没有形界面的。

```bash
# 安装 xrdp、xfce4
sudo apt install xorg

sudo apt-get install xfce4

sudo apt-get install xrdp

# 说明，xrdp是一个轻量级ubuntu桌面，里面的应用只能满足基本需求，但够用了。
```

配置xrdp 

```bash
# 设置使用3390端口，
sudo sed -i 's/port=3389/port=3390/g' /etc/xrdp/xrdp.ini

# 向xsession中写入xfce4-session
sudo echo xfce4-session >~/.xsession

# 重启xrdp服务：
sudo service xrdp restart
```

连接远程桌面

在windows10，启动远程桌面连接(运行命令：`mstsc`。点击显示选项，填入本机IP（本地IP默认是127.0.0.1），输入登录用户，点击连接。输入密码，确定即可连接。


> 注意，如果WSL的Ubuntu系统关闭，如关机重启，会导致远程连接不上，此时需要先在Win10中打开Ubuntu的命令行界面，输入：`sudo service xrdp restart` 此时再远程连接，即可连接上。

```bash
# 安装常用软件

sudo apt install make g++

sudo apt install perl-doc

sudo apt install tree
 
# 清理无用的软件

# 清理旧版本的软件缓存
sudo apt-get autoclean

# 清理所有软件缓存
sudo apt-get clean

# 删除系统不再使用的孤立软件
sudo apt-get autoremove
```

## 命令

```cmd
wslconfig 在适用于 Linux 的 Windows 子系统上执行管理操作

用法:
    /l, /list [Option]
        列出已注册的分发。
        /all - 可选择列出所有分发，包括当前正在
               安装或卸载的分发。

        /running - 只列出当前正在运行的分发。

    /s, /setdefault <DistributionName>
        将分发设置为默认值。

    /t, /terminate <DistributionName>
        终止分发。

    /u, /unregister <DistributionName>
        注销分发。


当我们运行WSL时，它会用第一次运行时输入的用户名登陆，如果想改为其他用户，可以（以ubuntu为例）：
ubuntu config --default-user root

这样，以后再运行ubuntu它就会默认以root登陆。此外还可以“ubuntu /?”查看其更多使用方法。
```

## 参考

- [适用于 Linux 的 Windows 子系统安装指南 (Windows 10)](https://docs.microsoft.com/zh-cn/windows/wsl/install-win10)
- [手动下载适用于 Linux 的 Windows 子系统发行版包](https://docs.microsoft.com/zh-cn/windows/wsl/install-manual)
- [【WSL+Docker】新手Win10下的WSL Ubuntu18并使用Docker（两种方式）](https://zhuanlan.zhihu.com/p/61542198/)
