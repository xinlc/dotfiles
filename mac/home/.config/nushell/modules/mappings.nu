export def get-mappings [] {
	[
		#{
			#name: reload_config
			#mode: [ vi_insert emacs ]
			#modifier: none
			#keycode: f5
			#event: {
				#send: executeHostCommand
				#cmd: $"source ($nu.config-path)"
			#}
		#}

		{
			name: fzf-cd
			mode: [ vi_insert emacs ]
			modifier: alt
			keycode: char_c
			event: {
				send: executeHostCommand
				cmd: "fzf-cd"
			}
		}

		{
			name: zoxide-query
			mode: [ vi_insert emacs ]
			modifier: alt
			keycode: char_s
			event: {
				send: executeHostCommand
				cmd: "cd (zoxide query -i | str trim)"
			}
		}
	]
}
