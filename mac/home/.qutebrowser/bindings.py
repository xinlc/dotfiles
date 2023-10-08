## keys

import platform

# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

def nmap(key, command):
    """Bind key to command in normal mode."""
    config.bind(key, command, mode='normal')


# Bindings for normal mode
config.unbind('<Ctrl-w>')
config.unbind('<Ctrl-q>')
config.unbind('D')
config.unbind('H')
config.unbind('J')
config.unbind('K')
config.unbind('L')

config.bind('x', 'tab-close')
config.bind('X', 'undo')
config.bind('J', 'back')
config.bind('K', 'forward')
config.bind('H', 'tab-prev')
config.bind('L', 'tab-next')


# config.bind('d', 'scroll-page 0 0.5')
# config.bind('u', 'scroll-page 0 -0.5')
# config.bind('j', 'scroll-page 0 0.1')
# config.bind('k', 'scroll-page 0 -0.1')

# config.bind('i', 'mode-enter insert ;; spawn fcitx-remote -t')
# config.bind('gi', 'hint inputs --first ;; spawn fcitx-remote -t')

config.bind('p', 'open -- {clipboard}')
config.bind('P', 'open -t -- {clipboard}')
config.unbind('gJ')
config.unbind('gK')
config.bind('gj', 'tab-move -')
config.bind('gk', 'tab-move +')
config.bind('<', 'tab-move -')
config.bind('>', 'tab-move +')
config.bind('m', 'mode-enter set_mark')
config.bind('`', 'mode-enter jump_mark')
# config.unbind('+')
# config.unbind('-')
# config.unbind('=')
# config.bind('<Meta+=>', 'zoom-in')
# config.bind('<Meta+->', 'zoom-out')
# config.bind('<Meta+0>', 'zoom')
config.unbind('M')
config.bind('MM', 'bookmark-add')
config.bind('MD', 'bookmark-del')
config.bind('Mb', 'quickmark-save')
config.bind('ML', 'bookmark-list -t --jump')
config.bind('<Alt-x>', 'set-cmd-text :')
config.bind('<Ctrl-h>', 'set-cmd-text :help :')
config.bind('<Ctrl-i>', 'tab-focus stack-next')
config.bind('<Ctrl-o>', 'tab-focus stack-prev')
config.bind('<Return>', c.bindings.default['normal']['<Return>'] + ' ;; fake-key <Return>')
config.bind('<Escape>', c.bindings.default['normal']['<Escape>'] + ' ;; fake-key <Escape> ;; clear-messages ;; jseval --quiet document.getSelection().empty()')
config.bind('<Meta-Ctrl-f>', 'config-cycle window.hide_decoration false true')
config.bind('t,p', 'config-cycle content.proxy system http://localhost:7890/')


# config.bind('<Ctrl-Shift-tab>', 'tab-prev')
# config.bind('<Ctrl-Tab>', 'tab-next')
# config.bind('<Ctrl-h>', 'history')
# config.bind('<Ctrl-r>', 'config-source')

# config.bind('<Shift-h>', 'run-with-count 20 scroll left')
# config.bind('<Shift-j>', 'run-with-count 20 scroll down')
# config.bind('<Shift-k>', 'run-with-count 20 scroll up')
# config.bind('<Shift-l>', 'run-with-count 20 scroll right')

# config.bind('<', 'back')
# config.bind('>', 'forward')
# config.bind('h', 'run-with-count 2 scroll left')
# config.bind('j', 'run-with-count 2 scroll down')
# config.bind('k', 'run-with-count 2 scroll up')
# config.bind('l', 'run-with-count 2 scroll right')

# config.bind("xjt", "set content.javascript.enabled true")
# config.bind("xjf", "set content.javascript.enabled false")


# Bindings for insert mode
config.bind('<Alt-Backspace>', 'fake-key <Ctrl-Backspace>', mode='insert')
config.bind('<Ctrl-a>', 'fake-key <Home>', mode='insert')
config.bind('<Ctrl-e>', 'fake-key <End>', mode='insert')
config.bind('<Ctrl-d>', 'fake-key <Delete>', mode='insert')
config.bind('<Ctrl-h>', 'fake-key <Backspace>', mode='insert')
config.bind('<Ctrl-k>', 'fake-key <Shift-End> ;; fake-key <Delete>', mode='insert')
config.bind('<Ctrl-u>', 'fake-key <Shift+Home> ;; fake-key <BackSpace>', mode='insert')
config.bind('<Ctrl-f>', 'fake-key <Right>', mode='insert')
config.bind('<Ctrl-b>', 'fake-key <Left>', mode='insert')
config.bind('<Ctrl-n>', 'fake-key <Down>', mode='insert')
config.bind('<Ctrl-p>', 'fake-key <Up>', mode='insert')
# config.bind('<Escape>', 'spawn fcitx-remote -t ;; mode-leave ;; fake-key <Escape>', mode='insert')
config.bind('<Escape>', 'mode-leave ;; fake-key <Escape>', mode='insert')
# config.bind('<Ctrl-[>', 'spawn fcitx-remote -t ;; mode-leave', mode='insert')
config.bind('<Ctrl-[>', 'mode-leave', mode='insert')

# Bindings inspired by Darwin:
if platform.system() != "Darwin":
    for m in ['normal', 'insert']:
        config.bind('<Meta-a>', 'fake-key <Ctrl-a>', mode=m)
        config.bind('<Meta-c>', 'fake-key <Ctrl-c>', mode=m)
        config.bind('<Meta-v>', 'fake-key <Ctrl-v>', mode=m)
        config.bind('<Meta-x>', 'fake-key <Ctrl-x>', mode=m)
        config.bind('<Meta-z>', 'fake-key <Ctrl-z>', mode=m)
        config.bind('<Meta-Shift-z>', 'fake-key <Ctrl-Shift-z>', mode=m)
    for m in ['command', 'prompt']:
        config.bind('<Meta-a>', 'rl-end-of-line ;; fake-key -g <Shift+Home>', mode=m)
        config.bind('<Meta-c>', 'fake-key -g <Ctrl-c>', mode=m)
        config.bind('<Meta-x>', 'fake-key -g <Ctrl-c> ;; fake-key -g <Delete>', mode=m)
        config.bind('<Meta-v>', 'fake-key -g <Ctrl-v>', mode=m)
        config.bind('<Meta-z>', 'fake-key -g <Ctrl-z>', mode=m)
        config.bind('<Meta-Shift-z>', 'fake-key -g <Ctrl-Shift-z>', mode=m)

# Bindings for shortcut
# Leader key: `,`
config.bind(',b', 'open -t http://localhost:5000') # Beancount
config.bind(',e', 'open -t https://emacs-china.org')
config.bind(',f', 'open -t https://feedly.com')
config.bind(',g', 'open -t https://github.com')
config.bind(',h', 'open -t https://news.ycombinator.com')
config.bind(',l', 'open -t https://leetcode.com/problemset/all')
config.bind(',m', 'open -t https://mail.google.com')
config.bind(',r', 'open -t https://reddit.com')
config.bind(',v', 'open -t https://v2ex.com')
config.bind(',z', 'open -t https://zhihu.com')

## Bindings for command mode
config.bind('<Ctrl-d>', 'rl-delete-char', mode='command')
config.bind('<Ctrl-N>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl-P>', 'completion-item-focus prev', mode='command')
config.bind('<Tab>', 'command-history-next', mode='command')
config.bind('<Shift-Tab>', 'command-history-prev', mode='command')

# Bindings for cmd-text
# Leader key: `s`
# config.unbind('sf')
# config.unbind('sk')
# config.unbind('sl')
# config.unbind('ss')
# config.bind('sf', 'set-cmd-text -s :open -t file:// ')
# config.bind('sg', 'set-cmd-text -s :open -t github.com ')
# config.bind('sl', 'set-cmd-text -s :open -t localhost ')
# config.bind('sq', 'set-cmd-text -s :open -t docs.qq.com ')
# config.bind('sy', 'set-cmd-text -s :open -t yuque.com ')

# Bindings for cmd
# Leader key: `\`
# config.bind('\\d', 'help')
# config.bind('\\h', 'history')
# config.bind('\\m', 'messages')
# config.bind('\\r', 'config-source')
# config.bind('\\u', 'adblock-update')
# config.bind('\\v', 'version')


# keys
# bindings = {
#     ",d": "download-open",
#     ",m": "hint links spawn cglaunch mpv '{hint-url}'",
#     ",p": "spawn --userscript qute-pass --username-target secret --username-pattern 'user: (.+)' --dmenu-invocation 'dmenu -p credentials'",
#     ",P": "spawn --userscript qute-pass --username-target secret --username-pattern 'user: (.+)' --dmenu-invocation 'dmenu -p password' --password-only",
#     ",b": "config-cycle colors.webpage.bg '#1d2021' 'white'",
#     ";I": "hint images download",
#     "<Ctrl-Shift-J>": "tab-move +",
#     "<Ctrl-Shift-K>": "tab-move -",
#     "M": "nop",
#     "co": "nop",
#     "<Shift-Escape>": "fake-key <Escape>",
#     "o": "set-cmd-text -s :open -s",
#     "O": "set-cmd-text -s :open -t -s",
# }

# for key, bind in bindings.items():
#     config.bind(key, bind)
