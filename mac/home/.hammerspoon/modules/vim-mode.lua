--------------------------------
-- START VIM CONFIG - https://github.com/dbalatero/VimMode.spoon
--------------------------------
local VimMode = hs.loadSpoon("VimMode")
local vim = VimMode:new()

-- Configure apps you do *not* want Vim mode enabled in
-- For example, you don't want this plugin overriding your control of Terminal
-- vim
vim
  :disableForApp('Code')
  :disableForApp('iTerm2')
  :disableForApp('Terminal')
  :disableForApp("Alacritty")
  :disableForApp("WezTerm")
  :disableForApp("Visual Studio Code")
  :disableForApp('IntelliJ IDEA')

-- If you want the screen to dim (a la Flux) when you enter normal mode
-- flip this to true.
vim:shouldDimScreenInNormalMode(false)
-- vim:shouldDimScreenInNormalMode(true)

-- If you want to show an on-screen alert when you enter normal mode, set
-- this to true
vim:shouldShowAlertInNormalMode(true)

-- You can configure your on-screen alert font
vim:setAlertFont("Courier New")

-- Enter normal mode by typing a key sequence
-- vim:enterWithSequence('jk', 100)

-- Change to block cursor in normal mode
vim:enableBetaFeature('block_cursor_overlay')

vim:enableBetaFeature('fallback_only_urls')

-- When entering normal mode on any URL that matches any of the patterns below,
-- we will enforce fallback mode.
vim:setFallbackOnlyUrlPatterns({
  "docs.google.com",
})

-- if you want to bind a single key to entering vim, remove the
-- :enterWithSequence('jk') line above and uncomment the bindHotKeys line
-- below:
--
-- To customize the hot key you want, see the mods and key parameters at:
--   https://www.hammerspoon.org/docs/hs.hotkey.html#bind
--
vim:bindHotKeys({ enter = { {'ctrl', 'cmd'}, ';' } })

--------------------------------
-- END VIM CONFIG
--------------------------------
