

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
	tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
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
