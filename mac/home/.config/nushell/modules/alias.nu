##
## SHORTCUTS
##

##
## EDITING
##

# export alias e = nvim

##
## APPS
##

# git
# export alias g = git

# zellij
# export alias zj = zellij


# aliases B

export def nuopen [arg, --raw (-r)] { if $raw { open -r $arg } else { open $arg } }
export alias open = ^open

export alias vi = /opt/homebrew/bin/vim
export alias vim = nvim
export alias ll = ls -l
export alias la = ls -a
export alias lla = ls -al
export alias lt = exa -T -L 1
export alias cat = bat
export alias rm = rm --trash
export alias man = tldr
export alias rr = ranger
export alias lg = lazygit
export alias zj = zellij
#export alias onpm = $"($env.FNM_MULTISHELL_PATH)/bin/npm"
export alias onpm = ^($env.FNM_MULTISHELL_PATH + "/bin/npm")
export alias npm = pnpm
export alias nvm = fnm
export alias otop = ^top
export alias top = btm
export alias gl = git pull
export alias conda = mamba
export alias condaup = mamba activate dev
export alias condadown = mamba deactivate

# aliases E
