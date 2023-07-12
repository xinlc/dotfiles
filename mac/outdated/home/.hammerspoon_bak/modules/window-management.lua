-- https://github.com/S1ngS1ng/HammerSpoon
-- -----------------------------------------------------------------------
--                         ** Something Global **                       --
-- -----------------------------------------------------------------------
-- Comment out this following line if you wish to see animations
local windowMeta = {}
window = require "hs.window"
hs.window.animationDuration = 0
grid = require "hs.grid"
grid.setMargins('0, 0')

module = {}

-- Set screen watcher, in case you connect a new monitor, or unplug a monitor
screens = {}
screenArr = {}
local screenwatcher = hs.screen.watcher.new(function()
    screens = hs.screen.allScreens()
end)
screenwatcher:start()

-- Construct list of screens
indexDiff = 0
for index = 1, #hs.screen.allScreens() do
    local xIndex, yIndex = hs.screen.allScreens()[index]:position()
    screenArr[xIndex] = hs.screen.allScreens()[index]
end

-- Find lowest screen index, save to indexDiff if negative
hs.fnutils.each(screenArr, function(e)
    local currentIndex = hs.fnutils.indexOf(screenArr, e)
    if currentIndex < 0 and currentIndex < indexDiff then
        indexDiff = currentIndex
    end
end)

-- Set screen grid depending on resolution
-- TODO: set grid according to pixels
for _index, screen in pairs(hs.screen.allScreens()) do
    if screen:frame().w / screen:frame().h > 2 then
        -- 10 * 4 for ultra wide screen
        grid.setGrid('10 * 4', screen)
    else
        if screen:frame().w < screen:frame().h then
            -- 4 * 8 for vertically aligned screen
            grid.setGrid('4 * 8', screen)
        else
            -- 8 * 4 for normal screen
            grid.setGrid('8 * 4', screen)
        end
    end
end

-- Some constructors, just for programming
function Cell(x, y, w, h)
    return hs.geometry(x, y, w, h)
end

-- Bind new method to windowMeta
function windowMeta.new()
    local self = setmetatable(windowMeta, {
        -- Treate table like a function
        -- Event listener when windowMeta() is called
        __call = function(cls, ...)
            return cls.new(...)
        end
    })

    self.window = window.focusedWindow()
    self.screen = window.focusedWindow():screen()
    self.windowGrid = grid.get(self.window)
    self.screenGrid = grid.getGrid(self.screen)

    return self
end

-- -----------------------------------------------------------------------
--                   ** ALERT: GEEKS ONLY, GLHF  :C **                  --
--            ** Keybinding configurations locate at bottom **          --
-- -----------------------------------------------------------------------

module.maximizeWindow = function()
    local this = windowMeta.new()
    hs.grid.maximizeWindow(this.window)
end

module.centerOnScreen = function()
    local this = windowMeta.new()
    this.window:centerOnScreen(this.screen)
end

module.throwLeft = function()
    local this = windowMeta.new()
    this.window:moveOneScreenWest(true, true)
end

module.throwRight = function()
    local this = windowMeta.new()
    this.window:moveOneScreenEast(true, true)
end

module.leftHalf = function()
    local this = windowMeta.new()
    local cell = Cell(0, 0, 0.5 * this.screenGrid.w, this.screenGrid.h)
    grid.set(this.window, cell, this.screen)
end

module.rightHalf = function()
    local this = windowMeta.new()
    local cell = Cell(0.5 * this.screenGrid.w, 0, 0.5 * this.screenGrid.w, this.screenGrid.h)
    grid.set(this.window, cell, this.screen)
end

-- Windows-like cycle left
module.cycleLeft = function()
    local this = windowMeta.new()
    -- Check if this window is on left or right
    if this.windowGrid.x == 0 then
        local currentIndex = hs.fnutils.indexOf(screenArr, this.screen)
        local previousScreen = screenArr[(currentIndex - indexDiff - 1) % #hs.screen.allScreens() + indexDiff]
        this.window:moveToScreen(previousScreen)
        module.rightHalf()
    else
        module.leftHalf()
    end
end

-- Windows-like cycle right
module.cycleRight = function()
    local this = windowMeta.new()
    -- Check if this window is on left or right
    if this.windowGrid.x == 0 then
        module.rightHalf()
    else
        local currentIndex = hs.fnutils.indexOf(screenArr, this.screen)
        local nextScreen = screenArr[(currentIndex - indexDiff + 1) % #hs.screen.allScreens() + indexDiff]
        this.window:moveToScreen(nextScreen)
        module.leftHalf()
    end
end

module.topHalf = function()
    local this = windowMeta.new()
    local cell = Cell(0, 0, this.screenGrid.w, 0.5 * this.screenGrid.h)
    grid.set(this.window, cell, this.screen)
end

module.bottomHalf = function()
    local this = windowMeta.new()
    local cell = Cell(0, 0.5 * this.screenGrid.h, this.screenGrid.w, 0.5 * this.screenGrid.h)
    grid.set(this.window, cell, this.screen)
end

module.rightToLeft = function()
    local this = windowMeta.new()
    local cell = Cell(this.windowGrid.x, this.windowGrid.y, this.windowGrid.w - 1, this.windowGrid.h)
    if this.windowGrid.w > 1 then
        grid.set(this.window, cell, this.screen)
    else
        hs.alert.show("Small Enough :)")
    end
end

module.rightToRight = function()
    local this = windowMeta.new()
    local cell = Cell(this.windowGrid.x, this.windowGrid.y, this.windowGrid.w + 1, this.windowGrid.h)
    if this.windowGrid.w < this.screenGrid.w - this.windowGrid.x then
        grid.set(this.window, cell, this.screen)
    else
        hs.alert.show("Touching Right Edge :|")
    end
end

module.bottomUp = function()
    local this = windowMeta.new()
    local cell = Cell(this.windowGrid.x, this.windowGrid.y, this.windowGrid.w, this.windowGrid.h - 1)
    if this.windowGrid.h > 1 then
        grid.set(this.window, cell, this.screen)
    else
        hs.alert.show("Small Enough :)")
    end
end

module.bottomDown = function()
    local this = windowMeta.new()
    local cell = Cell(this.windowGrid.x, this.windowGrid.y, this.windowGrid.w, this.windowGrid.h + 1)
    if this.windowGrid.h < this.screenGrid.h - this.windowGrid.y then
        grid.set(this.window, cell, this.screen)
    else
        hs.alert.show("Touching Bottom Edge :|")
    end
end

module.leftToLeft = function()
    local this = windowMeta.new()
    local cell = Cell(this.windowGrid.x - 1, this.windowGrid.y, this.windowGrid.w + 1, this.windowGrid.h)
    if this.windowGrid.x > 0 then
        grid.set(this.window, cell, this.screen)
    else
        hs.alert.show("Touching Left Edge :|")
    end
end

module.leftToRight = function()
    local this = windowMeta.new()
    local cell = Cell(this.windowGrid.x + 1, this.windowGrid.y, this.windowGrid.w - 1, this.windowGrid.h)
    if this.windowGrid.w > 1 then
        grid.set(this.window, cell, this.screen)
    else
        hs.alert.show("Small Enough :)")
    end
end

module.topUp = function()
    local this = windowMeta.new()
    local cell = Cell(this.windowGrid.x, this.windowGrid.y - 1, this.windowGrid.w, this.windowGrid.h + 1)
    if this.windowGrid.y > 0 then
        grid.set(this.window, cell, this.screen)
    else
        hs.alert.show("Touching Top Edge :|")
    end
end

module.topDown = function()
    local this = windowMeta.new()
    local cell = Cell(this.windowGrid.x, this.windowGrid.y + 1, this.windowGrid.w, this.windowGrid.h - 1)
    if this.windowGrid.h > 1 then
        grid.set(this.window, cell, this.screen)
    else
        hs.alert.show("Small Enough :)")
    end
end

-- -----------------------------------------------------------------------
-- 窗口管理快捷键绑定
-- TODO 抽离
--[[
## 窗口管理
* 将窗口移动到另一屏幕
  * `Ctrl-Alt + Left` - 将当前窗口移动到左侧的屏幕
  * `Ctrl-Alt + Right` - 将当前窗口移动到右侧屏幕
* 窗口最大化
  * `Ctrl-Alt-Command + M`
* 将窗口居中（注：会保持窗口高度）
  * `Ctrl-Alt-Command + C`
* 布局窗口至二分之一当前屏幕大小
  * `Ctrl-Alt-Command + Left` - 窗口占屏幕左半部分
  * `Ctrl-Alt-Command + Right` - 窗口占屏幕右半部分
  * `Ctrl-Alt-Command + Up` - 窗口占屏幕上半部分
  * `Ctrl-Alt-Command + Down` - 窗口占屏幕下半部分
* 调整窗口右边、下边位置（保持左边、上边不变）
  * `Ctrl-Alt-Shift + Left` - 右边左移（窗口变小）
  * `Ctrl-Alt-Shift + Right` - 右边右移（窗口变大）
  * `Ctrl-Alt-Shift + Up` - 下边上移（窗口变小）
  * `Ctrl-Alt-Shift + Down` - 下边下移（窗口变大）
* 调整窗口左边、上边位置（保持右边、下边不变）
  * `Alt-Command-Shift + Left` - 左边左移（窗口变大）
  * `Alt-Command-Shift + Right` - 左边右移（窗口变小）
  * `Alt-Command-Shift + Up` - 上边上移（窗口变大）
  * `Alt-Command-Shift + Down` - 上边下移（窗口变小）
* 类 Windows 的窗口移动（调整窗口位置至相对于当前窗口的左右，效果请参考 Windows 系统下的快捷键 `win + 左/右`）
  * `Ctrl-Alt-Command + u`    将窗口移至相对于当前窗口的左方，并将窗口调整至二分之一屏幕大小
  * `Ctrl-Alt-Command + i`    将窗口移至相对于当前窗口的右方，并将窗口调整至二分之一屏幕大小
--]]

-- -----------------------------------------------------------------------

-- local wm = require('window-management')
local wm = module
local hk = require "hs.hotkey"

-- * Key Binding Utility
--- Bind hotkey for window management.
-- @function windowBind
-- @param {table} hyper - hyper key set
-- @param { ...{key=value} } keyFuncTable - multiple hotkey and function pairs
--   @key {string} hotkey
--   @value {function} callback function
local function windowBind(hyper, keyFuncTable)
    for key, fn in pairs(keyFuncTable) do
        hk.bind(hyper, key, fn)
    end
end

-- * Move window to screen
windowBind({"ctrl", "alt"}, {
    left = wm.throwLeft,
    right = wm.throwRight
})

-- * Set Window Position on screen
windowBind({"ctrl", "alt", "cmd"}, {
    m = wm.maximizeWindow, -- ⌃⌥⌘ + M
    c = wm.centerOnScreen, -- ⌃⌥⌘ + C
    left = wm.leftHalf, -- ⌃⌥⌘ + ←
    right = wm.rightHalf, -- ⌃⌥⌘ + →
    up = wm.topHalf, -- ⌃⌥⌘ + ↑
    down = wm.bottomHalf -- ⌃⌥⌘ + ↓
})
-- * Set Window Position on screen
windowBind({"ctrl", "alt", "shift"}, {
    left = wm.rightToLeft, -- ⌃⌥⇧ + ←
    right = wm.rightToRight, -- ⌃⌥⇧ + →
    up = wm.bottomUp, -- ⌃⌥⇧ + ↑
    down = wm.bottomDown -- ⌃⌥⇧ + ↓
})
-- * Set Window Position on screen
windowBind({"alt", "cmd", "shift"}, {
    left = wm.leftToLeft, -- ⌥⌘⇧ + ←
    right = wm.leftToRight, -- ⌥⌘⇧ + →
    up = wm.topUp, -- ⌥⌘⇧ + ↑
    down = wm.topDown -- ⌥⌘⇧ + ↓
})

-- * Windows-like cycle
windowBind({"ctrl", "alt", "cmd"}, {
    u = wm.cycleLeft, -- ⌃⌥⌘ + u
    i = wm.cycleRight -- ⌃⌥⌘ + i
})

return module
