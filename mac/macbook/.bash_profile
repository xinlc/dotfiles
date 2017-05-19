#alias begin
alias cdwork="cd /Users/lichao/documents/work"
alias cdcyq="cd /Users/lichao/documents/work/reactnativeprojects/can-yin-quan-app"
#alias end

#terminal 配色begin
export CLICOLOR=1
export LSCOLORS=gxfxaxdxcxegedabagacad
export PS1='\[\033[01;33m\]\u@\h\[\033[01;31m\] \W\$\[\033[00m\] '
#terminal 配色end

#bash-completion begin
 if [ -f $(brew --prefix)/etc/bash_completion ]; then
     . $(brew --prefix)/etc/bash_completion
 fi
#bash-completion end

# 如果你是通过Homebrew安装SDK的，则加入下列路径
export ANDROID_HOME=/usr/local/opt/android-sdk
# adnroid home end

#Homebrew cask begin
export HOMEBREW_CASK_OPTS=--caskroom=/opt/homebrew-cask/Caskroom
#Homebrew cask end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

#cocoapods begin
export POD_HOME="/Users/lichao/.gem/ruby/2.4.0/bin"
export PATH=$POD_HOME:$PATH
#cocoapods end
