
# starship B
#source ~/.cache/starship/init.nu
source ../plugins/starship.nu
# starship E

# zoxide B
# source ~/.cache/zoxide/init.nu
#if ("../plugins/zoxide.nu" | path exists | not $in) {
    #zoxide init nushell --cmd j --hook prompt | save --force ~/.config/nushell/plugins/zoxide.nu
#}
source ../plugins/zoxide.nu
# zoxide E

# atuin B
#source ~/.cache/atuin/init.nu
source ../plugins/atuin.nu
# atuin E
