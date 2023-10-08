---@diagnostic disable: lowercase-global

-- prefix：表示快捷键前缀，可选值：Ctrl、Option、Shift, Cmd
-- key：可选值 [A-Z]、[1-9]、Left、Right、Up、Down、-、=、/
-- message: 提示信息
-- name: 应用名称
-- bundleId: App唯一标识ID
-- initWindowLayout: App窗口初始(每次启动后)位置和大小
-- alwaysWindowLayout: App窗口开启全局 HS 快捷键切换后自动调整布局, 没有性能影响, 无卡顿
-- anytimeAdjustWindowLayout: App窗口开启全局任意方式切换后自动调整布局, 有一定程度性能下降!
-- onPrimaryScreen: 窗口排列位置在主显示器屏幕上
-- onBackupScreen:  窗口排列位置在副显示器屏幕上

require("configs.baseConfig")
require("configs.windowConfig")

applications = {
    -- {
    --     prefix = AppHyperKey,
    --     key = "L",
    --     message = "VSCode",
    --     bundleId = "com.microsoft.VSCode", -- 支持 App bundleID
    --     -- alwaysWindowLayout = window_grids.fullScreen,
    --     -- anytimeAdjustWindowLayout = true,
    --     onPrimaryScreen = true,
    -- },
    -- {
    --     prefix = AppHyperKey,
    --     key = "V",
    --     message = "neovide",
    --     name = {"neovide", "nvide", "goneovim"},  -- 支持多 AppName
    --     alwaysWindowLayout = window_grids.fullScreen,
    --     anytimeAdjustWindowLayout = true,
    --     onPrimaryScreen = false,
    -- },
    {
        prefix = AppHyperKey,
        key = "O",
        message = "Obsidian",
        name = { "obsidian", "typora" }, -- 支持 APP 名称
        -- initWindowLayout = grid.centeredMedium,
        alwaysWindowLayout = window_grids.fullScreen,
        anytimeAdjustWindowLayout = true,
    },
    -- {
    --     prefix = AppHyperKey,
    --     key = "A",
    --     message = "ApiPost",
    --     name = { "apipost", "apifox" }, -- 支持 App 名称模糊匹配(ApiPost7)
    -- },
    -- {
    --     prefix = AppHyperKey,
    --     key = "U",
    --     message = "FDM",
    --     name = { "fdm", "Folx" }, -- 支持 APP 名称简写
    --     -- name = "Free Download Manager",
    --     -- initWindowLayout = window_grids.centeredMedium,
    --     alwaysWindowLayout = window_grids.centeredMedium,
    --     anytimeAdjustWindowLayout = true,
    -- },
    -- {
    --     prefix = AppHyperKey,
    --     key = "I",
    --     message = "iTerm2",
    --     name = {"Alacritty", "iTerm", "iTerm2", "warp"},
    --     -- bundleId = "com.googlecode.iterm2",
    --     alwaysWindowLayout = window_grids.fullScreen,
    --     anytimeAdjustWindowLayout = true,
    -- },
    -- {
    --     prefix = AppHyperKey,
    --     key = "F",
    --     message = "PathFinder",
    --     bundleId = "com.cocoatech.PathFinder",
    --     -- initWindowLayout = window_grids.centeredMedium,
    --     -- alwaysWindowLayout = window_grids.centerHorizontal,
    --     anytimeAdjustWindowLayout = true,
    -- },
    -- {
    --     prefix = AppHyperKey,
    --     key = "M",
    --     message = "Foxmail",
    --     -- bundleId = "com.tencent.Foxmail",
    --     name = {"Spark", "Foxmail"},
    --     anytimeAdjustWindowLayout = true,
    -- },
    -- {
    --     prefix = AppHyperKey,
    --     key = "B",
    --     message = "firefox",
    --     bundleId = "org.mozilla.firefox",
    --     initWindowLayout = window_grids.centeredMedium,
    --     alwaysWindowLayout = window_grids.fullScreen,
    --     anytimeAdjustWindowLayout = true,
    -- },
    -- {
    --     prefix = AppHyperKey,
    --     key = "K",
    --     message = "Edge",
    --     -- message = "Chrome",
    --     name = {"edge", "Chrome", "Arc"},
    --     -- bundleId = "com.google.Chrome",
    --     onBackupScreen = true,
    --     alwaysWindowLayout = window_grids.fullScreen,
    --     anytimeAdjustWindowLayout = true,
    -- },
    {
        prefix = AppHyperKey,
        key = "D",
        message = "DBeaver",
        name = { "dbeaver", "DBeaverEE", "DataGrip" },
    },
    -- {
    --     prefix = AppHyperKey,
    --     key = "Q",
    --     message = "QQ",
    --     bundleId = "com.tencent.qq",
    -- },
    -- {
    --     prefix = AppHyperKey,
    --     key = "0",
    --     message = "WeWork",
    --     bundleId = "com.tencent.WeWorkMac",
    -- },
    {
        prefix = AppHyperKey,
        key = "0",
        message = "WeChat",
        bundleId = "com.tencent.xinWeChat",
        onPrimaryScreen = true,
        alwaysWindowLayout = window_grids.centeredMedium,
    },
    -- {
    --     prefix = AppHyperKey,
    --     key = "8",
    --     message = "NeteaseMusic",
    --     bundleId = "com.netease.163music",
    --     initWindowLayout = window_grids.centeredMedium,
    --     alwaysWindowLayout = window_grids.fullScreen,
    --     anytimeAdjustWindowLayout = true,
    -- },

    {
        prefix = AppHyperKey,
        key = "E",
        message = "Finder",
        bundleId = "com.apple.finder",
    },
    {
        prefix = AppHyperKey,
        key = "I",
        message = "IntelliJ IDEA",
        bundleId = "com.jetbrains.intellij",
    },
    {
        prefix = AppHyperKey,
        key = "1",
        message = "Chrome",
        bundleId = "com.google.Chrome",
    },
    {
        prefix = AppHyperKey,
        key = "2",
        message = "VSCode",
        bundleId = "com.microsoft.VSCode",
    },
    {
        prefix = AppHyperKey,
        key = "3",
        message = "QuteBrowser",
        bundleId = "org.qutebrowser.qutebrowser",
    },
}
