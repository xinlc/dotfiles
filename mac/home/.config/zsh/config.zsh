
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/env.zsh
source ~/.config/zsh/aliases.zsh
# source ~/.config/zsh/vi.zsh
source ~/.config/zsh/fzf.zsh
source ~/.config/zsh/mappings.zsh
source ~/.config/zsh/prompt.zsh


# p10k B
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/.config/zsh/p10k.zsh
# p10k E

# zoxide B
# --cmd j 修改别名 z 为 j
eval "$(zoxide init zsh --cmd j)"
# zoxide E

# fnm B
eval "$(fnm env --use-on-cd)"
# fnm E

# # nvm B
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# # nvm E

# sdkman B
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/richard/.sdkman"
[[ -s "/Users/richard/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/richard/.sdkman/bin/sdkman-init.sh"
# sdkman E


# conda B
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/richard/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/richard/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/richard/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/richard/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# 设置别名
alias condaup="conda activate dev"
alias condadown="conda deactivate"

# 自动激活 dev 环境
conda activate dev
# conda E

# the fuck B
eval $(thefuck --alias)
# the fuck E

# mcfly B
# 现在使用 fzf ctl-r
# eval "$(mcfly init zsh)"
# mcfly E

# asdf B
# echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
. /opt/homebrew/opt/asdf/libexec/asdf.sh
# asdf E


# proxy B
export http_proxy=http://127.0.0.1:7890;export https_proxy=http://127.0.0.1:7890;export ALL_PROXY=socks5://127.0.0.1:7890;
alias proxyon='export http_proxy=127.0.0.1:7890;export https_proxy=$http_proxy;export all_proxy=socks5://127.0.0.1:7890'
alias proxyoff='unset http_proxy;unset https_proxy;unset all_proxy'
#alias proxy='export all_proxy=socks5://127.0.0.1:1080'
#alias unproxy='unset all_proxy'
# proxy E

# hstr B
# HSTR configuration - add this to ~/.zshrc
# alias hh=hstr                    # hh to be alias for hstr
# setopt histignorespace           # skip cmds w/ leading space from history
# export HSTR_CONFIG=hicolor       # get more colors
# bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
# hstr E
