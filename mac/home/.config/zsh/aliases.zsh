# alias B
# alias vim="nvim"
alias c='clear'
# alias gc='git config credential.helper store'
# alias gg='git clone'
alias cdw="cd ~/workspace"
alias rm="bash ~/bin/safermformac.sh"
alias readlink=greadlink
alias cat=bat
# docker run --rm -it -v \/var/run/docker.sock:/var/run/docker.sock \-v ~/.config/lazydocker:/.config/jesseduffield/lazydocker \lazyteam/lazydocker
alias lzd='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v ~/.config/lazydocker:/.config/jesseduffield/lazydocker lazyteam/lazydocker'
# alias ls='exa'
# alias ll='exa -lh'
alias la='exa -la'
alias lt='exa -T -L 1'
alias lg='lazygit'
alias rr='ranger'
# alias lzd='lazydocker'
alias man='tldr'
alias zj="zellij"

if [ "$(command -v exa)" ]; then
    unalias -m 'll'
    unalias -m 'l'
    unalias -m 'ls'
    alias ls='exa -G  --color auto --icons -a -s type'
    alias ll='exa -l --color always --icons -a -s type'
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
# python E
#
