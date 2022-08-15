##################自定义配置#####################
## config env

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
starship init nu | save ~/.cache/starship/init.nu
# starship E

# zoxide B
mkdir ~/.cache/zoxide
zoxide init nushell --cmd j --hook prompt | save ~/.cache/zoxide/init.nu
# zoxide E
