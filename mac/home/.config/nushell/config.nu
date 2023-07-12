
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

let-env config = ($env.config | merge $custom_config)
