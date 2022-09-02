Doom Emacs
===

众所周知，Emacs和Vim都是十分古老且强大的文本编辑器，其中Vim的特点是基于模式的编辑方式、高可自定义性、处理文本效率高、丰富的插件资源和~~丑陋的VimScript~~。而Emacs的特点则是具有超高可定制性、巨多插件资源、由充满魔法的Lisp语言构建和用户~~都得了腱消炎~~等。我们发现双方特点有一定重合，却又都存在一些问题。那么，有没有什么编辑器可以让两者结合使得双剑合璧，天下无敌~~(VSCode用户表示不服)~~呢？

Doom Emacs就是一个Emacs+Vim的产物，其包含了Emacs和Vim的优点，还减少了用户折腾的时间，可以说它就是你用来上网、聊天、游戏、看电影、听音乐、写代码、做笔记、搞科研、学习的工具不二之选了。Doom Emacs是一个Emacs发行版本(配置集合)就像Linux内核和各大发行版的关系，都是在前者的基础上做了超多工作使得一个强大的工具变的更加强大大的超强义体集合。其大部分模块都提供了文档支持，且有上百个贡献者，1.5W Commits，10k+ Star，~~450+ issues~~，提供针对超过近60门编程语言的模块以及各种可提升使用体验的模块可选。下面让我们正式进入Doom Emacs的世界...

## 安装

```bash
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

> 如果安装失败，请多执行几次，确保不是网络的问题，通常来说不会有问题。
> 安装过程中可能会提示你下载 all-the-icons 字体，输入y即可

安装程序的最后阶段会给一大堆提示，其告诉了我们几个重要的操作流程:

1. 在你修改了 `~/.doom.d/init.el` 和 `~/.doom.d/packages.el` 后需要执行 `doom sync`
2. 如果有问题就运行 `doom doctor`
3. 如果需要更新就运行 `doom upgrade`
4. 可以在Emacs内通过 `SPC h d h` 来查看文档

自此Doom Emacs就安装完成了，让我们启动Emacs吧！

通过 `M-x emacs-init-time` ，左下角显示Doom Emacs配置的启动速度仅有0.3s，这个速度十分快了，这得益于Doom Emacs优秀的懒加载技术。

## 介绍Doom Emacs使用方法

在我们使用 `doom install` 命令时，你可能会好奇这个doom是个玩意，是干啥用的？虽然前面提了一嘴但还远远不够解释清除，**doom是个可执行文件，是doom emacs配置独有的**，它被放在 `~/.emacs.d/bin/` 下，你可以通过下面的命令将其链接到 `/usr/bin/` 下以方便在任何目录下使用:

```bash
sudo ln -s ~/.emacs.d/bin/doom /usr/bin/doom
```

通过命令 `doom help` 可以查看其作用，下面列举了所有命令及其解释:

- doom sync 用于同步私有配置和Doom配置。意味着只要你修改了私有配置的包相关的内容，都需要运行此命令，例如你要为私有配置添加了新的包(插件)，或升级/降级了某个包，doom sync会自动为你做好那些安装/降级/编译/链接操作。

- doom upgrade 用于更新Doom配置或更新所有包时，如果你看到doom的最新更新正好解决了你提的issue便可使用此命令让Doom更新为最新版本，又如果你想要升级所有的包(插件)那么你也可以通过此命令进行升级。

- doom doctor 此命令效果是尝试找到Doom出错的问题，通常只能监测出常见的问题，如果你有问题可以先试试这个命令，再去群或者翻issues。

- doom env 基本不用使用，其作用是让doom 的环境变量和你的shell环境变量同步一下，除非你shell环境变量经常变动，否则是几乎不会用到这个功能的。

- doom build 重新编译所有的包(把el文件编译成elc以提高运行速度)。

- doom info 输出doom的相关信息，用来给doom提issue用的。如果你需要提issue，那么你需要将这个命令的输出也贴上去，用于判断是否是环境问题。

- doom clean 这个命令会删除所有的elc文件，执行后你需要使用doom build重新编译它们。

- doom run 从doom可执行文件的父级目录下启动Emacs。我猜测可能是为了解决一些路径问题。

- doom compile 将私有配置和已开启的模块编译成字节码。提高运行效率的。

- doom purge 删除那些已安装，但是没有使用的包，并将其压缩。你有时可能会通过 M-x package-install 来安装包，这样是不太好的，你应该通过后面我说的方法来安装，否则就会出现有些包已安装但却没有使用的情况。

这里不得不提一下 `doom dir` 和 `local dir` ，doom dir是指你的私有配置目录，local dir是指doom及你私有配置的包的缓存目录，它们都可以通过doom命令进行提前设置，启动时指定 `--doomdir` 或 `--localdir` 参数即可。

doom emacs默认是使用vim按键风格的，这是通过包 evil 实现的，也就是说在emacs内可以使用vim这种高效按键设计风格。doom emacs的启动页面叫做dashboard，也是emacs的一个插件，不过doom对其改造了一番，其默认展示了几个在emacs被启动时最有可能被使用的命令，十分的人性化。doom emacs也学习了Spacemacs的理念，大量键绑定都是基于空格键(SPC)定义的，相信使用过SpaceVim或Evan Emacs的同学都知道这个概念，优点是SPC这个键相比于C-c或C-x来说跟好按，且没有什么插件会针对这个键进行绑定，所以很少会出现按键被覆盖的问题。

当你在normal模式下键入SPC后会弹出一个在底部的窗口，这个窗口展示了基于SPC按键下的所有键表，这个功能是由Emacs插件Which-key提供的。

我们看到有两种颜色的可选按键，其中紫色的代表按下后还有一层按键可选，蓝色的代表按下后就会执行按键绑定的命令。

这里以M-x举例，其是一个蓝色按键提示，所以当我们按下 `SPC :` 后就会执行其绑定的命令，想要知道对应的命令可以通过命令 describe-key 进行查看，执行这个命令后你所按下的键会自动找到其对应的命令，再比如 `SPC SPC` 可以从当前Project中查找文件。

另一种紫色的按键提示意味着其是一个前缀键(Prefix-Key)，就像 SPC 键一样包含了很多键，不过SPC键在doom中被称作 主键(leader-Key)。我们按下 f 可以查看和file相关的按键绑定。

doom还有一种特殊的前缀键，叫做局部主键(localleader)，其特殊之处在于，不同模式下局部主键的键表都是不同的，也存在某些模式下是没有这个局部主键的情况。我们可以通过按键 SPC m 查看当前所在模式的局部主键的所有键表，举例我打开了一个ELisp文件，那么Emacs当前的主模式应该就是 elisp-mode ，doom为这个模式定义了一些局部主键。

```bash
d -> +debug
e -> +eval
g -> +goto
m -> Expand macro

SPC m-
```

doom 为elisp-mode根据功能划分提供了一些有用的按键绑定。

**小结:**

- doom的按键风格是vim风，此功能由evil包实现。
- 显示按键提示的功能是由which-key包实现。
- 通过which-key的提示。我们可以将按键提示分为两类，分别是前缀键和键绑定，前缀键可以包含多个键绑定，每个键绑定有对应的函数。
- 前缀键可以分为三种类型，分别是普通(Prefix Key)，主键(leader Key)，局部主键(Local leader Key)。

## 开启Doom Emacs提供的模块

默认情况下doom emacs根据功能类别共提供了150+个可选模块，我们可以按需增加想要的模块，下面会介绍如何开启一个模块。

如果需要修改模块相关的配置，需要打开 `$doom-dir/init.el` 文件，除非你指定了doom-dir的路径否则其默认路径应该是 `~/.doom.d/init.el` 。

可以直接通过快捷键 `SPC h d c` 来跳转至私有配置文件，或通过 `SPC f p` 从私有配置目录内查找指定文件并打开。

打开 init.el 后：

```elisp
;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a link to Doom's Module Index where all
;;      of our modules are listed, including what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

(doom! :input
       ;;bidi              ; (tfel ot) thgir etirw uoy gnipleh
       ;;chinese
       ;;japanese
       ;;layout            ; auie,ctsrnm is the superior home row

...

```

前面几行注释告诉我们可以通过键入 `SPC h d h` 来打开doom emacs的文档，随后找到 "Module Appendix" 链接(SPC m g g 可以跳转至指定标题)，链接指向一个modules.org文件，里面列出了所有的模块以及对模块的简短介绍和模块可用Flag。

下面我们会举例如何配置一个python的开发环境，相信我速度很快，仅需要几步，一个完整，高速的Python环境就能搭建完成。

为了了解有关Python模块更多的内容，我们可以通过键入`SPC h d m`后键入Python来打开Python模块的文档，而不是通过modules.org内的简短信息。打开后文件内容大致如下：

```org
← [[doom-module-index:][Back to module index]]              ↖ [[doom-module-history:lang/python][History]]  ! [[doom-module-issues:::lang python][Issues]]  ± [[doom-suggest-edit:][Suggest edits]]  ? [[doom-help-modules:][Help]]
--------------------------------------------------------------------------------
#+title:    :lang python
#+subtitle: Beautiful is better than ugly
#+created:  June 15, 2015
#+since:    0.7

* Description :unfold:
This module adds [[https://www.python.org/][Python]] support to Doom Emacs.

- Syntax checking ([[doom-package:][flycheck]])
- Snippets
- Run tests ([[doom-package:][nose]], [[doom-package:][pytest]])
- Auto-format (with ~black~, requires [[doom-module:][:editor format]])
- LSP integration (=mspyls=, =pyls=, or =pyright=)

...

```

文档由org-mode驱动，得益于层级关系，我们很轻松的能看到此文档分为4节，分别是描述(Description)、依赖(Prerequisites)、特性(Features)、配置(Configuration)，通常来说，我们仅需了解描述、依赖和特性就够了至于配置的话没有特殊的需求应该是不同理会的。

通过描述说明，我们了解到此模块提供了以下几个针对python的功能:

1. 语法检查 由flycheck提供
2. 代码片段
3. 测试运行 由nose或pytest提供
4. 自动格式化 由black提供 依赖于:editor format 模块
5. LSP集成 (三个server可选 mspyls, pyls 或 pyright)

找到Module Flags标题，里面展示了此模块所支持的所有Flag，Flag你可以理解成针对这个模块的扩展，例如 LSP Flag就使得Python模块提供LSP支持，而pyright Flag就使得LSP服务器使用pyright实现。

再后面的Packages(Plugins)标题说明了这个模块所有使用到的插件，并且还简单列出了关系。

再往后看到 依赖 Installation (Prerequisites) 标题，这里说明了需要安装哪些外部工具。

这个例子中，我们仅为Python模块开启LSP和pyright Flag 所以我们仅需要处理关于 格式化(format)和pyimport(自动导入包用)和py-isort(处理python包的导入顺序)以及LSP相关的支持，

下面我们需要打开 init.el  `:editor` 下的 format模块，并且打开`LSP模块`和`python模块`，并且为python模块添加LSP和pyright Flag。

```elisp
       :editor
       ...
       (format +onsave)  ; automated prettiness
       ...

      :tools
       lsp               ; M-x vscode

      :lang
       (python
        +lsp
        +pyright)            ; beautiful is better than ugly

```

现在我们以及修改了init.el文件，下面回到Python模块的文档，将我们所需的依赖安装完成。

执行如下命令进行安装:

```bash
pip install pytest nose black pyflakes isort 
```

使用npm来安装pyright

```bash
npm install -g pyright
```

将所有依赖都安装完毕后，你便可以执行 `doom sync`，其会自动安装新增模块所需的包，并启用。

此时我们重启Emacs，即可体验Doom Emacs提供的Python模块了。

## 自定义Doom Emacs模块

虽说Doom Emacs默认提供的模块已经很强大了，但我相信你总是会有自己的私有配置的，下面这个例子，我将会演示如何自定义一个Doom Emacs模块，实现在Emacs中使用Rime输入法。

Doom Emacs的私有配置是被放在`--doom-dir`下的，默认值为`~/.doom.d/`，所以你需要将私有配置存放在这里面。

下面是我Doom Emacs私有配置的目录结构:

```bash
.
├── config.el
├── init.el
├── modules
│   └── private
│       └── rime
│           ├── config.el
│           └── packages.el
└── packages.el
```

下面对其一一讲解:

- packages.el 存放安装包的代码
- config.el 存放配置包的代码
- init.el doom emacs的模块设置和启动入口
- modules/ 私有模块都放在这个下面
- rime/ 一个名为rime的模块
- rime/config.el 针对这个模块的配置
- rime/packages.el 针对这个模块要安装的包

其实并不是所有配置都需要已模块化的方式管理，只是既然有模块，就尽量按模块的方式来写配置。例如doom emacs默认的补全延迟是0.5，你就可以直接在`~/.doom.d/config.el`里添加如下代码让其补全延迟为0.1:

```bash
(setq company-idle-delay 0.1)
```

> 注意，这里仅为了演示将此次私有模块名称定为rime，其实你可以叫其他名字，并且一个模块是可以做任意配置的。

我们所有的私有模块都得放在modules/下并且存放在单独的目录下，并且每个模块都必须包含

config.el和packages.el (注意packages有个s)，packages.el用来放安装包的代码，基本上是调用一下package!宏，config.el里面就是针对这个模块要写的配置啦，通常是利用use-package!宏来对每个包进行管理和配置。

下面是具体配置内容:

config.el

```elisp
;;; private/rime/config.el -*- lexical-binding: t; -*-

(use-package! rime
  :custom
  (default-input-method "rime")
  (rime-show-candidate 'posframe))
```

packages.el

```elisp
;; -*- no-byte-compile: t; -*- 
;;; private/rime/packages.el

(package! rime)

```

这个例子中，我们使用package!宏让doom在执行doom sync后安装这个包，并且在config.el中对这个包进行了配置，主要是配置了设置默认的输入法为rime，以及rime的输入框显示方法。

编写好私有模块后还需在 `init.el` 内将其开启，添加如下内容至最后一个括号的前面:

```elisp
        ...

       :config
       ;;literate
       (default +bindings +smartparens)

       :private
       rime
       )
```

最后我们仅需执行doom sync，那么就会自动下载包并且安装啦！可以立刻重启Emacs体验一下属于你的配置吧！


## 其他

### 开启 vanilla emacs(原生的 GNU Emacs)

.doom.d/config.el

```elisp
;;Key Configuration for Doom as Vanilla Emacs
(setq evil-default-state 'emacs)

```

## 参考

- [请尝试使用Doom Emacs 「Emacs+Vim双强联合」](https://www.bilibili.com/read/cv11371146)
- [Doom Emacs](https://github.com/doomemacs/doomemacs)
