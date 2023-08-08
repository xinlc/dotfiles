##################自定义配置#####################
## config env
## source ~/.config/nushell/env.nu

# homebrew B
$env.HOMEBREW_PREFIX = '/opt/homebrew'
$env.HOMEBREW_CELLAR = '/opt/homebrew/Cellar'
$env.HOMEBREW_REPOSITORY = '/opt/homebrew'
# $env.MANPATH = ($env.MANPATH | prepend '/opt/homebrew/share/man')
# $env.INFOPATH = ($env.INFOPATH | prepend '/opt/homebrew/share/info')
$env.PATH = ($env.PATH | prepend '/opt/homebrew/bin')
$env.PATH = ($env.PATH | prepend '/opt/homebrew/sbin')
# homebrew E

# starship B
#mkdir ~/.cache/starship
#starship init nu | save -f ~/.cache/starship/init.nu
# starship E

# zoxide B move plugins
# mkdir ~/.cache/zoxide
# zoxide init nushell --cmd j --hook prompt | save -f ~/.cache/zoxide/init.nu
# zoxide E

## FNM B
## Parse FNM env from other supported shell. It result should looks like this:
## │ FNM_VERSION_FILE_STRATEGY │ local                          │
## │ FNM_DIR                   │ /home/user/.fnm                |
## Then load these value key pair to Nushell env
#load-env (fnm env --shell bash | lines | str replace 'export ' '' | str replace -a '"' '' | split column = | rename name value | where name != "FNM_ARCH" && name != "PATH" | reduce -f {} {|it, acc| $acc | upsert $it.name $it.value })
## Add dynamic FNM path
#let-env PATH = ($env.PATH | append [
  #$"($env.FNM_MULTISHELL_PATH)/bin"
#])

if not (which fnm | is-empty) {
  ^fnm env --json | from json | load-env
  $env.PATH = ($env.PATH | prepend [
    $"($env.FNM_MULTISHELL_PATH)/bin"
  ])
}

## FNM E

# atuin B
# mkdir ~/.local/share/atuin/
# atuin init nu | save ~/.local/share/atuin/init.nu
# mkdir ~/.cache/atuin
# atuin init nu | save -f ~/.cache/atuin/init.nu
# atuin E

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
$env.NU_LIB_DIRS = [
  ($nu.config-path | path dirname | path join modules)
  ($nu.config-path | path dirname | path join completions)
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
$env.NU_PLUGIN_DIRS = [
  ($nu.config-path | path dirname | path join plugins)
]
