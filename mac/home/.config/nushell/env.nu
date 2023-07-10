##################自定义配置#####################
## config env
## source ~/.config/nushell/env.nu

# homebrew B
let-env HOMEBREW_PREFIX = '/opt/homebrew'
let-env HOMEBREW_CELLAR = '/opt/homebrew/Cellar'
let-env HOMEBREW_REPOSITORY = '/opt/homebrew'
# let-env MANPATH = ($env.MANPATH | prepend '/opt/homebrew/share/man')
# let-env INFOPATH = ($env.INFOPATH | prepend '/opt/homebrew/share/info')
let-env PATH = ($env.PATH | prepend '/opt/homebrew/bin')
let-env PATH = ($env.PATH | prepend '/opt/homebrew/sbin')
# homebrew E

# starship B
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
# starship E

# zoxide B
mkdir ~/.cache/zoxide
zoxide init nushell --cmd j --hook prompt | save -f ~/.cache/zoxide/init.nu
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
  let-env PATH = ($env.PATH | prepend [
    $"($env.FNM_MULTISHELL_PATH)/bin"
  ])
}

## FNM E
