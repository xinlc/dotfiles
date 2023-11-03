local wezterm = require('wezterm')
local math = require('utils.math')
local M = {}

M.separator_char = ' '

M.colors = {
  date_fg = '#fab387',
  date_bg = '#181825',
  battery_fg = '#f9e2af',
  battery_bg = '#181825',
  separator_fg = '#74c7ec',
  separator_bg = '#181825',
}

M.cells = {} -- wezterm FormatItems (ref: https://wezfurlong.org/wezterm/config/lua/wezterm/format.html)

---@param text string
---@param icon string
---@param fg string
---@param bg string
---@param separate boolean
M.push = function(text, icon, fg, bg, separate)
  table.insert(M.cells, { Foreground = { Color = fg } })
  table.insert(M.cells, { Background = { Color = bg } })
  table.insert(M.cells, { Attribute = { Intensity = 'Bold' } })
  table.insert(M.cells, { Text = icon .. ' ' .. text .. ' ' })

  if separate then
    table.insert(M.cells, { Foreground = { Color = M.colors.separator_fg } })
    table.insert(M.cells, { Background = { Color = M.colors.separator_bg } })
    table.insert(M.cells, { Text = M.separator_char })
  end

  table.insert(M.cells, 'ResetAttributes')
end

M.set_date = function()
  local date = wezterm.strftime('%m/%d %H:%M')
  M.push(date, '', M.colors.date_fg, M.colors.date_bg, true)
end

M.set_battery = function()
  -- ref: https://wezfurlong.org/wezterm/config/lua/wezterm/battery_info.html
  -- ref: https://www.nerdfonts.com/cheat-sheet
  -- local charging_icons = { '\u{f089f}', '\u{f089c}', '\u{f0086}', '\u{f0087}', '\u{f0088}', '\u{f089d}', '\u{f0089}', '\u{f089e}', '\u{f008a}', '\u{f008b}', '\u{f0085}', }
  -- local discharging_icons = { '\u{f008e}', '\u{f007a}', '\u{f007b}', '\u{f007c}', '\u{f007d}', '\u{f007e}', '\u{f007f}', '\u{f0080}', '\u{f0081}', '\u{f0082}', '\u{f0079}', }
  local charging_icons = { '󰢜', '󰂆', '󰂇', '󰂈', '󰢝', '󰂉', '󰢞', '󰂊', '󰂋', '󰂅' }
  local discharging_icons = { '󰂎', '󰁺', '󰁻', '󰁼', '󰁽', '󰁾', '󰁿', '󰂀', '󰂁', '󰁹' }
  local charge = ''
  local icon = ''

  for _, b in ipairs(wezterm.battery_info()) do
    local idx = math.clamp(math.round(b.state_of_charge * 10), 1, 10)
    charge = string.format('%.0f%%', b.state_of_charge * 100)

    if b.state == 'Charging' then
      icon = charging_icons[idx]
    else
      icon = discharging_icons[idx]
    end
  end

  M.push(charge, icon, M.colors.battery_fg, M.colors.battery_bg, false)
end

M.setup = function()
  wezterm.on('update-right-status', function(window, _pane)
    M.cells = {}
    M.set_date()
    M.set_battery()

    window:set_right_status(wezterm.format(M.cells))
  end)
end

return M
