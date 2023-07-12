-- terminal 实现 iTerm2 下拉唤起
require("configs.shortcuts")

---- https://world.hey.com/jonash/alacritty-drop-down-guake-quake-style-terminal-setup-on-macos-6eef7d73
---- https://github.com/asmagill/hs._asm.spaces
---- https://www.hammerspoon.org/docs/hs.spaces.html

-- Switch terminal

local function init(config)
    local APP_NAME = config.appName

    -- hs.hotkey.bind({'ctrl'}, ',', function ()
    -- hs.hotkey.bind(config.prefix, config.key, config.message, function()
    hs.hotkey.bind(config.prefix, config.key, function()
        function moveWindow(dropdown, space, mainScreen)
            -- move to main space
            local win = nil
            while win == nil do
                win = dropdown:mainWindow()
            end
            -- print(win)
            -- print(space)
            -- print(win:screen())
            -- print(mainScreen)
            local fullScreen = not win:isStandard()
            -- if fullScreen then
            --   hs.eventtap.keyStroke('cmd', 'return', 0, dropdown)
            -- end
            local winFrame = win:frame()
            local scrFrame = mainScreen:fullFrame()
            -- print(winFrame)
            -- print(scrFrame)
            winFrame.w = scrFrame.w
            winFrame.y = scrFrame.y
            winFrame.x = scrFrame.x
            winFrame.h = scrFrame.h / 1.5
            -- print(winFrame)
            win:setFrame(winFrame, 0)
            -- print(win:frame())
            hs.spaces.moveWindowToSpace(win, space)
            -- win:spacesMoveTo(space)
            -- if fullScreen then
            --   hs.eventtap.keyStroke('cmd', 'return', 0, dropdown)
            -- end
            win:focus()
        end

        local dropdown = hs.application.get(APP_NAME)
        if dropdown ~= nil and dropdown:isFrontmost() then
            dropdown:hide()
        else
            local space = hs.spaces.focusedSpace()
            -- local mainScreen = hs.screen.find(hs.spaces.mainScreen())
            local mainScreen = hs.screen.mainScreen()
            if dropdown == nil and hs.application.launchOrFocus(APP_NAME) then
                local appWatcher = nil
                print('create app watcher')
                appWatcher = hs.application.watcher.new(function(name, event, app)
                    print(name)
                    print(event)
                    if event == hs.application.watcher.launched and name == APP_NAME then
                        app:hide()
                        moveWindow(app, space, mainScreen)
                        appWatcher:stop()
                    end
                end)
                print('start watcher')
                appWatcher:start()
            end
            if dropdown ~= nil then
                moveWindow(dropdown, space, mainScreen)
            end
        end
    end)

    -- Hide dropdown if not in focus
    -- hs.window.filter.default:subscribe(hs.window.filter.windowFocused, function(window, appName)
    --     local dropdown = hs.application.get(APP_NAME)
    --     if dropdown ~= nil then
    --         dropdown:hide()
    --     end
    -- end)
end

hs.fnutils.each(dropdowns, function(item)
    init(item)
end)
