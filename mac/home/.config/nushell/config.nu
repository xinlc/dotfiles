
##################自定义配置#####################
## config nu
## source ~/.config/nushell/config.nu

# use B

# use alias.nu *
use ./modules/alias.nu *
use ./modules/functions.nu *
use ./modules/env.nu *
# use path.nu *
use ./modules/lab.nu *

source ./modules/plugins.nu
source ./modules/completions.nu

use ./modules/mappings.nu get-mappings
use ./modules/menus.nu get-menus
use ./modules/theme.nu get-theme

# use E

# 覆盖默认配置
let custom_config = {
  # true or false to enable or disable the welcome banner at startup
  show_banner: false
  rm: {
    always_trash: true # always act as if -t was given. Can be overridden with -p
  }
  history: {
    max_size: 100 # Session has to be reloaded for this to take effect
  }
  completions: {
    algorithm: "fuzzy"  # prefix or fuzzy
  }
  cursor_shape: {
    emacs: blink_line
  }
  color_config: (get-theme)
  menus: (get-menus)
  keybindings: (get-mappings)
}

# $env.config = ($env.config | merge $custom_config)

$env.config.show_banner = $custom_config.show_banner
$env.config.rm = ($env.config.rm | merge $custom_config.rm)
$env.config.history = ($env.config.history | merge $custom_config.history)
$env.config.completions = ($env.config.completions | merge $custom_config.completions)
$env.config.cursor_shape = ($env.config.cursor_shape | merge $custom_config.cursor_shape)
$env.config.color_config = ($env.config.color_config | merge $custom_config.color_config)
$env.config.menus = ($env.config.menus | merge $custom_config.menus)
$env.config.keybindings = ($env.config.keybindings | merge $custom_config.keybindings)
