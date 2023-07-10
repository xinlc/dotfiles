-- https://wezfurlong.org/wezterm/index.html
-- https://wezfurlong.org/wezterm/config/files.html
local wezterm = require 'wezterm'
local act = wezterm.action

local launch_menu = {}
local default_prog = {}
local set_environment_variables = {}

-- Using shell
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    term = '' -- Set to empty so FZF works on windows
    table.insert(launch_menu, {
        label = 'PowerShell',
        args = {'pwsh.exe', '-NoLogo'}
    })
    table.insert(launch_menu, {
        label = 'CMD',
        args = {'cmd.exe'}
    })
    default_prog = {'pwsh.exe', '-NoLogo'}
elseif wezterm.target_triple == 'x86_64-apple-darwin' then
    table.insert(launch_menu, {
        label = 'zsh',
        args = {'/usr/local/bin/zsh', '-l'}
    })
    default_prog = {'/usr/local/bin/zsh', '-l'}
elseif wezterm.target_triple == 'aarch64-apple-darwin' then
    table.insert(launch_menu, {
        label = 'zsh',
        args = {'/opt/homebrew/bin/zsh', '-l'}
    })
    default_prog = {'/opt/homebrew/bin/zsh', '-l'}
end

function basename(s)
    return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

-- Title
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local pane = tab.active_pane
    local title = basename(pane.foreground_process_name)

    return {{
        Text = ' ' .. title .. ' '
    }}
end)

-- Initial startup
wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
    window:gui_window():maximize()
    window:gui_window():toggle_fullscreen()
end)

local config = {
    check_for_updates = false,
    -- pane_focus_follows_mouse = true,
    default_cwd = "/Users/richard/Downloads",
    default_cursor_style = 'BlinkingBar',
    -- color_scheme = 'Solarized Dark (base16)',
    color_scheme = 'Solarized Dark Higher Contrast',

    -- Window
    -- adjust_window_size_when_changing_font_size = false,
    window_close_confirmation = 'NeverPrompt',
    window_decorations = 'RESIZE',
    -- window_background_image = '/Users/richard/Documents/img/im_alita.png',
    window_background_opacity = 0.92,
    text_background_opacity = 1.0,
    window_padding = {
        left = 5,
        right = 5,
        top = 5,
        bottom = 5
    },
    window_background_image_hsb = {
        brightness = 0.7,
        hue = 1.0,
        saturation = 1.0
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
        brightness = 1.0
    },

    -- Font
    font = wezterm.font_with_fallback {{
        family = 'FiraCode Nerd Font'
    }, 'FiraCode NF'},
    font_size = 16,

    -- Keys
    -- 禁用默认键 https://wezfurlong.org/wezterm/config/default-keys.html
    -- disable_default_key_bindings = true,
    -- disable_default_mouse_bindings = true,

    -- Allow using ^ with single key press.
    -- use_dead_keys = false,

    leader = {
        key = 'Space',
        -- key = 'a',
        mods = 'CTRL',
        timeout_milliseconds = 1000
    },

    keys = {{ -- New/close pane
        key = 'c',
        mods = 'LEADER',
        action = wezterm.action {
            SpawnTab = 'CurrentPaneDomain'
        }
    }, {
        key = 'x',
        mods = 'LEADER',
        action = wezterm.action {
            CloseCurrentPane = {
                confirm = true
            }
        }
    }, {
        key = 'X',
        mods = 'LEADER',
        action = wezterm.action {
            CloseCurrentTab = {
                confirm = true
            }
        }
    }, -- Pane navigation
    {
        key = 'h', -- LeftArrow
        mods = 'ALT',
        action = wezterm.action {
            ActivatePaneDirection = 'Left'
        }
    }, {
        key = 'j', -- DownArrow
        mods = 'ALT',
        action = wezterm.action {
            ActivatePaneDirection = 'Down'
        }
    }, {
        key = 'k', -- UpArrow
        mods = 'ALT',
        action = wezterm.action {
            ActivatePaneDirection = 'Up'
        }
    }, {
        key = 'l', -- RightArrow
        mods = 'ALT',
        action = wezterm.action {
            ActivatePaneDirection = 'Right'
        }
    }, {
        key = 'h',
        mods = 'LEADER',
        action = wezterm.action {
            ActivatePaneDirection = 'Left'
        }
    }, {
        key = 'j',
        mods = 'LEADER',
        action = wezterm.action {
            ActivatePaneDirection = 'Down'
        }
    }, {
        key = 'k',
        mods = 'LEADER',
        action = wezterm.action {
            ActivatePaneDirection = 'Up'
        }
    }, {
        key = 'l',
        mods = 'LEADER',
        action = wezterm.action {
            ActivatePaneDirection = 'Right'
        }
    }, {
        key = 'q',
        mods = 'LEADER',
        action = wezterm.action.PaneSelect
    }, {
        key = 'Q',
        mods = 'LEADER',
        action = act.PaneSelect {
            mode = 'SwapWithActive'
        }
    }, {
        key = 'z',
        mods = 'LEADER',
        -- action = 'TogglePaneZoomState'
        action = wezterm.action.TogglePaneZoomState
    }, { -- tab
        key = '1',
        mods = 'CMD',
        action = wezterm.action {
            ActivateTab = 0
        }
    }, {
        key = '2',
        mods = 'CMD',
        action = wezterm.action {
            ActivateTab = 1
        }
    }, {
        key = '3',
        mods = 'CMD',
        action = wezterm.action {
            ActivateTab = 2
        }
    }, {
        key = '4',
        mods = 'CMD',
        action = wezterm.action {
            ActivateTab = 3
        }
    }, {
        key = '5',
        mods = 'CMD',
        action = wezterm.action {
            ActivateTab = 4
        }
    }, {
        key = '6',
        mods = 'CMD',
        action = wezterm.action {
            ActivateTab = 5
        }
    }, {
        key = '7',
        mods = 'CMD',
        action = wezterm.action {
            ActivateTab = 6
        }
    }, {
        key = '8',
        mods = 'CMD',
        action = wezterm.action {
            ActivateTab = 7
        }
    }, {
        key = '9',
        mods = 'CMD',
        action = wezterm.action {
            ActivateTab = 8
        }
    }, {
        key = 'w',
        mods = 'LEADER',
        action = 'ShowTabNavigator'
    }, {
        key = 'L',
        mods = 'LEADER',
        action = 'ActivateLastTab'
    }, {
        key = 'p',
        mods = 'LEADER',
        action = wezterm.action {
            ActivateTabRelative = -1
        }
    }, {
        key = 'n',
        mods = 'LEADER',
        action = wezterm.action {
            ActivateTabRelative = 1
        }
    }, -- Split
    {
        key = '"',
        mods = 'LEADER',
        action = wezterm.action.SplitVertical {
            domain = 'CurrentPaneDomain'
        }
    }, {
        key = '%',
        mods = 'LEADER',
        action = wezterm.action.SplitHorizontal {
            domain = 'CurrentPaneDomain'
        }
    }, -- Copy/paste buffer
    {
        key = '[',
        mods = 'LEADER',
        action = 'ActivateCopyMode'
    }, {
        key = ']',
        mods = 'LEADER',
        action = 'QuickSelect'
    }, -- key_tables
    {
        key = 'r',
        mods = 'LEADER',
        action = wezterm.action.ActivateKeyTable {
            name = 'resize_pane',
            one_shot = false
        }
    }, {
        key = 'a',
        mods = 'LEADER',
        action = wezterm.action.ActivateKeyTable {
            name = 'activate_pane',
            timeout_milliseconds = 1500
        }
    }, {
        key = 'Enter',
        mods = 'CTRL',
        action = wezterm.action.ToggleFullScreen
    }, {
        key = 'y',
        mods = 'CTRL|CMD',
        action = wezterm.action.ScrollByLine(-1)
    }, {
        key = 'e',
        mods = 'CTRL|CMD',
        action = wezterm.action.ScrollByLine(1)
    }, {
        key = 'u',
        mods = 'CTRL|CMD',
        action = wezterm.action.ScrollByPage(-0.5)
    }, {
        key = 'd',
        mods = 'CTRL|CMD',
        action = wezterm.action.ScrollByPage(0.5)
    }},
    key_tables = {
        -- Defines the keys that are active in our resize-pane mode.
        -- Since we're likely to want to make multiple adjustments,
        -- we made the activation one_shot=false. We therefore need
        -- to define a key assignment for getting out of this mode.
        -- 'resize_pane' here corresponds to the name="resize_pane" in
        -- the key assignments above.
        resize_pane = {{
            key = 'LeftArrow',
            action = wezterm.action.AdjustPaneSize {'Left', 5}
        }, {
            key = 'h',
            action = wezterm.action.AdjustPaneSize {'Left', 5}
        }, {
            key = 'RightArrow',
            action = wezterm.action.AdjustPaneSize {'Right', 5}
        }, {
            key = 'l',
            action = wezterm.action.AdjustPaneSize {'Right', 5}
        }, {
            key = 'UpArrow',
            action = wezterm.action.AdjustPaneSize {'Up', 5}
        }, {
            key = 'k',
            action = wezterm.action.AdjustPaneSize {'Up', 5}
        }, {
            key = 'DownArrow',
            action = wezterm.action.AdjustPaneSize {'Down', 5}
        }, {
            key = 'j',
            action = wezterm.action.AdjustPaneSize {'Down', 5}
        }, {
            key = 'o',
            -- mods = 'CTRL',
            action = wezterm.action.RotatePanes 'Clockwise'
        }, {
            key = 'O',
            -- mods = 'ALT',
            action = wezterm.action.RotatePanes 'CounterClockwise'
        }, -- V12
        {
            key = '[',
            action = wezterm.action.Multiple {wezterm.action.SplitPane {
                direction = 'Right',
                size = {
                    Percent = 40
                }
            }, wezterm.action.SplitPane {
                direction = 'Down',
                size = {
                    Percent = 40
                }
            }}
        }, -- H12
        {
            key = ']',
            action = wezterm.action.Multiple {wezterm.action.SplitPane {
                direction = 'Down',
                size = {
                    Percent = 40
                }
            }, wezterm.action.SplitPane {
                direction = 'Left',
                size = {
                    Percent = 60
                }
            }}
        }, -- Square
        {
            key = ';',
            -- mods = 'CMD',
            action = wezterm.action.Multiple {wezterm.action.SplitPane {
                direction = 'Right',
                size = {
                    Percent = 40
                }
            }, wezterm.action.SplitPane {
                direction = 'Down',
                size = {
                    Percent = 50
                }
            }, wezterm.action.SplitPane {
                direction = 'Down',
                size = {
                    Percent = 40
                },
                top_level = true
            }}
        }, -- Cancel the mode by pressing escape
        {
            key = 'Escape',
            action = 'PopKeyTable'
        }},

        -- Defines the keys that are active in our activate-pane mode.
        -- 'activate_pane' here corresponds to the name="activate_pane" in
        -- the key assignments above.
        activate_pane = {{
            key = 'LeftArrow',
            action = wezterm.action.ActivatePaneDirection 'Left'
        }, {
            key = 'h',
            action = wezterm.action.ActivatePaneDirection 'Left'
        }, {
            key = 'RightArrow',
            action = wezterm.action.ActivatePaneDirection 'Right'
        }, {
            key = 'l',
            action = wezterm.action.ActivatePaneDirection 'Right'
        }, {
            key = 'UpArrow',
            action = wezterm.action.ActivatePaneDirection 'Up'
        }, {
            key = 'k',
            action = wezterm.action.ActivatePaneDirection 'Up'
        }, {
            key = 'DownArrow',
            action = wezterm.action.ActivatePaneDirection 'Down'
        }, {
            key = 'j',
            action = wezterm.action.ActivatePaneDirection 'Down'
        }}
    },

    mouse_bindings = { -- Paste on right-click
    {
        event = {
            Down = {
                streak = 1,
                button = 'Right'
            }
        },
        mods = 'NONE',
        action = wezterm.action {
            PasteFrom = 'Clipboard'
        }
    }, -- Change the default click behavior so that it only selects
    -- text and doesn't open hyperlinks
    {
        event = {
            Up = {
                streak = 1,
                button = 'Left'
            }
        },
        mods = 'NONE',
        action = wezterm.action {
            CompleteSelection = 'PrimarySelection'
        }
    }, -- CTRL-Click open hyperlinks
    {
        event = {
            Up = {
                streak = 1,
                button = 'Left'
            }
        },
        mods = 'CTRL',
        action = 'OpenLinkAtMouseCursor'
    }},

    default_prog = default_prog,
    set_environment_variables = set_environment_variables,
    launch_menu = launch_menu
}

return config
