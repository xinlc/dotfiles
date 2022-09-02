export RANGER_LOAD_DEFAULT_RC="false"
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
# export TERM_ITALICS=true
# export TERM=screen-256color-bce
# export TERM=xterm-256color
# export TERM=screen-256color

# homebrew B
# echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile

# export HOMEBREW_PREFIX="/opt/homebrew";
# export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
# export HOMEBREW_REPOSITORY="/opt/homebrew";
# export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
# export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
# export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
# homebrew E


# 设置语言环境 B
# https://www.tecmint.com/set-system-locales-in-linux/
# 要查看有关当前安装的语言环境的信息，请使用locale或localectl命令。
# 要显示所有可用语言环境的列表，请使用 `locale -a` 命令。
# 查看时间和日期格式 请使用 `locale -k LC_TIME`。

# LANG="zh_CN.UTF-8"
# LC_COLLATE="zh_CN.UTF-8"
# LC_CTYPE="zh_CN.UTF-8"
# LC_MESSAGES="zh_CN.UTF-8"
# LC_MONETARY="zh_CN.UTF-8"
# LC_NUMERIC="zh_CN.UTF-8"
# LC_TIME="zh_CN.UTF-8"
# LC_ALL=

export LANG=zh_CN.UTF-8
# export LANGUAGE=zh_CN.UTF-8
# 设置语言环境 E


# tmux B
export EDITOR="nvim"
# tmux E

# android B
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
# android E

# flutter B
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export FLUTTER_HOME=$HOME/workspace/software/flutter/flutter
export PATH="$PATH:$FLUTTER_HOME/bin"
# flutter E

# idea maven B
# la /Applications/IntelliJ\ IDEA.app/Contents/plugins/maven/lib/maven3/bin
# chmod +x /Applications/IntelliJ\ IDEA.app/Contents/plugins/maven/lib/maven3/bin/mvn
export IDEA_MAVEN_HOME=/Applications/IntelliJ\ IDEA.app/Contents/plugins/maven/lib/maven3
export PATH="$PATH:$IDEA_MAVEN_HOME/bin"
# idea maven E

# spring boot B
# export MAVEN_OPTS=-Djava.security.egd=file:/dev/urandom
export MAVEN_OPTS=-Djava.security.egd=file:/dev/./urandom
# spring boot E

# Smart Project B
export MYSQL_URL=192.168.2.202
export REDIS_URL=192.168.2.202
export SMART_GATEWAY=127.0.0.1
export SMART_ADMIN=127.0.0.1
export NACOS_URL=192.168.2.202
export SMART_TX_MANAGER=127.0.0.1
export MONGO_URL=192.168.2.202
# Smart Project E

# selenium B
export SELENIUM_DRIVER_HOME=$HOME/workspace/software/selenium_driver
export PATH=$PATH:$SELENIUM_DRIVER_HOME/
# selenium E

# openjdk B
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
# openjdk E
