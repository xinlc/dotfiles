local wezterm = require('wezterm')
local platform = require('utils.platform')

-- local font = 'JetBrainsMono Nerd Font'
local font_size = platform().is_mac and 16 or 12

return {
  -- font = wezterm.font(font),
  font = wezterm.font_with_fallback({ 'FiraCode Nerd Font Mono', 'LXGW WenKai Mono', 'JetBrainsMono Nerd Font Mono', 'Broot Icons Visual Studio Code' }),
  font_size = font_size,

  -- ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
  freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
  freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
