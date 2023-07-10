
##################自定义配置#####################
## config nu
## source ~/.config/nushell/config.nu

# starship B
source ~/.cache/starship/init.nu
# starship E

# zoxide B
source ~/.cache/zoxide/init.nu
# zoxide E


# exports B


# exports E


# aliases B
def nuopen [arg, --raw (-r)] { if $raw { open -r $arg } else { open $arg } }
alias open = ^open

alias vi = /opt/homebrew/bin/vim
alias vim = nvim
alias ll = ls -l
alias la = ls -a
alias lla = ls -al
alias lt = exa -T -L 1
alias cat = bat
alias rm = rm --trash
alias man = tldr
alias rr = ranger
alias lg = lazygit
alias zj = zellij
# alias onpm = $"($env.FNM_MULTISHELL_PATH)/bin/npm"
alias onpm = ^($env.FNM_MULTISHELL_PATH + "/bin/npm")
alias npm = pnpm
alias nvm = fnm
alias otop = ^top
alias top = btm

# aliases E

use '~/.config/nushell/completions.nu' * # Get just the extern definitions without the custom completion commands

# 覆盖默认配置
let-env config = {
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
}
