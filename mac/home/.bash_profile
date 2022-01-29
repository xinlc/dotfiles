#alias begin
alias cdwork="cd /Users/richard/documents/work"
alias cdcyq="cd /Users/richard/documents/work/reactnativeprojects/can-yin-quan-app"
#alias end

#terminal 配色begin

#enables colorin the terminal bash shell export
export CLICOLOR=1

#setsup thecolor scheme for list export
export LSCOLORS=gxfxcxdxbxegedabagacad
 
#sets up theprompt color (currently a green similar to linux terminal)
# export PS1='\[\033[01;33m\]\u@\h\[\033[01;31m\] \W\$\[\033[00m\] '
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$     '

#enables colorfor iTerm
export TERM=xterm-256color
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


#mebrew安装SDK的，则加入下列路径
export ANDROID_HOME=/usr/local/opt/android-sdk


# Some useful commands to use docker.
# Author: yeasy@github
# Created:2014-09-25

alias docker-pid="sudo docker inspect --format '{{.State.Pid}}'"
alias docker-ip="sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

#the implementation refs from https://github.com/jpetazzo/nsenter/blob/master/docker-enter
function docker-enter() {
    #if [ -e $(dirname "$0")/nsenter ]; then
    #Change for centos bash running
    if [ -e $(dirname '$0')/nsenter ]; then
        # with boot2docker, nsenter is not in the PATH but it is in the same folder
        NSENTER=$(dirname "$0")/nsenter
    else
        # if nsenter has already been installed with path notified, here will be clarified
        NSENTER=$(which nsenter)
        #NSENTER=nsenter
    fi
    [ -z "$NSENTER" ] && echo "WARN Cannot find nsenter" && return

    if [ -z "$1" ]; then
        echo "Usage: `basename "$0"` CONTAINER [COMMAND [ARG]...]"
        echo ""
        echo "Enters the Docker CONTAINER and executes the specified COMMAND."
        echo "If COMMAND is not specified, runs an interactive shell in CONTAINER."
    else
        PID=$(sudo docker inspect --format "{{.State.Pid}}" "$1")
        if [ -z "$PID" ]; then
            echo "WARN Cannot find the given container"
            return
        fi
        shift

        OPTS="--target $PID --mount --uts --ipc --net --pid"

        if [ -z "$1" ]; then
            # No command given.
            # Use su to clear all host environment variables except for TERM,
            # initialize the environment variables HOME, SHELL, USER, LOGNAME, PATH,
            # and start a login shell.
            #sudo $NSENTER "$OPTS" su - root
            sudo $NSENTER --target $PID --mount --uts --ipc --net --pid su - root
        else
            # Use env to clear all host environment variables.
            sudo $NSENTER --target $PID --mount --uts --ipc --net --pid env -i $@
        fi
    fi
}


###### tmuxinator.bash #######
source $HOME/.tmuxinator/.tmuxinator.bash
export EDITOR='vim'
###################################

