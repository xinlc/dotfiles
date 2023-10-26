local wezterm = require('wezterm')

local M = {}

M.setup = function()
  wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
    window:gui_window():maximize()
    window:gui_window():toggle_fullscreen()
  end)
end

return M
