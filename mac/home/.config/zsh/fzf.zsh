# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"


# 配置参数
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--height 50% --layout=reverse --border \
--bind=ctrl-t:top,change:top --bind ctrl-e:down,ctrl-u:up \
"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#export FZF_DEFAULT_OPTS='--bind ctrl-e:down,ctrl-u:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
#export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_COMMAND='fd'
export FZF_COMPLETION_TRIGGER='\'
export FZF_TMUX=1
export FZF_TMUX_HEIGHT='80%'
export fzf_preview_cmd='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'


# _fzf_fpath=${0:h}/fzf
# fpath+=$_fzf_fpath
# autoload -U $_fzf_fpath/*(.:t)
# unset _fzf_fpath

# fzf-redraw-prompt() {
# 	local precmd
# 	for precmd in $precmd_functions; do
# 		$precmd
# 	done
# 	zle reset-prompt
# }
# zle -N fzf-redraw-prompt

# zle -N fzf-find-widget
# bindkey '^p' fzf-find-widget

# fzf-cd-widget() {
# 	local tokens=(${(z)LBUFFER})
# 	if (( $#tokens <= 1 )); then
# 		zle fzf-find-widget 'only_dir'
# 		if [[ -d $LBUFFER ]]; then
# 			cd $LBUFFER
# 			local ret=$?
# 			LBUFFER=
# 			zle fzf-redraw-prompt
# 			return $ret
# 		fi
# 	fi
# }
# zle -N fzf-cd-widget
# bindkey '^t' fzf-cd-widget

# fzf-history-widget() {
# 	local num=$(fhistory $LBUFFER)
# 	local ret=$?
# 	if [[ -n $num ]]; then
# 		zle vi-fetch-history -n $num
# 	fi
# 	zle reset-prompt
# 	return $ret
# }
# zle -N fzf-history-widget
# bindkey '^R' fzf-history-widget

fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# find-in-file() {
# 	grep --line-buffered --color=never -r "" * | fzf
# }
# zle -N find-in-file
# bindkey '^f' find-in-file

# https://github.com/junegunn/fzf/wiki/Examples
# ctrl-x-r 选中历史里面后直接执行
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept
