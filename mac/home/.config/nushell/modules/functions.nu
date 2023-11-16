##
## SHORTCUTS
##

export def l [dir: string = "."] {
	ls -la $dir | if ($in | is-empty) {} else { select name type target size modified }
}

##
## UTILS
##

# Duplicate files to another location.
# Places them in the same folders relative to destination.
export def dupe [
	direction: string # whether to dupe `to` or `from` the $directory
	directory: path # the directory to dupe to/from
	...files: path # files to dupe
] {
	if $direction == "to" {
		^cp -r $files $directory
	} else {
		for file in $files {
			cp -r $"($directory)/($file)" $file
		}
	}
}

##
## APPS
##

# fzf through files, typing result.
# Requires: `fd`
export def fzf-files [] {
	fd --type f --hidden | fzf --prompt "FILES> "
}

# fzf through directories, navigating to result
# Requires: `fd`
export def --env fzf-cd [] {
	cd (fd --type d --hidden | fzf --prompt "FOLDERS> " | str trim)
}

# fzf through shell history, typing result.
export def fzf-history [
	--query (-q): string # Optionally start with given query.
] {
	(history | get command | reverse | to text | fzf --prompt "HISTORY> " --query $"($query)")
}

# Attach to existing session, or create new.
# If inside a session already, rename it.
export def ta [
	...params: string # Optional name. Defaults to name of current directory.
] {
	let name = (if ($params | length) == 1 { $params } else { basename (pwd) | str trim })
	let isTmux = "TMUX" in ($env | transpose keys | get keys)
	if $isTmux {
		tmux rename-session $name
		echo "Renaming session to: $name"
	} else {
		tmux -u new-session -A -s $name
	}
}

# Attach to existing session using fzf'd list
export def tj [
	...params: string # Optional name. Defaults to name of current directory.
] {
	let name = (if ($params | length) == 1 { $params } else { tmux list-sessions -F '#{session_name}' | fzf })
	ta $name
}

export def zshtory [] {
	bat ~/.zsh_history | str replace -a ': \d+:\d+;' ""
}

# # Change to dir matching zoxide query
# export def --env j [
# 	query: string # Directory query
# ] {
# 	cd (zoxide query $query | str trim)
# }

# def argz [...arg] {
  # ($arg | str collect (char space))
# }

# def h [...arg] {
  # history | find (argz $arg)
# }

# def p [...arg] {
  # ps | find (argz $arg)
# }

# def f [arg] {
  # ls **/*($arg)*
# }


##
## terminal proxy
##

export def --env proxyon [] {
    $env.http_proxy = "http://127.0.0.1:7890"
    $env.https_proxy = "http://127.0.0.1:7890"
    $env.all_proxy = "socks5://127.0.0.1:7890"
}

export def --env proxyoff [] {
    hide-env http_proxy
    hide-env https_proxy
    hide-env all_proxy
}
