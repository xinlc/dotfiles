
source ~/.config/zsh/functions.zsh
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/env.zsh
source ~/.config/zsh/aliases.zsh
# source ~/.config/zsh/vi.zsh
source ~/.config/zsh/fzf.zsh
source ~/.config/zsh/mappings.zsh
source ~/.config/zsh/prompt.zsh


# p10k B
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#source ~/.config/zsh/p10k.zsh
# p10k E

# starship B
eval "$(starship init zsh)"
# starship E

# zoxide B
# --cmd j 修改别名 z 为 j
eval "$(zoxide init zsh --cmd j)"
# zoxide E

# fnm B
# fnm
if (( $+commands[fnm] )); then
    eval "$(fnm env --use-on-cd --shell zsh)"
fi
# fnm E

# atuin B
eval "$(atuin init zsh)"
# atuin E

# nvm B
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# # nvm E

# sdkman B
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/Users/richard/.sdkman"
#[[ -s "/Users/richard/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/richard/.sdkman/bin/sdkman-init.sh"
# sdkman E


# conda B
# lazyload conda
# if (( $+commands[conda] )) &>/dev/null; then
    __xinlc_lazy_conda_aliases=('python' 'conda' 'mamba' 'pip' 'pip3' 'python3')
    for lazy_conda_alias in $__xinlc_lazy_conda_aliases
    do
        alias $lazy_conda_alias="__xinlc_load_conda && $lazy_conda_alias"
    done

    __xinlc_load_conda() {
        for lazy_conda_alias in $__xinlc_lazy_conda_aliases
        do
            unalias $lazy_conda_alias
        done

        # >>> conda initialize >>>
        # !! Contents within this block are managed by 'conda init' !!
        __conda_setup="$('/Users/richard/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        else
            if [ -f "/Users/richard/mambaforge/etc/profile.d/conda.sh" ]; then
                . "/Users/richard/mambaforge/etc/profile.d/conda.sh"
            else
                export PATH="/Users/richard/mambaforge/bin:$PATH"
            fi
        fi
        unset __conda_setup

        if [ -f "/Users/richard/mambaforge/etc/profile.d/mamba.sh" ]; then
            . "/Users/richard/mambaforge/etc/profile.d/mamba.sh"
        fi

        # <<< conda initialize <<<

        unfunction __xinlc_load_conda


        alias conda="mamba"
        # 自动激活 dev 环境
        mamba activate dev
    }
# fi

# 设置别名
# alias conda="mamba"
alias condaup="mamba activate dev"
alias condadown="mamba deactivate"

# 自动激活 dev 环境
# 开启后会影响 zsh 初始加载性能
# mamba activate dev
# conda E

# the fuck B
# eval $(thefuck --alias)
## Lazyload thefuck
if (( $+commands[thefuck] )) &>/dev/null; then
    _xinlc_lazyload_command_fuck() {
        eval $(thefuck --alias)
    }

    xinlc_lazyload_add_command fuck
fi
# the fuck E

# mcfly B
# 现在使用 fzf ctl-r
# eval "$(mcfly init zsh)"
# mcfly E

# asdf B
# echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
#. /opt/homebrew/opt/asdf/libexec/asdf.sh
# asdf E


# proxy B
#export http_proxy=http://127.0.0.1:7890;export https_proxy=http://127.0.0.1:7890;export ALL_PROXY=socks5://127.0.0.1:7890;
alias proxyon='export http_proxy=http://127.0.0.1:7890; export https_proxy=$http_proxy; export all_proxy=socks5://127.0.0.1:7890'
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

# pnpm
export PNPM_HOME="/Users/richard/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
