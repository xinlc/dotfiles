local wezterm = require('wezterm')
local platform = require('utils.platform')

-- local font = 'JetBrainsMono Nerd Font'
local font_size = platform().is_mac and 16 or 12

return {
  -- font = wezterm.font(font),
  font = wezterm.font_with_fallback({
    {
      family = 'MonaspiceKr NFM',
      harfbuzz_features = {
        'calt',
        'liga',
        'dlig',
        'ss01', -- ligatures related to the equals glyph like != and ===.
        'ss02', -- ligatures related to the greater than or less than operators.
        'ss03', -- ligatures related to arrows like -> and =>.
        'ss04', -- ligatures related to markup, like </ and />.
        'ss05=0', -- ligatures related to the F# programming language, like |>.
        'ss06', -- ligatures related to repeated uses of # such as ## or ###.
        'ss07', -- ligatures related to the asterisk like ***.
        'ss08', -- ligatures related to combinations like .= or .-.
      },
    },
    'LXGW WenKai Mono',
    'Broot Icons Visual Studio Code',
  }),
  font_size = font_size,

  -- ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
  freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
  freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
