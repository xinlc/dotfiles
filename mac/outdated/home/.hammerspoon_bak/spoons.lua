-- Install SpoonInstall if needed
local spoon_install_path = hs.spoons.resourcePath("Spoons")
if not pcall(function()
    hs.fs.dir(spoon_install_path .. "/SpoonInstall.spoon")
end) then
    hs.http.asyncGet("https://github.com/Hammerspoon/Spoons/raw/master/Spoons/SpoonInstall.spoon.zip", nil,
        function(status, body, headers)
            local zipfile = spoon_install_path .. "/SpoonInstall.spoon.zip"
            io.open(zipfile, "w"):write(body):close()
            hs.execute(string.format("/usr/bin/unzip -d %s %s", spoon_install_path, zipfile))
            -- hs.execute(string.format("/bin/rm '%s'", zipfile))
        end)
end

-- Default key
local cmdKey = {"cmd"}
local cmdCtrlKey = {"cmd", "ctrl"}
local altKey = {"alt"}
local altShiftKey = {"alt", "shift"}
local cocKey = {"ctrl", "alt", "cmd"}
local hyper = {'ctrl', 'alt', 'cmd', 'shift'}
local super = {'ctrl', 'alt', 'cmd'}

-- Load spoons
hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install = spoon.SpoonInstall

-- Install:andUse("ReloadConfiguration", {
--     hotkeys = {
--         reloadConfiguration = {altShiftKey, "R"}
--     },
--     start = true
-- })

-- Install:andUse("MouseCircle", {
--     disable = false,
--     hotkeys = {
--         show = {altShiftKey, "C"}
--     }
-- })

Install:andUse("FadeLogo", {
    config = {
        run_time = 0.75
    },
    start = true
})

-- Show Clock
-- Install:andUse("CircleClock", {
--     disable = false
-- })

-- spoon.SpoonInstall.repos.ShiftIt = {
--     url = "https://github.com/peterklijn/hammerspoon-shiftit",
--     desc = "ShiftIt spoon repository",
--     branch = "master"
-- }

-- spoon.SpoonInstall:andUse("ShiftIt", {
--     repo = "ShiftIt"
-- })
-- spoon.ShiftIt:bindHotkeys({
--     left = {{'ctrl', 'cmd'}, 'j'},
--     right = {{'ctrl', 'cmd'}, 'l'},
--     up = {{'ctrl', 'cmd'}, 'i'},
--     down = {{'ctrl', 'cmd'}, ','},
--     upleft = {{'ctrl', 'cmd'}, 'u'},
--     upright = {{'ctrl', 'cmd'}, 'o'},
--     botleft = {{'ctrl', 'cmd'}, 'm'},
--     botright = {{'ctrl', 'cmd'}, '.'},
--     maximum = {{'ctrl', 'cmd'}, 'k'},
--     toggleFullScreen = {{'ctrl', 'shift', 'cmd'}, 'k'},
--     toggleZoom = {{'ctrl', 'cmd'}, 'z'},
--     center = {{'ctrl', 'cmd'}, 'c'},
--     nextScreen = {{'ctrl', 'cmd'}, 'n'},
--     previousScreen = {{'ctrl', 'cmd'}, 'p'},
--     resizeOut = {{'ctrl', 'cmd', 'shift'}, '['},
--     resizeIn = {{'ctrl', 'cmd', 'shift'}, ']'}
-- })

-- spoon.SpoonInstall.repos.Eikana = {
--     url = "https://github.com/kouhin/Eikana.spoon",
--     desc = "Eikana spoon repository",
--     branch = "main"
-- }

-- spoon.SpoonInstall:andUse("Eikana", {
--     repo = "Eikana",
--     config = {
--         userMapping = {
--             rightshift = "Wubi - Simplified"
--         },
--         override = true
--     },
--     start = true
-- })

-- Show shortcuts for current application
-- spoon.SpoonInstall:andUse("KSheet", {
--     hotkeys = {
--         toggle = {altKey, "/"}
--     }
-- })

-- spoon.SpoonInstall:andUse("FnMate", {})

-- Caffeine Menu
-- spoon.SpoonInstall:andUse("Caffeine", {
--     hotkeys = {
--         toggle = {altKey, "Z"}
--     },
--     start = true
-- })

-- Network Speed Menu
-- spoon.SpoonInstall:andUse("SpeedMenu", {
--     start = true
-- })



-- https://github.com/dbalatero/SkyRocket.spoon
-- local SkyRocket = hs.loadSpoon("SkyRocket")

-- sky = SkyRocket:new({
--     -- Opacity of resize canvas
--     opacity = 0.3,

--     -- Which modifiers to hold to move a window?
--     moveModifiers = {'cmd', 'shift'},

--     -- Which mouse button to hold to move a window?
--     moveMouseButton = 'left',

--     -- Which modifiers to hold to resize a window?
--     resizeModifiers = {'ctrl', 'shift'},

--     -- Which mouse button to hold to resize a window?
--     resizeMouseButton = 'left'
-- })




-- Open Hammerspoon manual
-- hs.hotkey.bind(altShiftKey, "M", function()
--     hs.doc.hsdocs.forceExternalBrowser(true)
--     hs.doc.hsdocs.moduleEntitiesInSidebar(true)
--     hs.doc.hsdocs.help()
-- end)

-- Rescan network
-- hs.hotkey.bind(altKey, "S", function() spoon.SpeedMenu:rescan() end)
-- hs.hotkey.bind(altShiftKey, "S", function() spoon.SpeedMenu:toggle() end)

-- hs.hotkey.bind(altShiftKey, "Z", function() hs.toggleConsole() end)

-- Lock Screen (Private API)
-- hs.hotkey.bind(altShiftKey, "L", function() hs.caffeinate.lockScreen() end)

-- Start Screensaver
-- hs.hotkey.bind(altKey, "L", function() hs.caffeinate.startScreensaver() end)

-- Grid Show
-- hs.hotkey.bind(altKey, "G", function() hs.grid.show() end)

-- Open my initial applications
-- hs.hotkey.bind(cocKey, "0", function()
--     hs.alert.show("Opening initial applications...")
--     hs.application.launchOrFocus("Slack")
--     hs.application.launchOrFocus("Google Chrome")
--     hs.application.launchOrFocus("Alacritty Light")
-- end)

-- Window Switcher
-- hs.window.switcher.ui.onlyActiveApplication = false -- only show windows of the active application
-- hs.window.switcher.ui.showTitles            = false -- show window titles
-- hs.window.switcher.ui.showThumbnails        = true  -- show window thumbnails
-- hs.window.switcher.ui.thumbnailSize         = 144   -- size of window thumbnails in screen points
-- hs.window.switcher.ui.showSelectedThumbnail = true  -- show a larger thumbnail for the currently selected window
-- hs.window.switcher.ui.selectedThumbnailSize = 384
-- hs.window.switcher.ui.showSelectedTitle     = false -- show larger title for the currently selected window

-- Default window switcher: only visible windows, all Spaces
-- windowSwitcher = hs.window.switcher.new()
-- hs.hotkey.bind(altKey, "Tab", "Next window", function() windowSwitcher:next() end, nil, function() windowSwitcher:next() end)
-- hs.hotkey.bind(altShiftKey, "Tab", "Previous window", function() windowSwitcher:previous() end, nil, function() windowSwitcher:previous() end)

-- Switcher for minimized/hidden windows in current Space
-- windowsInSpaceSwitcher = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter{})
-- hs.hotkey.bind(altKey, "Q", "Next window", function() windowsInSpaceSwitcher:next() end, nil, function() windowsInSpaceSwitcher:next() end)
-- hs.hotkey.bind(altShiftKey, "Q", "Previous window", function() windowsInSpaceSwitcher:previous() end, nil, function() windowsInSpaceSwitcher:previous() end)

-- Switcher for predefined browsers
-- browserSwitcher = hs.window.switcher.new{ "Safari", "Google Chrome", "Google Chrome Beta", "Google Chrome Canary", "Chromium", "Brave Browser", "Firefox", "Opera", "Microsoft Edge" }
-- hs.hotkey.bind(altKey, "B", "Next browser", function() browserSwitcher:next() end, nil, function() browserSwitcher:next() end)
-- hs.hotkey.bind(altShiftKey, "B", "Previous browser", function() browserSwitcher:previous() end, nil, function() browserSwitcher:previous() end)




-- hs.alert.show("Hammerspoon started!")