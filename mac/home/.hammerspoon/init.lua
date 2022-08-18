-- Global log level
-- hs.logger.defaultLogLevel = "info"
hs.logger.defaultLogLevel = "error"

-- Hotkeys
--- 禁用热键提示，开始使用的时候可以先设置成 1
hs.hotkey.alertDuration = 0

-- Disable window animation
hs.window.animationDuration = 0

-- Hints
hs.hints.style = "vimperator"
--- 禁用切换应用时的文件名提示
hs.hints.showTitleThresh = 0

-- Grid
hs.grid.setMargins({
    x = 0,
    y = 0
}).setGrid("6x4")
hs.grid.ui.textSize = 150

-- Load modules
require("modules.menu")
require("modules.reload")
require("spoons")
