
# starship B
source ~/.cache/starship/init.nu
# starship E

# zoxide B
# source ~/.cache/zoxide/init.nu
#if ("../plugins/zoxide.nu" | path exists | not $in) {
    #zoxide init nushell --cmd j --hook prompt | save --force ~/.config/nushell/plugins/zoxide.nu
#}
source ../plugins/zoxide.nu
# zoxide E
