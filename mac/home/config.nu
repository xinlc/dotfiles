
##################自定义配置#####################
## config nu

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

# aliases E
