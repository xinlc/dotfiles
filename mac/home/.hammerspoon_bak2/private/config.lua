----------------------------------------- 配 置 文 件 -----------------------------------------------

----------------------------------------------------------------------------------------------------

--指定要启用的模块
hspoon_list = {
    "AClock",
    "ClipShow",
    "CountDown",
    "KSheet",
    "WinWin",
    "VolumeScroll",
    "PopupTranslateSelection",
    -- "DeepLTranslate"
    -- "HSaria2"
    -- "HSearch"
    --"SpeedMenu",
    -- "MountedVolumes",
    -- "HeadphoneAutoPause",
}

----------------------------------------------------------------------------------------------------
----------------------------------------- 快速启动配置  ----------------------------------------------

-- 绑定 启动 app 快捷键

hsapp_list = {
    {key = 'a', name = 'Alacritty'},
    {key = 'c', id = 'com.google.Chrome'},
    {key = 'e', name = '印象笔记'},
    {key = 'f', name = 'Finder'},
    {key = 'i', name = 'kitty'},
    {key = 'j', name = 'Typora'},
    {key = 'o', name = 'Obsidian'},
    {key = 'k', name = 'Keynote'},
    {key = 's', name = 'Sublime Text'},
    {key = 'p', name = 'Podcasts'},
    {key = 't', name = 'Terminal'},
    {key = 'v', id = 'com.apple.ActivityMonitor'},
    {key = 'b', id = 'vsCode.app'},
    {key = 'm', name = 'Mweb'},
    {key = 'w', name = 'WeChat'},
    {key = 'x', name = 'Thunder'},
    {key = 'y', id = 'com.apple.systempreferences'},
}


----------------------------------------------------------------------------------------------------
---------------------------------------- 模式快捷键绑定  ----------------------------------------------

-- 窗口提示键绑定，快速切换到你想要的窗口上
hswhints_keys = {"alt", "tab"}

-- 快速启动面板快捷键绑定
hsappM_keys = {"alt", "A"}

-- 系统剪切板快捷键绑定
hsclipsM_keys = {"alt", "C"}


-- 在默认浏览器中打开 Hammerspoon 和 Spoons API 手册
--hsman_keys = {"alt", "H"}

-- 倒计时快捷键绑定
hscountdM_keys = {"alt", "I"}

-- 锁定电脑快捷键绑定
--hslock_keys = {"alt", "L"}

-- 窗口自定义大小及位置快捷键绑定
hsresizeM_keys = {"alt", "R"}

-- 定义应用程序快捷键面板快捷键
hscheats_keys = {"alt", "S"}

-- 显示时钟快捷键绑定
hsaclock_keys = {"alt", "w"}

-- 粘贴 chrome 或 safari 打开最前置的网址
hstype_keys = {"alt", "V"}

-- 显示 Hammerspoon 控制台
hsconsole_keys = {"alt", "Z"}

-- 显示 MountedVolumes
hstype_keys = {"alt", "M"}

-- 显示搜索
hsearch_keys = {"alt", "G"}

----------------------------------------------------------------------------------------------------
--------------------------------- hammerspoon 快捷键绑定配置  -----------------------------------------

-- 临时禁用所有快捷键(注意：只能手动接禁。)
hsupervisor_keys = {{"cmd", "shift", "ctrl"}, "Q"}

-- 重新加载配置文件
hsreload_keys = {{"cmd", "shift", "ctrl"}, "R"}

-- 显示各种模式绑定快捷键
hshelp_keys = {{"alt", "shift"}, "/"}


----------------------------------------------------------------------------------------------------
---------------------------------------------- end  ------------------------------------------------
----------------------------------------------------------------------------------------------------

---------------------------------------------- 自定义配置  ------------------------------------------------

-------------- 实现 Alacritty Quake style(drop down) 功能 --------------
---- https://github.com/alacritty/alacritty/issues/1119/
---- https://github.com/alacritty/alacritty/issues/862/

-- hs.hotkey.bind({"ctrl"}, ",", function()
--     -- alacritty = hs.application.find('alacritty')
--     local alacritty = hs.application.get('Alacritty')
--     if alacritty ~= nil and alacritty:isFrontmost() then
--       alacritty:hide()
--     else
--       hs.application.launchOrFocus("/Applications/Alacritty.app")
--       local alacritty = hs.application.get('Alacritty')
--       alacritty.setFrontmost(alacritty)
--       alacritty.activate(alacritty)
--     end
--   end
-- )

---- https://world.hey.com/jonash/alacritty-drop-down-guake-quake-style-terminal-setup-on-macos-6eef7d73
---- https://github.com/asmagill/hs._asm.spaces
---- https://www.hammerspoon.org/docs/hs.spaces.html

-- Switch Alacritty
hs.hotkey.bind({'ctrl'}, ',', function ()
  local APP_NAME = 'Alacritty'
  function moveWindow(alacritty, space, mainScreen)
    -- move to main space
    local win = nil
    while win == nil do
      win = alacritty:mainWindow()
    end
    -- print(win)
    -- print(space)
    -- print(win:screen())
    -- print(mainScreen)
    local fullScreen = not win:isStandard()
    -- if fullScreen then
    --   hs.eventtap.keyStroke('cmd', 'return', 0, alacritty)
    -- end
    winFrame = win:frame()
    scrFrame = mainScreen:fullFrame()
    -- print(winFrame)
    -- print(scrFrame)
    winFrame.w = scrFrame.w
    winFrame.y = scrFrame.y
    winFrame.x = scrFrame.x
    -- print(winFrame)
    win:setFrame(winFrame, 0)
    -- print(win:frame())
    hs.spaces.moveWindowToSpace(win, space)
    -- win:spacesMoveTo(space)
    -- if fullScreen then
    --   hs.eventtap.keyStroke('cmd', 'return', 0, alacritty)
    -- end
    win:focus()
  end

  local alacritty = hs.application.get(APP_NAME)
  if alacritty ~= nil and alacritty:isFrontmost() then
    alacritty:hide()
  else
    local space = hs.spaces.focusedSpace()
    -- local mainScreen = hs.screen.find(hs.spaces.mainScreen())
    local mainScreen = hs.screen.mainScreen()
    if alacritty == nil and hs.application.launchOrFocus(APP_NAME) then
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
    if alacritty ~= nil then
      moveWindow(alacritty, space, mainScreen)
    end
  end
end)

-- Hide alacritty if not in focus
hs.window.filter.default:subscribe(hs.window.filter.windowFocused, function(window, appName)
  local alacritty = hs.application.get('Alacritty')
  if alacritty ~= nil then
     alacritty:hide()
  end
end)

-------------- END -- 实现 Alacritty Quake style(drop down) 功能 -- END --------------
