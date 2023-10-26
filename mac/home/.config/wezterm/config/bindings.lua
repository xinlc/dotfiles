local wezterm = require('wezterm')
local platform = require('utils.platform')()
local act = wezterm.action

local mod = {}
mod.LEADER = 'LEADER'

if platform.is_mac then
  mod.SUPER = 'SUPER'
  mod.SUPER_REV = 'SUPER|CTRL'
elseif platform.is_win then
  mod.SUPER = 'ALT' -- to not conflict with Windows key shortcuts
  mod.SUPER_REV = 'ALT|CTRL'
end

local keys = {
  -- misc/useful --
  { key = 'F1', mods = 'NONE', action = 'ActivateCopyMode' },
  { key = 'F2', mods = 'NONE', action = act.ActivateCommandPalette },
  { key = 'P', mods = 'CMD|SHIFT', action = act.ActivateCommandPalette },
  { key = 'F3', mods = 'NONE', action = act.ShowLauncher },
  { key = 'F4', mods = 'NONE', action = act.ShowTabNavigator },
  { key = 'F12', mods = 'NONE', action = act.ShowDebugOverlay },
  { key = 'f', mods = mod.SUPER, action = act.Search({ CaseInSensitiveString = '' }) },
  { key = '[', mods = mod.LEADER, action = act.ActivateCopyMode },
  { key = ']', mods = mod.LEADER, action = act.QuickSelect },

  -- system
  { key = 'q', mods = mod.SUPER, action = act.QuitApplication },
  { key = 'Enter', mods = 'CTRL', action = act.ToggleFullScreen },
  { key = 'y', mods = mod.SUPER_REV, action = act.ScrollByLine(-1) },
  { key = 'e', mods = mod.SUPER_REV, action = act.ScrollByLine(1) },
  { key = 'f', mods = mod.SUPER_REV, action = act.ScrollByPage(-0.5) },
  { key = 'b', mods = mod.SUPER_REV, action = act.ScrollByPage(0.5) },

  -- copy/paste --
  { key = 'c', mods = mod.SUPER, action = act.CopyTo('Clipboard') },
  { key = 'v', mods = mod.SUPER, action = act.PasteFrom('Clipboard') },

  -- tabs --
  -- tabs: spawn+close
  { key = 't', mods = mod.SUPER, action = act.SpawnTab('DefaultDomain') },
  { key = 't', mods = mod.SUPER_REV, action = act.SpawnTab({ DomainName = 'WSL:Ubuntu' }) },
  { key = 'w', mods = mod.SUPER, action = act.CloseCurrentTab({ confirm = false }) },

  -- tabs: navigation
  { key = '[', mods = mod.SUPER, action = act.ActivateTabRelative(-1) },
  { key = ']', mods = mod.SUPER, action = act.ActivateTabRelative(1) },
  { key = '[', mods = mod.SUPER_REV, action = act.MoveTabRelative(-1) },
  { key = ']', mods = mod.SUPER_REV, action = act.MoveTabRelative(1) },
  { key = '1', mods = mod.SUPER, action = act({ ActivateTab = 0 }) },
  { key = '2', mods = mod.SUPER, action = act({ ActivateTab = 1 }) },
  { key = '3', mods = mod.SUPER, action = act({ ActivateTab = 2 }) },
  { key = '4', mods = mod.SUPER, action = act({ ActivateTab = 3 }) },
  { key = '5', mods = mod.SUPER, action = act({ ActivateTab = 5 }) },
  { key = 't', mods = mod.LEADER, action = act.ShowTabNavigator },

  -- window --
  -- spawn windows
  { key = 'n', mods = mod.SUPER, action = act.SpawnWindow },

  -- panes --
  -- panes: split panes
  {
    key = [["]],
    mods = mod.LEADER,
    action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
  },
  {
    key = [[%]],
    mods = mod.LEADER,
    action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
  },

  -- panes: zoom+close pane
  { key = 'z', mods = mod.LEADER, action = act.TogglePaneZoomState },
  { key = 'x', mods = mod.LEADER, action = act.CloseCurrentPane({ confirm = true }) },

  -- panes: navigation
  { key = 'k', mods = mod.LEADER, action = act.ActivatePaneDirection('Up') },
  { key = 'j', mods = mod.LEADER, action = act.ActivatePaneDirection('Down') },
  { key = 'h', mods = mod.LEADER, action = act.ActivatePaneDirection('Left') },
  { key = 'l', mods = mod.LEADER, action = act.ActivatePaneDirection('Right') },
  { key = 'q', mods = mod.LEADER, action = act.PaneSelect },

  -- key-tables --
  -- resizes fonts
  {
    key = 'f',
    mods = mod.LEADER,
    action = act.ActivateKeyTable({
      name = 'resize_font',
      one_shot = false,
      timemout_miliseconds = 1000,
    }),
  },
  -- resize panes
  {
    key = 'p',
    mods = mod.LEADER,
    action = act.ActivateKeyTable({
      name = 'resize_pane',
      one_shot = false,
      timemout_miliseconds = 1000,
    }),
  },
}

local key_tables = {
  resize_font = {
    { key = 'k', action = act.IncreaseFontSize },
    { key = 'j', action = act.DecreaseFontSize },
    { key = 'r', action = act.ResetFontSize },
    { key = 'Escape', action = 'PopKeyTable' },
    { key = 'q', action = 'PopKeyTable' },
  },
  resize_pane = {
    { key = 'k', action = act.AdjustPaneSize({ 'Up', 1 }) },
    { key = 'j', action = act.AdjustPaneSize({ 'Down', 1 }) },
    { key = 'h', action = act.AdjustPaneSize({ 'Left', 1 }) },
    { key = 'l', action = act.AdjustPaneSize({ 'Right', 1 }) },
    { key = 'o', action = act.RotatePanes('Clockwise') },
    { key = 'O', action = act.RotatePanes('CounterClockwise') },
    -- V12
    {
      key = '[',
      action = act.Multiple({
        act.SplitPane({ direction = 'Right', size = { Percent = 40 } }),
        act.SplitPane({ direction = 'Down', size = { Percent = 40 } }),
      }),
    },
    -- H12
    {
      key = ']',
      action = act.Multiple({
        act.SplitPane({ direction = 'Down', size = { Percent = 40 } }),
        act.SplitPane({ direction = 'Left', size = { Percent = 60 } }),
      }),
    },
    -- Square
    {
      key = ';',
      action = act.Multiple({
        act.SplitPane({ direction = 'Right', size = { Percent = 40 } }),
        act.SplitPane({ direction = 'Down', size = { Percent = 50 } }),
        act.SplitPane({ direction = 'Down', size = { Percent = 40 }, top_level = true }),
      }),
    },
    { key = 'Escape', action = 'PopKeyTable' },
    { key = 'q', action = 'PopKeyTable' },
  },
}

local mouse_bindings = {
  -- Ctrl-click will open the link under the mouse cursor
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.OpenLinkAtMouseCursor,
  },
  -- text and doesn't open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = act({ CompleteSelection = 'PrimarySelection' }),
  },
  -- Paste on right-click
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = act({ PasteFrom = 'Clipboard' }),
  },
}

return {
  disable_default_key_bindings = true,
  -- leader = { key = 'Space', mods = 'CTRL|SHIFT' },
  leader = { key = 'Space', mods = 'CTRL' },
  keys = keys,
  key_tables = key_tables,
  mouse_bindings = mouse_bindings,
}
