# export PLUG_DIR=$HOME/.zim
# if [[ ! -d $PLUG_DIR ]]; then
# 	curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
# 	rm ~/.zimrc
# 	ln -s ~/.config/zsh/zimrc ~/.zimrc
# fi


# 安装插件
# 注意：zsh-syntax-highlighting 语法高亮插件放在后面
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-history-substring-search.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
# git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# 安装powerlevel10k 主题
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# fzf-tab
# git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

source ~/.config/zsh/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh

plugins=(
  # z
  git
  # node
  # npm
  # vi-mode
  # docker
  # extract
  fzf-tab
  zsh-autosuggestions
  zsh-history-substring-search
  zsh-completions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
