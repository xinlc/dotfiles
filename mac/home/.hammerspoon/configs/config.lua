---@diagnostic disable: lowercase-global
-- 默认加载的功能模块
defaultConfig = {{
    -- 配置版本号
    -- 每次新增功能项，需将版本号加 1
    configVersion = '10'
}, {
    module = 'modules.winman',
    name = '窗口管理',
    enable = true
}, {
    module = 'modules.application',
    name = '应用快启快切 🚀 ',
    enable = true
}, {
    module = 'modules.emoji',
    name = '快发表情 😄 ',
    enable = false
}, {
    module = 'modules.input-method',
    name = '输入法自动切换',
    enable = false
}, {
    module = 'modules.systemInfo',
    name = 'iStatMenus',
    enable = false
}, {
    module = 'modules.keystroke-visualizer',
    name = '按键回显',
    enable = false
}, {
    module = 'modules.superSKey',
    name = '超级 S 键',
    enable = false
}, {
    module = 'modules.clipboardtool',
    name = '剪贴板工具',
    enable = false
}, {
    module = 'modules.remapingKey',
    name = '自定按键映射',
    enable = false
}, {
    module = 'modules.jsonFormat',
    name = 'JSON格式化',
    enable = false
}, {
    module = 'modules.remind',
    name = '提醒下班',
    enable = false
}, {
    module = 'modules.vim-mode',
    name = 'VIM模式',
    enable = true
}, {
    module = 'modules.dropdown',
    name = '下拉唤起应用',
    enable = true
}, {
    module = 'modules.update',
    name = '自动检查更新',
    enable = false
}}

base_path = os.getenv("HOME") .. '/.hammerspoon/'
-- 本地配置文件路径
config_path = base_path .. '.config'

-- 加载本地配置文件
function loadConfig()
    -- 以可读写方式打开文件
    local file = io.open(config_path, 'r+')
    -- 文件不存在
    if not file then
        -- 创建文件
        file = io.open(config_path, 'w+')
    end
    -- 读取文件所有内容
    local config = file:read('*a')
    -- 配置文件中不存在配置
    if config == '' then
        -- 读取默认配置
        config = serialize(defaultConfig)
    end
    file:close()
    return config
end

function saveConfig(config)
    -- 清空文件内容，然后写入新的文件内容
    file = io.open(config_path, 'w+')
    file:write(serialize(config))
    file:close()
end
