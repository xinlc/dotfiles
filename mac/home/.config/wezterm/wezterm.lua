-- https://wezfurlong.org/wezterm/index.html
-- https://wezfurlong.org/wezterm/config/files.html
local wezterm = require("wezterm")
local act = wezterm.action

-- local wezdir = os.getenv("HOME") .. "/.config/wezterm"

local launch_menu = {}
local default_prog = {}
local set_environment_variables = {}

-- Shell
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  table.insert(launch_menu, {
    label = "PowerShell",
    args = { "powershell.exe", "-NoLogo" },
  })
  table.insert(launch_menu, {
    label = "WSL",
    args = { "wsl.exe", "--cd", "/home/" },
  })
  default_prog = { "powershell.exe", "-NoLogo" }
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
  table.insert(launch_menu, {
    label = "Bash",
    args = { "bash", "-l" },
  })
  default_prog = { "bash", "-l" }
else
  table.insert(launch_menu, {
    label = "Zsh",
    args = { "zsh", "-l" },
  })
  default_prog = { "zsh", "-l" }
end

function basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

-- Title
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local index = ""

  if #tabs > 1 then
    index = string.format("%d: ", tab.tab_index + 1)
  end

  local process = basename(pane.foreground_process_name)
  return { {
    Text = " " .. index .. process .. " ",
  } }
end)

-- Startup
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
  window:gui_window():toggle_fullscreen()
end)

local config = {
  check_for_updates = false,
  -- pane_focus_follows_mouse = true,
  default_cwd = "/Users/richard/Downloads",
  default_cursor_style = "BlinkingBar",
  -- color_scheme = 'Solarized Dark (base16)',
  -- color_scheme = "Solarized Dark Higher Contrast",
  color_scheme = "Catppuccin Mocha",

  -- Window
  -- adjust_window_size_when_changing_font_size = false,
  native_macos_fullscreen_mode = false,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE",
  -- window_background_image = '/Users/richard/Documents/img/im_alita.png',
  window_background_opacity = 0.95,
  text_background_opacity = 1.0,
  window_padding = {
    left = 5,
    right = 5,
    top = 5,
    bottom = 5,
  },
  window_background_image_hsb = {
    brightness = 0.7,
    hue = 1.0,
    saturation = 1.0,
  },

  -- Tab bar appearance
  hide_tab_bar_if_only_one_tab = true,
  enable_tab_bar = true,
  show_tab_index_in_tab_bar = true,
  -- tab_bar_at_bottom = true,
  -- use_fancy_tab_bar = false,

  inactive_pane_hsb = {
    hue = 1.0,
    saturation = 1.0,
    brightness = 1.0,
  },

  -- Font
  -- font = wezterm.font_with_fallback {{
  --     family = 'LXGW WenKai Mono'
  -- }, 'FiraCode Nerd Font Mono'},
  font = wezterm.font_with_fallback({ "FiraCode Nerd Font Mono", "LXGW WenKai Mono", "Broot Icons Visual Studio Code" }),
  font_size = 16,

  -- Keys
  -- 禁用默认键 https://wezfurlong.org/wezterm/config/default-keys.html
  disable_default_key_bindings = true,
  -- disable_default_mouse_bindings = true,

  -- Allow using ^ with single key press.
  -- use_dead_keys = false,

  leader = {
    key = "Space",
    -- key = 'a',
    mods = "CTRL",
    timeout_milliseconds = 1000,
  },

  keys = {
    {
      key = "P",
      mods = "CMD|SHIFT",
      action = act.ActivateCommandPalette,
    },
    {
      key = "q",
      mods = "CMD",
      action = act.QuitApplication,
    },
    {
      key = "F3",
      mods = "NONE",
      action = act.ShowLauncher,
    },
    {
      key = "F12",
      mods = "NONE",
      action = act.ShowDebugOverlay,
    },
    {
      key = "f",
      mods = "CMD",
      action = act.Search({
        CaseInSensitiveString = "",
      }),
    },
    { -- copy/paste --
      key = "c",
      mods = "CMD",
      action = act.CopyTo("Clipboard"),
    },
    {
      key = "v",
      mods = "CMD",
      action = act.PasteFrom("Clipboard"),
    },
    { -- tabs --
      key = "t",
      mods = "CMD",
      action = act.SpawnTab("DefaultDomain"),
    },
    {
      key = "w",
      mods = "CMD",
      action = act.CloseCurrentTab({
        confirm = false,
      }),
    },
    { -- tabs: navigation
      key = "[",
      mods = "ALT",
      action = act.ActivateTabRelative(-1),
    },
    {
      key = "]",
      mods = "ALT",
      action = act.ActivateTabRelative(1),
    },
    {
      key = "[",
      mods = "ALT|CTRL",
      action = act.MoveTabRelative(-1),
    },
    {
      key = "]",
      mods = "ALT|CTRL",
      action = act.MoveTabRelative(1),
    },
    { -- spawn windows
      key = "n",
      mods = "CMD",
      action = act.SpawnWindow,
    },
    { -- New/close pane
      key = "c",
      mods = "LEADER",
      action = act({
        SpawnTab = "CurrentPaneDomain",
      }),
    },
    {
      key = "x",
      mods = "LEADER",
      action = act({
        CloseCurrentPane = {
          confirm = true,
        },
      }),
    },
    {
      key = "X",
      mods = "LEADER",
      action = act({
        CloseCurrentTab = {
          confirm = true,
        },
      }),
    }, -- Pane navigation
    -- {
    --     key = 'h', -- LeftArrow
    --     mods = 'ALT',
    --     action = act {
    --         ActivatePaneDirection = 'Left'
    --     }
    -- }, {
    --     key = 'j', -- DownArrow
    --     mods = 'ALT',
    --     action = act {
    --         ActivatePaneDirection = 'Down'
    --     }
    -- }, {
    --     key = 'k', -- UpArrow
    --     mods = 'ALT',
    --     action = act {
    --         ActivatePaneDirection = 'Up'
    --     }
    -- }, {
    --     key = 'l', -- RightArrow
    --     mods = 'ALT',
    --     action = act {
    --         ActivatePaneDirection = 'Right'
    --     }
    -- },
    {
      key = "h",
      mods = "LEADER",
      action = act({
        ActivatePaneDirection = "Left",
      }),
    },
    {
      key = "j",
      mods = "LEADER",
      action = act({
        ActivatePaneDirection = "Down",
      }),
    },
    {
      key = "k",
      mods = "LEADER",
      action = act({
        ActivatePaneDirection = "Up",
      }),
    },
    {
      key = "l",
      mods = "LEADER",
      action = act({
        ActivatePaneDirection = "Right",
      }),
    },
    {
      key = "q",
      mods = "LEADER",
      action = act.PaneSelect,
    },
    {
      key = "Q",
      mods = "LEADER",
      action = act.PaneSelect({
        mode = "SwapWithActive",
      }),
    },
    {
      key = "z",
      mods = "LEADER",
      -- action = 'TogglePaneZoomState'
      action = act.TogglePaneZoomState,
    },
    { -- tab
      key = "1",
      mods = "CMD",
      action = act({
        ActivateTab = 0,
      }),
    },
    {
      key = "2",
      mods = "CMD",
      action = act({
        ActivateTab = 1,
      }),
    },
    {
      key = "3",
      mods = "CMD",
      action = act({
        ActivateTab = 2,
      }),
    },
    {
      key = "4",
      mods = "CMD",
      action = act({
        ActivateTab = 3,
      }),
    },
    {
      key = "5",
      mods = "CMD",
      action = act({
        ActivateTab = 4,
      }),
    },
    {
      key = "6",
      mods = "CMD",
      action = act({
        ActivateTab = 5,
      }),
    },
    {
      key = "7",
      mods = "CMD",
      action = act({
        ActivateTab = 6,
      }),
    },
    {
      key = "8",
      mods = "CMD",
      action = act({
        ActivateTab = 7,
      }),
    },
    {
      key = "9",
      mods = "CMD",
      action = act({
        ActivateTab = 8,
      }),
    },
    {
      key = "0",
      mods = "CMD",
      action = act({
        ActivateTab = -1,
      }),
    },
    {
      key = "w",
      mods = "LEADER",
      action = "ShowTabNavigator",
    },
    {
      key = "L",
      mods = "LEADER",
      action = "ActivateLastTab",
    },
    {
      key = "p",
      mods = "LEADER",
      action = act({
        ActivateTabRelative = -1,
      }),
    },
    {
      key = "n",
      mods = "LEADER",
      action = act({
        ActivateTabRelative = 1,
      }),
    }, -- Split
    {
      key = '"',
      mods = "LEADER",
      action = act.SplitVertical({
        domain = "CurrentPaneDomain",
      }),
    },
    {
      key = "%",
      mods = "LEADER",
      action = act.SplitHorizontal({
        domain = "CurrentPaneDomain",
      }),
    }, -- Copy/paste buffer
    {
      key = "[",
      mods = "LEADER",
      action = "ActivateCopyMode",
    },
    {
      key = "]",
      mods = "LEADER",
      action = "QuickSelect",
    }, -- key_tables
    {
      key = "r",
      mods = "LEADER",
      action = act.ActivateKeyTable({
        name = "resize_pane",
        one_shot = false,
      }),
    },
    {
      key = "a",
      mods = "LEADER",
      action = act.ActivateKeyTable({
        name = "activate_pane",
        timeout_milliseconds = 1500,
      }),
    },
    {
      key = "Enter",
      mods = "CTRL",
      action = act.ToggleFullScreen,
    },
    {
      key = "y",
      mods = "CTRL|CMD",
      action = act.ScrollByLine(-1),
    },
    {
      key = "e",
      mods = "CTRL|CMD",
      action = act.ScrollByLine(1),
    },
    {
      key = "u",
      mods = "CTRL|CMD",
      action = act.ScrollByPage(-0.5),
    },
    {
      key = "d",
      mods = "CTRL|CMD",
      action = act.ScrollByPage(0.5),
    },
  },
  key_tables = {
    -- Defines the keys that are active in our resize-pane mode.
    -- Since we're likely to want to make multiple adjustments,
    -- we made the activation one_shot=false. We therefore need
    -- to define a key assignment for getting out of this mode.
    -- 'resize_pane' here corresponds to the name="resize_pane" in
    -- the key assignments above.
    resize_pane = {
      {
        key = "LeftArrow",
        action = act.AdjustPaneSize({ "Left", 5 }),
      },
      {
        key = "h",
        action = act.AdjustPaneSize({ "Left", 5 }),
      },
      {
        key = "RightArrow",
        action = act.AdjustPaneSize({ "Right", 5 }),
      },
      {
        key = "l",
        action = act.AdjustPaneSize({ "Right", 5 }),
      },
      {
        key = "UpArrow",
        action = act.AdjustPaneSize({ "Up", 5 }),
      },
      {
        key = "k",
        action = act.AdjustPaneSize({ "Up", 5 }),
      },
      {
        key = "DownArrow",
        action = act.AdjustPaneSize({ "Down", 5 }),
      },
      {
        key = "j",
        action = act.AdjustPaneSize({ "Down", 5 }),
      },
      {
        key = "o",
        -- mods = 'CTRL',
        action = act.RotatePanes("Clockwise"),
      },
      {
        key = "O",
        -- mods = 'ALT',
        action = act.RotatePanes("CounterClockwise"),
      }, -- V12
      {
        key = "[",
        action = act.Multiple({
          act.SplitPane({
            direction = "Right",
            size = {
              Percent = 40,
            },
          }),
          act.SplitPane({
            direction = "Down",
            size = {
              Percent = 40,
            },
          }),
        }),
      }, -- H12
      {
        key = "]",
        action = act.Multiple({
          act.SplitPane({
            direction = "Down",
            size = {
              Percent = 40,
            },
          }),
          act.SplitPane({
            direction = "Left",
            size = {
              Percent = 60,
            },
          }),
        }),
      }, -- Square
      {
        key = ";",
        -- mods = 'CMD',
        action = act.Multiple({
          act.SplitPane({
            direction = "Right",
            size = {
              Percent = 40,
            },
          }),
          act.SplitPane({
            direction = "Down",
            size = {
              Percent = 50,
            },
          }),
          act.SplitPane({
            direction = "Down",
            size = {
              Percent = 40,
            },
            top_level = true,
          }),
        }),
      }, -- Cancel the mode by pressing escape
      {
        key = "Escape",
        action = "PopKeyTable",
      },
    },

    -- Defines the keys that are active in our activate-pane mode.
    -- 'activate_pane' here corresponds to the name="activate_pane" in
    -- the key assignments above.
    activate_pane = {
      {
        key = "LeftArrow",
        action = act.ActivatePaneDirection("Left"),
      },
      {
        key = "h",
        action = act.ActivatePaneDirection("Left"),
      },
      {
        key = "RightArrow",
        action = act.ActivatePaneDirection("Right"),
      },
      {
        key = "l",
        action = act.ActivatePaneDirection("Right"),
      },
      {
        key = "UpArrow",
        action = act.ActivatePaneDirection("Up"),
      },
      {
        key = "k",
        action = act.ActivatePaneDirection("Up"),
      },
      {
        key = "DownArrow",
        action = act.ActivatePaneDirection("Down"),
      },
      {
        key = "j",
        action = act.ActivatePaneDirection("Down"),
      },
    },
  },

  mouse_bindings = { -- Paste on right-click
    {
      event = {
        Down = {
          streak = 1,
          button = "Right",
        },
      },
      mods = "NONE",
      action = act({
        PasteFrom = "Clipboard",
      }),
    }, -- Change the default click behavior so that it only selects
    -- text and doesn't open hyperlinks
    {
      event = {
        Up = {
          streak = 1,
          button = "Left",
        },
      },
      mods = "NONE",
      action = act({
        CompleteSelection = "PrimarySelection",
      }),
    }, -- CTRL-Click open hyperlinks
    {
      event = {
        Up = {
          streak = 1,
          button = "Left",
        },
      },
      mods = "CTRL",
      action = "OpenLinkAtMouseCursor",
    },
  },

  default_prog = default_prog,
  set_environment_variables = set_environment_variables,
  launch_menu = launch_menu,
}

return config
