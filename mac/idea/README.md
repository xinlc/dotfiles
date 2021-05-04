
## vim 配置

[.ideavimrc](../macbook/.ideavimrc)

## 安装的插件

- `Alibaba Java Coding Guidelines` p3c 阿里巴巴代码规范
- `SonarLint` 代码规范、漏洞检查工具
- `Atom Material Icons` Icon 主题
- `Background Image Plus` 可以设置背景
- `Docker`
- `FindBugs-IDEA` bug 扫描，或安装 QAPlug
- `GenerateAllSetter` 自动生成 Bean setter
- `Grep Console` 控制台过滤 log
- `IDE Features Trainer`
- `IdeaVim` vim
- `Lombok` lombok 插件
- `Material Theme UI` 主题
- `Maven Helper` Maven 依赖分析
- `MyBatis Log Plugin` 把 Mybatis 输出的sql日志还原成完整的sql语句，看起来更直观。
- `MyBatisCodeHelperPro (Marketplace Edition)` [Mybatis代码生成，提示](https://github.com/gejun123456/MyBatisCodeHelper-Pro)
- `Free MyBatis plugin` MyBatis 免费的插件
- `MyBatisX` - [Mybatis 代码生成，提示](ttps://baomidou.com/guide/mybatisx-idea-plugin.html)
- `Key Promoter X` 对你的鼠标操作进行，快捷键提示 (cmd + 鼠标右键, alt + 鼠标右键)
- `Rainbow brackets` 让代码中的括号更具标识性
- `RestfulToolkit` Restful 工具，可以搭配 HTTP Client
- `Tabnine AI Autocomplete` 代码智能补全工具，已被 `Codota` 收购
- `Codota` 1. 智能自动补全让编码速度更快; 2. 从经过测试或证明过的程序中获得编码建议 (ctrl + shift + o 快速查询相关使用案例); 3. 查看开源框架使用案例（ctrl + shift + y）
- `CodeGlance` 代码一瞥，minimap
- `CamelCase` 变换字符串格式，快捷键 shift + alt + U，shift + cmd + U
- `MapStruct Support` MapStruct 插件

## 常用设置

### ideavim

设置 Mac 按键重复

```bash
defaults write -g ApplePressAndHoldEnabled 0
# defaults write -g ApplePressAndHoldEnabled -bool false
```

### 自动生成序列化ID

1. 进入 Preferences -> Editor -> Inspections -> Java -> Serialization Issues -> Serializable class without ‘serialVersionUID’

2. 类继承了 Serializable 接口之后，使用 alt+enter 快捷键自动创建序列化ID

### 代码提示不区分大小写

Preferences -> Editor -> General -> Code Completion

取消 Match case

### 自动导包功能及相关优化功能

Preferences -> Editor -> General -> Auto Import

Java 下全选中

### CTRL + 滑动滚轮 调整窗口显示大小

Preferences -> Editor -> General -> Change font size (Zoom) with Ctrl+Mouse wheel

### 代码编辑区显示行号

Preferences -> Editor -> General -> Appearance 勾选 Show Line Numbers

### 关闭自动保存和标志修改文件为星号

Preferences -> Appearance & Behavior -> System Settings -> 去掉 Synchronize files on frame or editor tab activation 和去掉 Save files on frame deactivation

Preferences -> Editor -> General —> Editor Tabs -> 勾选 Mark modified(*)

### 方法分割线以及字符缩进

Preferences -> Editor -> General —> Appearance -> 勾选 Show method separators, Show Whitespaces

### 微服务项目

显示 Run Dashboard，按两次 shift 输入 Services 或者 Dashboard

### 配置 IDEA VM

```bash
# 修改 idea vm
vim /Applications/IntelliJ\ IDEA.app/Contents/bin/idea.vmoptions

-Xms2048m
-Xmx4096m
-XX:ReservedCodeCacheSize=1024m

# 如果不生效，修改个人目录下配置
# 搜索配置文件修改
find ~/ -name idea.vmoptions
```

显示内存使用情况

老版本：

Preferences -> Appearance & Behavior -> Appearance -> Window Options -> Show memory indicator

2020.1 版本：

1. Press shift two times.
2. Search for memoryIndicator in the search box.
3. Toggle on the memory indicator option.
4. Restart Idea

### QAPlugs 工具包

QAPlugs 包含了 PMD、FindBugs、checkstyle 等代码质量分析工具

PMD是一个代码静态分析工具，能监测不使用的变量、空捕获块、不必要的创建对象等。它支持java、javascript、PLSQL、Apache Velocity、XML、XSL。另外它还支持CPD（copy-paste-detector），CPD能找到重复的代码在java、c、c++、c#、Groovy、PHP、Ruby、fortran、javascript等大部分主流语言。

#### FindBugs 概念

此工具主要能找到代码质量5个方向问题：

- efficient(性能问题)
- maintainability（可维护性）
- portability（可移植性）
- reliability(可靠性)
- usability(可用性)

> 安装后，点击 Tools -> QAPlug -> Analyze Code...

## idea for mac 最全快捷键整理

### 常用快捷键

```txt
⌘ -> command
⇧ -> shift
⌥ -> option
⬆ -> 上箭头
⬇ -> 下箭头
⌃ -> Control

# 编辑

快捷键	说明
⌘ + F	在当前窗口查找
⌘ + ⇧ + F	在全工程查找
⌘ + ⇧ + ⌥ + N	查找类中的方法或变量
F3 / ⇧ + F3	移动到搜索结果的下/上一匹配处
⌘ + R	在当前窗口替换
⌘ + ⇧ + R	在全工程替换
⌘ + ⇧ + V	可以将最近使用的剪贴板内容选择插入到文本
⌥ + ⇧ + Up/Down	向上/下移一行
⌘ + ⇧ + Up/Down	向上/下移动语句
⌘ + /	注释 - //
⌘ + ⇧ + /	注释 - /**/
⇧ + Enter	向下插入新行
⌘ + Enter	上插一行
⌘ + ⇧ + F7	高亮显示所有该文本，按 Esc 高亮消失
⌘ + W	可以选择单词继而语句继而行继而函数
⌘ + ⇧ + W	取消选择光标所在词
⌥ + Left/Right	移动光标到前/后单词
⌥ + Backspace	按单词删除
⌘ + [/]	移动到前/后代码块
⌘ + ⇧ + Left/Right/[/]	选中跳跃范围内的代码
⌘ + Y/X	删除行
⌘ + D	复制行
⌘ + ⇧ + U	大小写转化
⌘ + ⌥ + V	可以引入变量。例如：new String(); 自动导入变量定义
⌘ + ⌥ + T	可以把代码包在一个块内，例如：try/catch
⌘ + ⌥ + L	格式化代码
⌘ + ⌥ + I	将选中的代码进行自动缩进编排，这个功能在编辑 JSP 文件时也可以工作
⌘ + ⌥ + O	优化导入的类和包
⌘ + +/-	当前方法展开、折叠
⌘ + ⇧ + +/-	全部展开、折叠

# 重构

快捷键	说明
⌘ + ⇧ + ⌥ + T	重构功能大汇总快捷键
⇧ + F6	重命名
⌘ + ⌥ + V	提取变量
⌘ + O	重写父类方法


# 代码生成

快捷键	说明
fori	生成循环
sout	System.out.println();
⌘ + J	可以查看所有代码模板
⌘ + ⌥ + J	用动态模板环绕
⌘ + ⇧ + Enter	自动补全末尾的字符（括号，分号），例如敲完if/for时也可以自动补上{}花括号。
⌥ + Enter	导入包，快速修复

后缀自动补全功能(Postfix Completion)

要输入 for(User user : users) 只需输入 user.for + Tab。
要输入 Date birthday = user.getBirthday(); 只需输入 user.getBirthday().var + Tab 即可

# 文件

快捷键	说明
⌘ + Delete	删除文件
⌃ + ⌥ + N	新建一切文件
F5	复制类
F6	移动类

# 工具栏

快捷键	说明
⌃ + H	打开类层次窗口，查看类的继承关系
⌘ + 1	快速打开或隐藏工程面板
⇧ + Esc	不仅可以把焦点移到编辑器上，而且还可以隐藏当前（或最后活动的）工具窗口


# 查找定位

快捷键	说明
⌘ + F7	可以查询当前元素在当前文件中的引用，然后按 F3 可以选择
⌥ + F7	查找整个工程中使用地某一个类、方法或者变量的位置
⇧ + ⇧	Search Everywhere 功能，可在一个弹出框中搜索任何东西，包括类、资源、配置项、方法等等
⌘ + N	快速打开某个类
⌘ + ⇧ + N	快速打开文件或资源
⌘ + B / ⌘ + Click	快速打开光标处的类或方法（跳转到定义处）
⌘ + ⌥ + B	跳转到方法实现处
F2 / ⇧ + F2	移动到有错误的代码
⌘ + U	转到父类
⌘ + G	定位行
⌘ + ⌥ + left/right	返回至上次浏览的位置
⌘ + E	最近的文件
⌘ + ⇧ + E	最近更改的文件
⌥ + ⇧ + C	最近的更改
⌥ + F1	查找代码所在位置
⌘ + ⌥ + F7	显示用法
⌘ + I	实现方法
⌘ + ⌥ + N	内联

# 方法相关

快捷键	说明
⌘ + P	可以显示参数信息
⌘ + F12	查看当前文件的结构

# 调试部分、编译

快捷键	说明
⌘ + F2	停止
⌥ + ⇧ + F9	选择 Debug
⌥ + ⇧ + F10	选择 Run
⌘ + ⇧ + F9	编译
⌘ + ⇧ + F10	运行
⌘ + ⇧ + F8	查看断点
F7	步入 Step into
F8	步过 Step over
F9	恢复程序 Continue
⇧ + F7	智能步入
⇧ + F8	步出
⌥ + ⇧ + F8	强制步过
⌥ + ⇧ + F7	强制步入
⌥ + F9	运行至光标处
⌥ + F10	定位到断点
⌘ + ⌥ + F9	强制运行至光标处
⌘ + F8	切换行断点
⌘ + F9	生成项目
⌘ + ⇧ + C	复制路径
⌘ + ⌥ + ⇧ + C	复制引用，必须选择类名
⌘ + ⌥ + Y	同步
⌘ + ~	快速切换方案（界面外观、代码风格、快捷键映射等菜单）
⇧ + F12	还原默认布局
⌘ + ⇧ + F12	隐藏/恢复所有窗口
⌘ + F4	关闭
⌘ + ⇧ + F4	关闭活动选项卡
⌘ + Tab	转到下一个拆分器
⌘ + ⇧ + Tab	转到上一个拆分器


# 切换窗口

快捷键	说明
⌘ + 1	项目结构
⌘ + 2	收藏
⌘ + 3	搜索结果
⌘ + 4	运行
⌘ + 5	调试
⌘ + 6	TODO
⌘ + 7	结构
⌃ + Tab	切换 tab

# 其他

快捷键	说明
⌘ + ⇧ + A	可以查找所有命令，并且每个命令后面还有其快捷键
 	在任意菜单或显示窗口，都可以直接输入你要找的单词，idea 就会自动为你过滤。

# 测试

快捷键	说明
⌘ + ⌥ + T	创建单元测试用例
```

### Mac键盘符号和修饰键说明

```txt
⌘ Command
⇧Shift
⌥ Option
⌃ Control
↩︎ Return/Enter
⌫ Delete
⌦ 向前删除键（Fn+Delete）
↑ 上箭头
↓ 下箭头
← 左箭头
→ 右箭头
⇞ Page Up（Fn+↑）
⇟ Page Down（Fn+↓）
Home Fn + ←
End Fn + →
⇥ 右制表符（Tab键）
⇤ 左制表符（Shift+Tab）
⎋ Escape (Esc)
```

### Editing（编辑）

```txt
⌃Space 基本的代码补全（补全任何类、方法、变量）
⌃⇧Space 智能代码补全（过滤器方法列表和变量的预期类型）
⌘⇧↩ 自动结束代码，行末自动添加分号
⌘P 显示方法的参数信息
⌃J, Mid. button click 快速查看文档
⇧F1 查看外部文档（在某些代码上会触发打开浏览器显示相关文档）
⌘+鼠标放在代码上 显示代码简要信息
⌘F1 在错误或警告处显示具体描述信息
⌘N, ⌃↩, ⌃N 生成代码（getter、setter、构造函数、hashCode/equals,toString）
⌃O 覆盖方法（重写父类方法）
⌃I 实现方法（实现接口中的方法）
⌘⌥T 包围代码（使用if..else, try..catch, for, synchronized等包围选中的代码）
⌘/ 注释/取消注释与行注释
⌘⌥/ 注释/取消注释与块注释
⌥↑ 连续选中代码块
⌥↓ 减少当前选中的代码块
⌃⇧Q 显示上下文信息
⌥↩ 显示意向动作和快速修复代码
⌘⌥L 格式化代码
⌃⌥O 优化import
⌃⌥I 自动缩进线
⇥ / ⇧⇥ 缩进代码 / 反缩进代码
⌘X 剪切当前行或选定的块到剪贴板
⌘C 复制当前行或选定的块到剪贴板
⌘V 从剪贴板粘贴
⌘⇧V 从最近的缓冲区粘贴
⌘D 复制当前行或选定的块
⌘⌫ 删除当前行或选定的块的行
⌃⇧J 智能的将代码拼接成一行
⌘↩ 智能的拆分拼接的行
⇧↩ 开始新的一行
⌘⇧U 大小写切换
⌘⇧] / ⌘⇧[ 选择直到代码块结束/开始
⌥⌦ 删除到单词的末尾（⌦键为Fn+Delete）
⌥⌫ 删除到单词的开头
⌘+ / ⌘- 展开 / 折叠代码块
⌘⇧+ 展开所以代码块
⌘⇧- 折叠所有代码块
⌘W 关闭活动的编辑器选项卡
```

### Search/Replace（查询/替换）

```txt
Double ⇧ 查询任何东西
⌘F 文件内查找
⌘G 查找模式下，向下查找
⌘⇧G 查找模式下，向上查找
⌘R 文件内替换
⌘⇧F 全局查找（根据路径）
⌘⇧R 全局替换（根据路径）
⌘⇧S 查询结构（Ultimate Edition 版专用，需要在Keymap中设置）
⌘⇧M 替换结构（Ultimate Edition 版专用，需要在Keymap中设置）
```

### Usage Search（使用查询）

```txt
⌥F7 / ⌘F7 在文件中查找用法 / 在类中查找用法
⌘⇧F7 在文件中突出显示的用法
⌘⌥F7 显示用法
⌘⇧I 查看定义的类,快速查看
```

### Compile and Run（编译和运行）

```txt
⌘F9 编译Project
⌘⇧F9 编译选择的文件、包或模块
⌃⌥R 弹出 Run 的可选择菜单
⌃⌥D 弹出 Debug 的可选择菜单
⌃R 运行
⌃D 调试
⌃⇧R, ⌃⇧D 从编辑器运行上下文环境配置
```

### Debugging（调试）

```txt
F8 进入下一步，如果当前行断点是一个方法，则不进入当前方法体内
F7 进入下一步，如果当前行断点是一个方法，则进入当前方法体内，如果该方法体还有方法，则不会进入该内嵌的方法中
⇧F7 智能步入，断点所在行上有多个方法调用，会弹出进入哪个方法
⇧F8 跳出
⌥F9 运行到光标处，如果光标前有其他断点会进入到该断点
⌥F8 计算表达式（可以更改变量值使其生效）
⌘⌥R 恢复程序运行，如果该断点下面代码还有断点则停在下一个断点上
⌘F8 切换断点（若光标当前行有断点则取消断点，没有则加上断点）
⌘⇧F8 查看断点信息
```

### Navigation（导航）

```txt
⌘O 查找类文件
⌘⇧O 查找所有类型文件、打开文件、打开目录，打开目录需要在输入的内容前面或后面加一个反斜杠/
⌘⌥O 前往指定的变量 / 方法
⌃← / ⌃→ 左右切换打开的编辑tab页
F12 返回到前一个工具窗口
⎋ 从工具窗口进入代码文件窗口
⇧⎋ 隐藏当前或最后一个活动的窗口，且光标进入代码文件窗口
⌘⇧F4 关闭活动run/messages/find/… tab
⌘L 在当前文件跳转到某一行的指定处
⌘E 显示最近打开的文件记录列表
⌘⌥← / ⌘⌥→ 退回 / 前进到上一个操作的地方
⌘⇧⌫ 跳转到最后一个编辑的地方
⌥F1 显示当前文件选择目标弹出层，弹出层中有很多目标可以进行选择(如在代码编辑窗口可以选择显示该文件的Finder)
⌘B / ⌘ 鼠标点击 进入光标所在的方法/变量的接口或是定义处
⌘⌥B 跳转到实现处，在某个调用的方法名上使用会跳到具体的实现处，可以跳过接口
⌥ Space, ⌘Y 快速打开光标所在方法、类的定义
⌃⇧B 跳转到类型声明处
⌘U 前往当前光标所在方法的父类的方法 / 接口定义
⌃↓ / ⌃↑ 当前光标跳转到当前文件的前一个/后一个方法名位置
⌘] / ⌘[ 移动光标到当前所在代码的花括号开始/结束位置
⌘F12 弹出当前文件结构层，可以在弹出的层上直接输入进行筛选（可用于搜索类中的方法）
⌃H 显示当前类的层次结构
⌘⇧H 显示方法层次结构
⌃⌥H 显示调用层次结构
F2 / ⇧F2 跳转到下一个/上一个突出错误或警告的位置
F4 / ⌘↓ 编辑/查看代码源
⌥ Home 显示到当前文件的导航条
F3选中文件/文件夹/代码行，添加/取消书签
⌥F3 选中文件/文件夹/代码行，使用助记符添加/取消书签
⌃0...⌃9 定位到对应数值的书签位置
⌘F3 显示所有书签
```

### Refactoring（重构）

```txt
F5 复制文件到指定目录
F6 移动文件到指定目录
⌘⌫ 在文件上为安全删除文件，弹出确认框
⇧F6 重命名文件
⌘F6 更改签名
⌘⌥N 一致性
⌘⌥M 将选中的代码提取为方法
⌘⌥V 提取变量
⌘⌥F 提取字段
⌘⌥C 提取常量
⌘⌥P 提取参数
```

### VCS/Local History（版本控制/本地历史记录）

```txt
⌘K 提交代码到版本控制器
⌘T 从版本控制器更新代码
⌥⇧C 查看最近的变更记录
⌃C 快速弹出版本控制器操作面板
```

### Live Templates（动态代码模板）

```txt
⌘⌥J 弹出模板选择窗口，将选定的代码使用动态模板包住
⌘J 插入自定义动态代码模板
```

### mac 中符号的意义

```txt
⌘（command）、⌥（option）、⇧（shift）、⇪（caps lock）、⌃（control）、↩（return）、⌅（enter）
space（空格）



符号    苹果的键盘    普通的键盘
⌘       command    window
⌥        option    alt
⇧         shift    shift
⇪     caps lock    caps lock
⌃       control    control
↩        return    return
⌅         enter    enter

快速显示桌面

具体的喜好操作可以在 系统偏好设置 > mission control 中修改

多屏幕展示 系统默认按control+向上键
应用程序窗口 系统默认按control+向上键
切换屏幕 系统默认按control+左／右
显示桌面 F11

快速当前应用切换

command+tab

输入法切换快捷键

control + space (默认)
系统偏好设置 > keyboard中设置

打开关闭Dock的隐藏

option + command + D (默认)
系统偏好设置 > keyboard中设置
桌面的情况下 command/window +table

显示launchpad

option／alt + space空格 (设置)
系统偏好设置 > keyboard中设置

浏览器的table切换

control + table
---------------------
```

### General（通用）

```txt
⌘1...⌘9 打开相应编号的工具窗口
⌘S 保存所有
⌘⌥Y 同步、刷新
⌃⌘F 切换全屏模式
⌘⇧F12 切换最大化编辑器
⌥⇧F 添加到收藏夹
⌥⇧I 检查当前文件与当前的配置文件
§⌃, ⌃` 快速切换当前的scheme（切换主题、代码样式等）
⌘, 打开IDEA系统设置
⌘; 打开项目结构对话框
⇧⌘A 查找动作（可设置相关选项）
⌃⇥ 编辑窗口标签和工具窗口之间切换（如果在切换的过程加按上delete，则是关闭对应选中的窗口）
```
