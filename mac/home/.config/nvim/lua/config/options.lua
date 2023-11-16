-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = " "
vim.g.autoformat = false

vim.g.os = vim.loop.os_uname().sysname
vim.g.open_command = vim.g.os == "Darwin" and "open" or "xdg-open"

-- vim.opt.grepprg = "rg --vimgrep --smart-case --"

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.backup = true
  vim.opt.cmdheight = 0
  vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"
end

if vim.g.neovide then
  vim.o.guifont = "Fira Code,Symbols Nerd Font Mono:h34"
  vim.g.neovide_scale_factor = 0.3
end

-- disable some extension providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- make all keymaps silent by default
local keymap_set = vim.keymap.set
---@diagnostic disable-next-line: duplicate-set-field
vim.keymap.set = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  return keymap_set(mode, lhs, rhs, opts)
end
