export-env {
	# make gpg open in-terminal dialog
	$env.GPG_TTY = (tty | str trim)

	$env.FZF_DEFAULT_COMMAND = "fd --type file --hidden --follow"
	$env.FZF_DEFAULT_OPTS = ([
			"--cycle"
			"--bind 'alt-enter:print-query,tab:toggle-up,ctrl-y:execute-silent(echo {} | copy)'"
			"--preview 'bat --line-range :500 {}'"
		] | str join " ")

	##
	## settings
	##

    $env.EDITOR = 'nvim'
    $env.VISUAL = 'nvim'

	##
	## apps
	##

	# godot
	# $env.GODOT_BIN = "/usr/bin/godot"
}
