--------------------------------------------------------------------
---------------------- 输入法自动切换及提醒 ---------------------------
--------------------------------------------------------------------
custom_config = hs.fs.pathToAbsolute(os.getenv("HOME") .. '/.config/hammerspoon/private/config.lua')

local inputEnglish = "com.apple.keylayout.ABC"
local inputChinese = "com.apple.inputmethod.SCIM.ITABC"

local function Chinese()
  -- hs.keycodes.currentSourceID("com.sogou.inputmethod.sogou.pinyin")
  hs.keycodes.currentSourceID(inputChinese)
end

local function English()
  hs.keycodes.currentSourceID(inputEnglish)
end

-- app to expected ime config
local app2Ime = hsime_config or {
  {'/Applications/iTerm.app', 'English'},
  {'/Applications/Visual Studio Code.app', 'English'},
  {'/Applications/Notion.app', 'Chinese'},
  -- {'/Applications/Xcode.app', 'English'},
  {'/Applications/Google Chrome.app', 'English'},
  {'/System/Library/CoreServices/Finder.app', 'English'},
  -- {'/Applications/DingTalk.app', 'Chinese'},
  -- {'/Applications/Kindle.app', 'English'},
  {'/Applications/NeteaseMusic.app', 'Chinese'},
  {'/Applications/WeChat.app', 'Chinese'},
  {'/Applications/企业微信.app', 'Chinese'},
  {'/Applications/System Preferences.app', 'English'},
  {'/Applications/Dash.app', 'English'},
  {'/Applications/MindNode.app', 'Chinese'},
  {'/Applications/Preview.app', 'Chinese'},
  {'/Applications/wechatwebdevtools.app', 'English'},
  -- {'/Applications/Sketch.app', 'English'},
}
local showChangeAlert = hsime_change

function updateFocusAppInputMethod()
  local focusAppPath = hs.window.frontmostWindow():application():path()
  for index, app in pairs(app2Ime) do
      local appPath = app[1]
      local expectedIme = app[2]
      if focusAppPath == appPath then
          if expectedIme == 'English' then
              English()
          else
              Chinese()
          end
          break
      end
  end
end

-- helper hotkey to figure out the app path and name of current focused window
-- 展示当前输入法source ID及app名称
hs.hotkey.bind({'ctrl', 'cmd'}, ".", function()
  hs.alert.show("App path:        "
  ..hs.window.focusedWindow():application():path()
  .."\n"
  .."IM source id:  "
  ..hs.keycodes.currentSourceID())
end)

-- Handle cursor focus and application's screen manage.
function applicationWatcher(appName, eventType, appObject)
  if (eventType == hs.application.watcher.activated) then
      updateFocusAppInputMethod()
  end
end

function showMsgAtTopRight(msg)
  hs.alert.closeAll()
  hs.alert.show(msg, {
    atScreenEdge = 2
  })
end

-- 监听输入法切换
if (showChangeAlert) then
  local lastInputSourceID = hs.keycodes.currentSourceID();
  function inputSourceChangeWatcher()
    local currentInputSource = hs.keycodes.currentSourceID();
    if (lastInputSourceID ~= currentInputSource) then
      lastInputSourceID = currentInputSource
      if (currentInputSource == inputEnglish) then
        showMsgAtTopRight('英文输入');
      end

      if (currentInputSource == inputChinese) then
        showMsgAtTopRight('中文输入');
      end
    end
  end
  hs.keycodes.inputSourceChanged(inputSourceChangeWatcher)
end

appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
