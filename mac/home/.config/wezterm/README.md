# My WezTerm Config

![screenshot](./screenshots/screenshot-2.png)

## References/Links

- https://github.com/KevinSilvester/wezterm-config


## 配置文件不生效问题

### 验证配置是否生效

```sh
# 方法1：使用临时环境变量启动 WezTerm
WEZTERM_CONFIG_FILE=/Users/richard/.config/wezterm/wezterm.lua wezterm

# 方法2：直接指定配置文件启动
wezterm --config-file ~/.config/wezterm/wezterm.lua
```

### 方法1 指定环境变量

```sh
# 检查是否设置了 WEZTERM_CONFIG_FILE
echo $WEZTERM_CONFIG_FILE

# 检查哪些配置文件设置了它
grep -r "WEZTERM_CONFIG_FILE" ~/.zshrc ~/.bashrc ~/.bash_profile ~/.profile ~/.config/fish/config.fish 2>/dev/null

# 检查所有 shell 配置文件
grep -r "WEZTERM_CONFIG_FILE" ~/.*rc ~/.*profile ~/.profile ~/.bash* ~/.zsh* ~/.config/* 2>/dev/null

# 更全面的搜索
find ~ -type f -name ".*" -maxdepth 1 -exec grep -l "WEZTERM_CONFIG_FILE" {} \; 2>/dev/null
find ~/.config -type f -exec grep -l "WEZTERM_CONFIG_FILE" {} \; 2>/dev/null

# 检查环境配置文件
ls -la ~/.env ~/.environment ~/.pam_environment 2>/dev/null



# 如果你想保留环境变量，修改为指向 .config 目录
export WEZTERM_CONFIG_FILE=/Users/richard/.config/wezterm/wezterm.lua

# 永久设置（加到 ~/.zshrc 或 ~/.bashrc）
echo 'export WEZTERM_CONFIG_FILE="$HOME/.config/wezterm/wezterm.lua"' >> ~/.zshrc
source ~/.zshrc
```

### 方法2 创建符号链接

```sh
# 1. 创建符号链接（推荐）
ln -sf ~/.config/wezterm/wezterm.lua ~/.wezterm.lua

# 2. 验证链接
ls -la ~/.wezterm.lua
# 应该显示指向 .config/wezterm/wezterm.lua

# 3. 重启 WezTerm 或重新加载配置
```
