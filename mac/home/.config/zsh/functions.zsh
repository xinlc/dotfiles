
#########################
# Lazyload Function
#########################

## Setup a mock function for lazyload
## Usage:
## 1. Define function "_xinlc_lazyload_command_[command name]" that will init the command
## 2. xinlc_lazyload_add_command [command name]
xinlc_lazyload_add_command() {
    eval "$1() { \
        unfunction $1; \
        _xinlc_lazyload_command_$1; \
        $1 \$@; \
    }"
}
## Setup autocompletion for lazyload
## Usage:
## 1. Define function "_xinlc_lazyload_completion_[command name]" that will init the autocompletion
## 2. xinlc_lazyload_add_comp [command name]
xinlc_lazyload_add_completion() {
    local comp_name="_xinlc_lazyload__compfunc_$1"
    eval "${comp_name}() { \
        compdef -d $1; \
        _xinlc_lazyload_completion_$1; \
    }"
    compdef $comp_name $1
}


function joshuto_cwd_fn() {
	ID="$$"
	mkdir -p /tmp/$USER
	OUTPUT_FILE="/tmp/$USER/joshuto-cwd-$ID"
	env joshuto --output-file "$OUTPUT_FILE" $@
	exit_code=$?

	case "$exit_code" in
		# regular exit
		0)
			;;
		# output contains current directory
		101)
			JOSHUTO_CWD=$(cat "$OUTPUT_FILE")
			echo "$JOSHUTO_CWD"
			cd "$JOSHUTO_CWD"
			;;
		# output selected files
		102)
			;;
		*)
			echo "Exit code: $exit_code"
			;;
	esac
}

# There is a wrapper of yazi, that provides the ability to change the current working directory when yazi exiting, feel free to use it:
function yazi_cwd_fn() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# git diff before commit
function git_diff_fn {
    br --conf ~/.config/broot/git-diff-conf.toml --git-status
}

# tree -w
# tree -sdp
function tree {
    br -c :pt "$@"
}

# deep fuzzy cd
function dcd {
    br --only-folders --cmd "$1;:cd"
}


clear_dns_cache() {
    sudo dscacheutil -flushcache
    sudo killall -HUP mDNSResponder
    sudo killall mDNSResponderHelper
}

git-config() {
    echo -n "
===================================
      * Git Configuration *
-----------------------------------
Please input Git Username: "

    read username

    echo -n "
-----------------------------------
Please input Git Email: "

    read email

    echo -n "
-----------------------------------
Done!
===================================
"

    # git config --global alias.lg "log --graph --abbrev-commit --decorate --all --format=format:\"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)\""
    git config --global user.name "${username}"
    git config --global user.email "${email}"
}

# Kills a process running on a specified tcp port
killport() {
    echo "Killing process on port: $1"
    fuser -n tcp -k $1;
}

# MVP
# Move and make parent directories
mvp() {
    source="$1"
    target="$2"
    target_dir=${target:h}
    mkdir --parents $target_dir; mv $source $target
}

find_folder_by_name() {
    local dir="$1"
    local name="$2"
    if (( $+commands[fd] )) &>/dev/null; then
        fd --color "never" -H -g --type d $name $dir
    else
        find $dir -type d -name $name
    fi
}

extract() {
    if [[ -f $1 ]]; then
        case $1 in
        *.tar.bz2) tar xjf $1 ;;
        *.tar.gz) tar xzf $1 ;;
        *.bz2) bunzip2 $1 ;;
        *.rar) unrar e $1 ;;
        *.gz) gunzip $1 ;;
        *.tar) tar xf $1 ;;
        *.tbz2) tar xjf $1 ;;
        *.tgz) tar xzf $1 ;;
        *.zip) unzip "$1" ;;
        *.Z) uncompress $1 ;;
        *.7z) 7z x $1 ;;
        *) echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

