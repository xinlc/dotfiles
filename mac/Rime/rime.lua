-- Rime lua 扩展：https://github.com/hchunhui/librime-lua
-------------------------------------------------------------

-- 增加 KeySequence(string)
-- 1
--    local ks= KeySequence()
--    ks:parse("abc")
-- 2
--    local ks= KeySequence("abc")
--
local _KeySequence=KeySequence
KeySequence = function(str)
  local ks = _KeySequence()
  if type(str)== "string" then
    ks:parse(str)
  end
  return ks
end


--[[
librime-lua 样例

调用方法：
在配方文件中作如下修改：
```
  engine:
    ...
    translators:
      ...
      - lua_translator@lua_function3
      - lua_translator@lua_function4
      ...
    filters:
      ...
      - lua_filter@lua_function1
      - lua_filter@lua_function2
      ...
```

其中各 `lua_function` 为在本文件所定义变量名。
--]]

--[[
本文件的后面是若干个例子，按照由简单到复杂的顺序示例了 librime-lua 的用法。
每个例子都被组织在 `lua` 目录下的单独文件中，打开对应文件可看到实现和注解。

各例可使用 `require` 引入。
如：
```
  foo = require("bar")
```
可认为是载入 `lua/bar.lua` 中的例子，并起名为 `foo`。
配方文件中的引用方法为：`...@foo`。

--]]


-- I. translators:

-- date_translator: 将 `date` 翻译为当前日期
-- 详见 `lua/date.lua`:
-- date_translator = require("date")

-- 日历 代替 date
-- 详见 `lua/calendar.lua`:
-- date_translator = require("calendar")
date_translator = require("date_translator")

-- time_translator: 将 `time` 翻译为当前时间
-- 详见 `lua/time.lua`
-- time_translator = require("time")

-- number_translator: 将 `/` + 阿拉伯数字 翻译为大小写汉字
-- 详见 `lua/number.lua`
-- number_translator = require("number")


-- II. filters:

-- charset_filter: 滤除含 CJK 扩展汉字的候选项
-- charset_comment_filter: 为候选项加上其所属字符集的注释
-- 详见 `lua/charset.lua`
local charset = require("charset")
charset_filter = charset.filter
charset_comment_filter = charset.comment_filter

-- single_char_filter: 候选项重排序，使单字优先
-- 详见 `lua/single_char.lua`
-- single_char_filter = require("single_char")
--- 过滤器：单字在先
single_char_first_filter = require("single_char")

-- reverse_lookup_filter: 依地球拼音为候选项加上带调拼音的注释
-- 详见 `lua/reverse.lua`
-- reverse_lookup_filter = require("reverse")

--use wildcard to search code
-- expand_translator = require("expand_translator")


-- III. processors:

-- switch_processor: 通过选择自定义的候选项来切换开关（以简繁切换和下一方案为例）
-- 详见 `lua/switch.lua`
-- switch_processor = require("switch")

-- 由lua 導入 engine/下的組件 processor segmentor translator filters
-- 生成一個processor 於自己 schema speller 取得 config
-- processor=Component.Processor(env.engine,"","speller")
-- 生成一每translator 由 luna_pinyin.schema:/translator 取得 translator config
--
-- tran = Component.Translator(env.engine,Schema('luna_pinyin'),"","script_translator")
--
-- 配合 test.schema.yaml
--require 'component_test'


-- select_character_processor: 以词定字
-- 详见 `lua/select_character.lua`
-- select_character_processor = require("select_character")
select_character = require("select_character")

-- 简单计算器
calculator = require("calculator_simp")

-- 长词优先（提升「西安」「提案」「图案」「饥饿」等词汇的优先级）
long_word_filter = require("long_word_filter")

-- 降低部分英语单词在候选项的位置
reduce_english_filter = require("reduce_english_filter")

-- 单字优先，候选项应改为「ā á ǎ à」
-- v_single_char_first_filter = require("single_char_first")
v_single_char_first_filter = require("v_single_char_first")

-- 限制码长（最多能输入 length_limit 个字符，超过后不再上屏）
code_length_limit_processor = require("code_length_limit_processor")

-- iRime 九宫格专用，将输入框的数字转为对应的拼音或英文
-- irime_t9_preedit = require("irime_t9_preedit")

-- Unicode 输入
unicode_input_translator = require("unicode_input_translator")

-- 为用户词典中（输入过）的内容结尾加上一个星号 *
is_in_user_dict_filter = require("is_in_user_dict")

-- 人民币大写
number_translator = require("number_translator")

-- 自动大写英文词汇
autocap_filter = require("autocap_filter")

-- 中英混输词条自动空格
-- 在 engine/filters 增加 - lua_filter@cn_en_spacer
cn_en_spacer = require("cn_en_spacer")
