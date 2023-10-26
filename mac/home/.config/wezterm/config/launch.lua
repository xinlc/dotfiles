local platform = require('utils.platform')()

local options = {
  default_prog = {},
  launch_menu = {},
}

if platform.is_win then
  options.default_prog = { 'pwsh' }
  options.launch_menu = {
    { label = 'PowerShell Core', args = { 'pwsh' } },
    { label = 'PowerShell Desktop', args = { 'powershell' } },
    { label = 'Command Prompt', args = { 'cmd' } },
    { label = 'Nushell', args = { 'nu' } },
    {
      label = 'Git Bash',
      args = { 'C:\\Users\\richard\\scoop\\apps\\git\\current\\bin\\bash.exe' },
    },
  }
elseif platform.is_mac then
  options.default_prog = { '/opt/homebrew/bin/zsh', '-l' }
  options.launch_menu = {
    { label = 'Bash', args = { 'bash', '-l' } },
    { label = 'Fish', args = { '/opt/homebrew/bin/fish' } },
    { label = 'Nushell', args = { '/opt/homebrew/bin/nu' } },
    { label = 'Zsh', args = { 'zsh', '-l' } },
  }
end

return options
