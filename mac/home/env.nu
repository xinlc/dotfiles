##################自定义配置#####################
## config env

# starship B
mkdir ~/.cache/starship
starship init nu | save ~/.cache/starship/init.nu
# starship E

# zoxide B
mkdir ~/.cache/zoxide
zoxide init nushell --cmd j --hook prompt | save ~/.cache/zoxide/init.nu
# zoxide E
