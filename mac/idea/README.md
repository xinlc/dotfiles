
## vim 配置

[.ideavimrc](../macbook/.ideavimrc)

## 安装的插件

- `Alibaba Java Coding Guidelines` p3c 开启这个比较卡
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
- `MyBatisCodeHelperPro`
- `Free MyBatis plugin` MyBatis 免费的插件
- `MyBatisX`
- `Key Promoter X` 对你的鼠标操作进行 快捷键提示
- `Rainbow brackets` 让代码中的括号更具标识性
- `RestfulToolkit` Restful 工具

## 常用设置

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
