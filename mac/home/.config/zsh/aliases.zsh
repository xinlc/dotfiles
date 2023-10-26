# alias B
alias vi="/opt/homebrew/bin/vim"
alias vim="nvim"

# https://github.com/doom-neovim/doom-nvim/issues/246
# alias nvim="CC=/opt/homebrew/bin/gcc-12 nvim"
# alias vim="CC=/opt/homebrew/bin/gcc-12 nvim"

alias c='clear'
# alias gc='git config credential.helper store'
# alias gg='git clone'
alias cdw="cd ~/workspace"
alias rm="safermformac"
alias readlink=greadlink
alias cat=bat
# docker run --rm -it -v \/var/run/docker.sock:/var/run/docker.sock \-v ~/.config/lazydocker:/.config/jesseduffield/lazydocker \lazyteam/lazydocker
alias lzd='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v ~/.config/lazydocker:/.config/jesseduffield/lazydocker lazyteam/lazydocker'
# alias ls='eza'
# alias ll='eza -lh'
alias la='eza -la'
alias lt='eza -T -L 1'
alias lg='lazygit'
# alias rr='joshuto_cwd_fn --change-directory'
alias rr='yazi_cwd_fn'
alias er='xplr'
# alias lzd='lazydocker'
alias man='tldr'
alias zj="zellij"
# alias onpm='eval $NVM_BIN/npm'
#alias onpm='$NVM_BIN/npm'
alias onpm='$FNM_MULTISHELL_PATH/bin/npm'
alias npm="pnpm"
alias nvm="fnm"
alias otop='/usr/bin/top'
alias top='btm'
alias gg='git_diff_fn'

if [ "$(command -v eza)" ]; then
    unalias -m 'll'
    unalias -m 'l'
    unalias -m 'ls'
    alias ls='eza -G  --color auto --icons -a -s type'
    alias ll='eza -l --color always --icons -a -s type'
fi


# alias E

# python B
#alias python="/opt/homebrew/bin/python3"
#alias pip="/opt/homebrew/bin/pip3"
#alias python2="/System/Library/Frameworks/Python.framework/Versions/2.7/bin/python2.7"
#alias python2="/usr/bin/python2"
#alias pip2="/usr/local/bin/pip2"
#alias python38="/opt/homebrew/opt/python@3.8/bin/python3"
#alias pip38="/opt/homebrew/opt/python@3.8/bin/pip3"
# alias python="/usr/local/bin/python3"
#alias python="/Library/Frameworks/Python.framework/Versions/2.7/bin/python2"
# python E
#

