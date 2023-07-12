export-env {
	# make gpg open in-terminal dialog
	let-env GPG_TTY = (tty | str trim)

	let-env FZF_DEFAULT_COMMAND = "fd --type file --hidden --follow"
	let-env FZF_DEFAULT_OPTS = ([
			"--cycle"
			"--bind 'alt-enter:print-query,tab:toggle-up,ctrl-y:execute-silent(echo {} | copy)'"
			"--preview 'bat --line-range :500 {}'"
		] | str join " ")

	##
	## settings
	##

    let-env EDITOR = 'nvim'
    let-env VISUAL = 'nvim'

	##
	## apps
	##

	# godot
	# let-env GODOT_BIN = "/usr/bin/godot"
}
