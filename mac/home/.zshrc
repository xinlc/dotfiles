# For Performance Debug purpose START
# https://blog.skk.moe/post/make-oh-my-zsh-fly/
# https://github.com/SukkaW/dotfiles/blob/master/_zshrc/macos.zshrc
## for i in $(seq 1 5); do /usr/bin/time /opt/homebrew/bin/zsh -i -c exit; done
# Set to 1 to enable profiling
XINLC_ENABLE_PERFORMANCE_PROFILING=0

if (( $XINLC_ENABLE_PERFORMANCE_PROFILING )); then
    rm -rf $HOME/zsh_profile*
    zmodload zsh/zprof

    zmodload zsh/datetime

    setopt PROMPT_SUBST
    PS4='+$EPOCHREALTIME %N:%i> '
    __xinlc_zsh_profiling_logfile=$(mktemp $HOME/zsh_profile.XXXXXX)
    echo "Logging to $__xinlc_zsh_profiling_logfile"
    exec 3>&2 2>$__xinlc_zsh_profiling_logfile

    setopt XTRACE
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
#ZSH_THEME="powerlevel10k/powerlevel10k"
DEFAULT_USER="richard"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source ~/.config/zsh/config.zsh


# 需在放在文件最后
# For Performance Debug purpose END
if (( $XINLC_ENABLE_PERFORMANCE_PROFILING )); then
    unsetopt XTRACE
    exec 2>&3 3>&-

    parse_zsh_profiling() {
        typeset -a lines
        typeset -i prev_time=0
        typeset prev_command

        while read line; do
            if [[ $line =~ '^.*\+([0-9]{10})\.([0-9]{6})[0-9]* (.+)' ]]; then
                integer this_time=$match[1]$match[2]

                if [[ $prev_time -gt 0 ]]; then
                    time_difference=$(( $this_time - $prev_time ))
                    lines+="$time_difference $prev_command"
                fi

                prev_time=$this_time

                local this_command=$match[3]
                if [[ ${#this_command} -le 80 ]]; then
                    prev_command=$this_command
                else
                    prev_command="${this_command:0:77}..."
                fi
            fi
        done < ${1:-/dev/stdin}

        print -l ${(@On)lines}
    }

    zprof() {
        unfunction zprof

        parse_zsh_profiling $__xinlc_zsh_profiling_logfile | head -n 50

        echo ""
        echo "========================================"
        echo ""

        zprof $@
    }
fi
