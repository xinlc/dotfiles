Rime Squirrel 鼠须管输入法配置详解
===

## 安装

下载 [鼠须管](https://rime.im/)，安装后切换到 Rime 输入法，开始使用。
默认繁体输出，通过组合键 `Control+｀` 或 `F4` 键切换输入方案，例如选择【朙月拼音·简化字】简体输出。

> 注：建议 Mac 打开 Squirrel 通知，之后部署会提示是否成功。

## 备份初始配置（可选）

防止操作不当配置无法恢复，可以为初始配置做个备份。在【终端】中输入以下命令，按回车键，会出现一个【Rime.bak】文件夹即备份。

```bash
cp -r ~/Library/Rime ~/Library/Rime.bak
```

> 还原：初始配置【Rime】文件夹清空，将【Rime.bak】内的文件复制粘贴过去，点击菜单栏【ㄓ】-【重新部署】。

## 配置文件说明

- `default.custom.yaml` 设置输入法、如何切换输入法、翻页等
- `double_pinyin_flypy.custom.yaml` 双拼方案，我用的是小鹤双拼
- `squirrel.custom.yaml` 设置哪些软件默认英文输入，输入法皮肤等
- `custom_phrase.txt` 设置快捷输入，修改完成后要重新部署才能生效 配置文件中大部分都有注释。

```bash
.
├── custom_phrase.txt  # 自定义短语
├── default.custom.yaml  # 全局设置/中英文切换/快捷键等
├── squirrel.custom.yaml # 鼠须管的皮肤设置/应用默认中英文配置
├── weasel.custom.yaml   # 小狼毫的皮肤设置

# 小鹤双拼输入方案
├── double_pinyin_flypy.custom.yaml
├── double_pinyin_flypy.schema.yaml

# 明月piny输入方案
├── luna_pinyin.dict.yaml            # 词库
├── luna_pinyin.extended.dict.yaml   # 外挂词库
├── luna_pinyin.sogou.dict.yaml      # 搜狗词库
├── luna_pinyin_simp.custom.yaml     # 载入外挂词库/英文词库/快捷符号和模糊音
├── luna_pinyin_simp.schema.yaml

# 袖珍拼音输入方案
├── pinyin_simp.schema.yaml # 拼音方案（关键配置文件）
├── pinyin_simp.dict.yaml   # 挂载词库
├── cn_dicts/               # 词库目录
├── symbols.custom.yaml     # 自定义的 symbols，单独拆分出来了

├── melt_eng.schema.yaml # 英文方案
├── melt_eng.dict.yaml   # 挂载词库
├── en_dicts/            # 词库目录

├── fixed.txt         # 固顶字/自定义短语
├── opencc/           # 词语映射/Emoji
├── rime.lua          # lua 脚本/动态时间/日期/星期
└── zh-hans-t-essay-bgw.gram  # 八股文语言模型
```

## 全局设置

全局设置文件 `default.custom.yaml`，包含输入方案、候选词个数、中英文切换、快捷键。

### 输入方案

按 `Control+｀` 显示输入方案。如果你不用双拼或大写数字，可以将其连同配置里的文件一并删除；同理，你也可以添加其他方案，例如：[五笔、地球拼音、袖珍拼音](https://github.com/rime/plum#essentials)。

> 注：输入方案都是以 `.schema.yaml` 命名，例如 `luna_pinyin_simp.schema.yaml`，可以修改该文件进行定制，但是输入法一旦更新，这个文件也会跟着更新，定制就会丢失。
> 解决办法是新建文件 `luna_pinyin_simp.custom.yaml`，然后在里面定制，所有方案对应的补丁名都是 `<方案名>.custom.yaml`。

```yaml
schema_list:
  - schema: luna_pinyin_simp      # 朙月拼音
  - schema: double_pinyin_flypy   # 小鹤双拼
  - schema: double_pinyin         # 自然码双拼
  - schema: numbers               # 大写数字
  - schema: pinyin_simp           # 袖珍简化字
```

### 候选词个数

修改后面的数字更改候选词个数。

```yaml
menu/page_size: 9 
```

### 中英文切换

下面代码表示使用 `Caps` 键切换大小写，使用 `Shift` 键切换中英文。

```yaml
ascii_composer/good_old_caps_lock: true # 若为 true， Caps 只切换大小写
ascii_composer/switch_key:
  Caps_Lock: commit_code                # Caps 键
  Shift_L: commit_code                  # 左 Shift，切换中英文
  Shift_R: commit_code                  # 右 Shift，切换中英文
  Control_L: noop                       # 左 Control，屏蔽该切换键
  Control_R: noop                       # 右 Control，屏蔽该切换键
```

> 注：如果 Caps 键不能切换大小写，打开 Mac 系统偏好设置 > 键盘 > 输入法 > 取消【使用大写锁定键切换“美国”输入模式】。

其他切换策略：

- **inline_ascii**：在输入法的临时英文编辑区内输入字母、数字、符号、空格等，回车上屏后自动复位到中文
- **commit_text**：已输入的候选文字上屏并切换至英文输入模式

### 翻页快捷键

- **when**：有几种状态 `composing`、`has_menu`、`paging`
- **accept**：控制接受的按键 `minus`、`equal`,、`period`、`comma`、`bracketleft`、`bracketright`
- **send**：控制动作 `Page_Up`、`Page_Down`、`Escape`(清空输入码)

## 词库格式

新建文件命名格式为 `<词库名>.dict.yaml`。

示例：朙月拼音 AV 女优词库 `luna_pinyin.av.dict.yaml`。

```yaml
# 日本 AV 女优

name: luna_pinyin.av  # 要和文件名一致
version: "2021.12.21"
sort: by_weight
use_preset_vocabulary: false
...
                              # 此处空一行
三上悠亞  san shang you ya  1  # 汉字和编码用 Tab 键间隔，拼音之间用空格键
```

## 词库外挂

打开 `luna_pinyin.extended.dict.yaml`，将词库名添加。

示例：AV 女优词库 `luna_pinyin.av.dict.yaml` 即输入 `luna_pinyin.av`。

```yaml
import_tables:
  - luna_pinyin
  - luna_pinyin.av
  - luna_pinyin.chat
  - luna_pinyin.sogou
```

## 词库载入

打开 `luna_pinyin_simp.custom.yaml`，载入中英文词库，还可以修改英文候选词位置、Emoji 显示注释等。

```yaml
patch:
  # 启用罕见字過濾
  engine/filters:
    - simplifier
    - simplifier@emoji_conversion
    - uniquifier
    - charset_filter@gbk # (※3) GBK 过滤
    - single_char_filter

  emoji_conversion:
    opencc_config: emoji.json
    option_name: show_emoji
    tags: abc
    #tips: all    # Emoji 显示注释

  # 改写拼写运算，含英文的词汇（luna_pinyin.cn_en.dict.yaml）不影响简拼
  "speller/algebra/@before 0": xform/^([b-df-hj-np-tv-z])$/$1_/

  # 载入朙月拼音扩充词库
  "translator/dictionary": luna_pinyin.extended

  # 加载easy_en依赖
  "schema/dependencies/@1": easy_en
  # 载入翻译英文的码表翻译器，取名为 english
  "engine/translators/@4": table_translator@english
  # english翻译器的设定项
  english:
    dictionary: easy_en
    spelling_hints: 9
    enable_completion: false # 是否启用英文输入联想补全
    enable_sentence: false # 混输时不出现带有图案的英文
    initial_quality: -0.5 # 英文候选词的位置, 数值越大越靠前。
```

## 模式转换

打开 `luna_pinyin_simp.custom.yaml`，switches 列了：中文西文、全角半角、Emoji、简繁体、字节编码。

```yaml
patch:
  switches:
    - name: ascii_mode                   # 0 中文，1 英文
      reset: 0
      states: ["中文", "西文"]
    - name: full_shape                   # 全角/半角符号开关
      states: ["半角", "全角"]
    - name: show_emoji                   # Emoji 开关
      reset: 1
      states: [ "🈚️️\uFE0E", "🈶️️\uFE0F" ]
    - name: zh_simp                      # (※1) 繁简转换
      reset: 1
      states: ["漢字", "汉字"]
    - options: ["utf8", "gbk", "gb2312"] # (※2)字符集选单
      reset: 0                           # 默认 UTF8
      states:
        - UTF-8
        - GBK
        - GB2312
```

## 搜狗词库转换

转换方法：[点击这里](https://ssnhd.com/2022/01/06/sogou-dict/)。本配置里的搜狗词库包含官网 12 个分类（城市、工程、农业、人文、社会、生活、艺术、医学、游戏、娱乐、运动、自然），满足绝大部份用户使用。

## Emoji

打开 opencc 文件夹内 `emoji_word.txt`，规则：字符用 Tab 键间隔，其他用空格键，简体和繁体都要加入。

```txt
开心  开心 😄 😃 😺
開心  開心 😄 😃 😺
```

按 `Control + ｀` 组合键，可以选择开启或关闭 Emoji。

## 快捷符号

以朙月拼音为例，打开 `luna_pinyin_simp.custom.yaml`，自行添加修改。

> 注：打开【用户设定】-【build 文件夹】- `luna_pinyin_simp.schema.yaml` 里有超多快捷符号，将需要修改的快捷符号添加到下面区域。

```yaml
"/fs": [½, ‰, ¼, ⅓, ⅔, ¾, ⅒ ]
"/xh": [ ＊, ×, ✱, ★, ☆, ✩, ✧, ❋, ❊, ❉, ❈, ❅, ✿, ✲]
"/dq": [🌍,🌎,🌏,🌐,🌑,🌒,🌓,🌔,🌕,🌖,🌗,🌘]
"/sg": [🍇,🍉,🍌,🍍,🍎,🍏,🍑,🍒,🍓,🍗,🍦,🎂,🍺,🍻]
"/dw": [🙈,🐵,🐈,🐷,🐨,🐼,🐾,🐔,🐬,🐠,🦋]
"/bq": [😀,😁,😂,😃,😄,😅,😆,😉,😊,😋,😎,😍,😘,😗]
"/ss": [💪,👈,👉,👆,👇,✋,👌,👍,👎,✊,👊,👋,👏,👐]
"#": "#"
"*": "*"
"`": "`"
"~": "~"
"@": "@"
"=": "="
'\': "、"
"%": "%"
"$": ["¥", "$"]
"|": ["|", "｜", "·"]
"/": ["/", "÷"]
"'": { pair: ["「", "」"] }  #表示一对
"[": "【"
"]": "】"
"<": "《"
">": "》"
```

## 模糊音纠错

打开 `luna_pinyin_simp.custom.yaml`，若关闭前面加 `#`。

```yaml
# 需要哪組就刪去行首的 # 號，單雙向任選
- derive/^([zcs])h/$1/             # zh, ch, sh => z, c, s
- derive/^([zcs])([^h])/$1h$2/     # z, c, s => zh, ch, sh
- derive/^n/l/                     # n => l
- derive/^l/n/                     # l => n

# 這兩組一般是單向的
- derive/^r/l/                     # r => l
- derive/^ren/yin/                 # ren => yin, reng => ying
- derive/^r/y/                     # r => y

# 下面 hu <=> f 這組寫法複雜一些，分情況討論
- derive/^hu$/fu/                  # hu => fu
- derive/^hong$/feng/              # hong => feng
- derive/^hu([in])$/fe$1/          # hui => fei, hun => fen
- derive/^hu([ao])/f$1/            # hua => fa, ...
- derive/^fu$/hu/                  # fu => hu
- derive/^feng$/hong/              # feng => hong
- derive/^fe([in])$/hu$1/          # fei => hui, fen => hun
- derive/^f([ao])/hu$1/            # fa => hua, ...

# 韻母部份
- derive/^([bpmf])eng$/$1ong/      # meng = mong, ...
- derive/([ei])n$/$1ng/            # en => eng, in => ing
- derive/([ei])ng$/$1n/            # eng => en, ing => in

# 超级简拼
- abbrev/^([a-z]).+$/$1/           # 簡拼（首字母）
- abbrev/^([zcs]h).+$/$1/          # 簡拼（zh, ch, sh）

# 智能纠错
- derive/([aeiou])ng$/$1gn/        # dagn => dang
- derive/([dtngkhrzcs])o(u|ng)$/$1o/  # zho => zhong|zhou
- derive/ong$/on/                  # zhonguo => zhong guo
- derive/ao$/oa/                   # hoa => hao
- derive/([iu])a(o|ng?)$/a$1$2/    # tain => tian
```

## 动态时间日期

打开 `Rime.lua`，默认编码如下，双拼用户时间和星期无效，建议改为不冲突编码，例如时间 `sj` 改为 `time`。

- 【日期】`rq` = `2022-01-14`、`2022年01月14日`、`01-14`、`2022/01/14`
- 【时间】`sj` = `03:11`、`03:11:00`
- 【星期】`xq` = `周五`、`星期五`、`礼拜五`

再将下面代码添加在对应的输入方案，例如：朙月拼音添加在 `luna_pinyin_simp.custom.yaml`。

```yaml
"engine/translators/@6": lua_translator@date_translator
```

## 自定义短语

用文本编辑打开 `custom_phrase.txt`，规则：内容+编码+权重（可选），使用 Tab 键间隔。

示例：

```txt
Rime  rime	4
鼠须管	rime	3
https://rime.im/	rime	2
Squirrel	rime	1
```

## 皮肤

打开 `squirrel.custom.yaml`，将皮肤主题代码添加进去，皮肤效果[点击这里](https://ssnhd.com/2022/01/11/rime-skin)。

- 【浅色】style/color_scheme: 皮肤主题名称
- 【深色】style/color_scheme_dark: 皮肤主题名称

本配置默认开启跟随 macOS 主题自动切换深浅色皮肤，如果您想浅色模式使用深色皮肤，可以将 `style/color_scheme_dark:` 里删除 `_dark`，并只开启一个浅色皮肤，重新部署；如果是深色模式使用浅色皮肤，操作相反。

**修改颜色**

- 每 8bit 一组，从低位到高位分别代表 Red、Green、Blue、Alpha，共 32bit。
- Alpha 值（如果界面支持）是可选的，默认为 `0xF` F 即不透明。
- 把颜色值写为十六进制数，即 `0xAABBGGRR` 或 `0xBBGGRR`。

## 特定程序中英文

打开 `squirrel.custom.yaml`，将程序标识符添加进去，并输入对应模式开启默认中英文。

- `ascii_mode: true`：默认英文
- `ascii_mode: false`：默认中文
- `ascii_punct: true`：开启英文标点

示例：VSCode 默认英文输入，始终输出英文标点（半角）。

```yaml
com.microsoft.VSCode:
    ascii_mode: true
    scii_punct: true
```

**延伸：如何获取程序标识符？**

1. 打开 Mac 活动监视器，选中程序，点击上方 `···` 里**取样进程**。
2. 找到 `Identifier` 后面即为程序标识符。

## 删词 or 降权

将光标（`↑` `↓`或`←` `→`）移到要删除的词组上，按 `Shift+Fn+Delete` 键（第三方键盘按 `Control+Delete`）。只能从用户词典中删除词组，词库里词组只会取消其调频顺序。

可以删除自造词，或降低词库中已有词语的权重（回到原始权重，不是降到最低）。

- 鼠须管使用 Fn + ⇧ + ⌫
- 小狼毫使用 Ctrl/Shift + Del

## Tab 切光标

这功能挺好用的，每次用别人的电脑打字都会怀念这个功能。

已经在 `default.custom.yaml` 中默认开启，可以使用 Tab 或 Shift + Tab 来在单字拼音前后移动

对于「xian西安」「tian提案」这种拼音，如果想切到「xi、ti」的后面，只能用左右方向键移动。

另外 Shift + ⌫ 可以删除单个汉字的拼音。

## 同步

`installation.yaml` 和 `user.yaml` 两个文件在第一次部署后会自动生成。

部署完成后可以在 installation.yaml 中修改或添加以下两行，配置同步目录，示例：

```yaml
# ...
sync_dir: "/Users/richard/Dropbox/Rime_userdb"  # 同步的路径
installation_id: "Richard-MBP-001"  # 本机的 ID 标志
# ...
```

> Rime 是双向同步机制，在菜单栏点击「同步用户数据」后，配置目录（~/Library/Rime/）和同步目录（sync_dir）会保持一致。

### 同步至 iCloud

1. 打开配置文件 `installation.yaml`，将 id 改为`Mac`（支持自定义）。

2. 复制下面路径代码粘贴进来，代码中 `richard` 替换为你的电脑用户名。

```yaml
sync_dir: "/Users/richard/Library/Mobile Documents/com~apple~CloudDocs/RimeSync"
```

3. 点击菜单栏【ㄓ】-【同步用户数据】，打开访达 iCloud 即可查看有个叫 RimeSync 文件夹即为同步文件。

> 更多同步方案：[点击这里](https://github.com/rime/home/wiki/UserGuide#同步用戶資料)。

### iCloud 词库同步至新配置

1. 打开配置文件 `installation.yaml`，将 id 和路径修改为 iCloud 同步文件 `installation.yaml` 里的一至。
2. 点击菜单栏【ㄓ】-【同步用户数据】，此时你之前的个人词库已经同步到新配置里。

## 报错日志

打开终端输入 `$TMPDIR/rime.Squirrel.INFO` 按回车键，复制路径地址在访达中打开。

找到【rime.squirrel.INFO】文件，右击点选**显示原身**得到日志文件。

## 关于词频

配置里搜狗词库已经附带词频，可以满足绝大部分用户需求，初次使用极少部分词频不完全在首位，稍微用几日即可。

## 袖珍简化字

### 「袖珍简化字」Vs.「朙月拼音」

简体与繁体的问题，不过简繁和方案没有关系，主要是词库，切换简繁时使用不同的 s2t 或 t2s 选项就可以了。

在 `Squirrel 0.15.0` 开始 `charset_filter@gb2312` 的过滤失效了，生僻字暴增（默认的字表过大），就考虑换到了纯简体的字表、词库。

「朙月拼音 luna_pinyin」原版是使用繁体作为词库，若要输出简体是经过了 opencc 转换的。

如果是简体用户，不如直接使用简体词库，这样出词不用经过 opencc 转换，可避免一些 Bug 和错字。（比如某些字打不出来、某些词汇无法记住）

### melt_eng Vs. easy_en

melt_eng（[融合拼音](https://github.com/tumuyan/rime-melt)的英文输入方案）是 easy_en 的一个改版。

支持了响应大写字母（Shift + 字母）；

精简掉了大写字母开头的词汇，只保留小写；

自己可以新增特定的大写词汇，且也可以用小写来响应；

输入大写开头的字母则直接过滤掉中文候选内容，适合输入忘记了后面怎么拼写的长单词。

### 词库

- 8105.dict.yaml 字表。
- main.dict.yaml 基础词库，含注音、词频。
- ext.dict.yaml 补充词库，只保留三个字及以上不太需要词频的词汇，无注音，依赖于 Rime 的自动注音。

### 不同的上屏方式

按下空格会上屏汉字，按下回车会上屏字母。

- 按「回车」，上屏的是「nihao」。
- 按「Ctrl/Shift + 回车」，上屏的是「ni hao」。（中间有空格）

「Ctrl/Shift + 回车」会自动断词，添加空格。

`translator/preedit_format` 这里还会影响上屏显示的东西，比如是显示「lv」还是「lü」。

如果是双拼方案，`preedit_format` 还可以选择是否在输入框进行转换，比如是显示「zz走」还是「zou走」。


## 参考

- [rime](https://github.com/rime)
- [接近原生的鼠须管 Rime 配置](https://github.com/wongdean/rime-settings)
- [scomper-Rime](https://github.com/scomper/Rime)
- [rime-pure](https://github.com/SivanLaai/rime-pure)
- [ssnhd-rime](https://github.com/ssnhd/rime)
- [rime-ice](https://github.com/iDvel/rime-ice)
- [鼠须管输入法配置详解](https://ssnhd.com/2022/01/06/rime/)
- [搜狗词库转为 Rime 词库方法](https://ssnhd.com/2022/01/06/sogou-dict/)
- [我的 Rime 配置 2022](https://dvel.me/posts/my-rime-setting-2022/)
- [四叶草拼音](https://github.com/fkxxyz/rime-cloverpinyin)
- [86版极点五笔](https://github.com/KyleBing/rime-wubi86-jidian)
