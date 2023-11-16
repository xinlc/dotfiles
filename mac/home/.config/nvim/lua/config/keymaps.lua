-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init
-- local Util = require("lazyvim.util")

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- keymap.set("n", "x", '"_x')

-- exit insert mode with jk
-- vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })
map("i", "jj", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })
map("i", "kk", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })

-- save file
map({ "i", "v", "n", "s" }, "<M-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
keymap.set("n", "<leader>w", "<cmd>w<cr>", opts)

map({ "n", "v" }, "<c-d>", "<c-d>zz")
map({ "n", "v" }, "<c-u>", "<c-u>zz")

-- Delete a word backwards
map({ "n" }, "dw", 'vb"_d')

-- Select all
map({ "n" }, "<C-a>", "gg<S-v>G")

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

-- map("n", "<S-left>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
-- map("n", "<S-right>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- map("n", ",d", [[:put =strftime('%A, %B %d, %Y')<cr>kJ]], { desc = "Put date" })
-- map("n", ",t", [[:put =strftime('%T')<cr>kJ]], { desc = "Put time" })

-- change word with <c-c>
-- vim.keymap.set("n", "<C-c>", "<cmd>normal! ciw<cr>a")


--  ╭───────────────────────────────────────────────────────────╮
--  │ Credit: June Gunn <Leader>?/! | Google it / Feeling lucky │
--  ╰───────────────────────────────────────────────────────────╯
---@param pat string
---@param lucky boolean
local function google(pat, lucky)
  local query = '"' .. vim.fn.substitute(pat, '["\n]', " ", "g") .. '"'
  query = vim.fn.substitute(query, "[[:punct:] ]", [[\=printf("%%%02X", char2nr(submatch(0)))]], "g")
  vim.fn.system(
    vim.fn.printf(vim.g.open_command .. ' "https://www.google.com/search?%sq=%s"', lucky and "btnI&" or "", query)
  )
end

vim.keymap.set("n", "<leader>?", function()
  google(vim.fn.expand("<cWORD>"), false)
end, { desc = "Google" })

vim.keymap.set("x", "<leader>?", function()
  google(vim.fn.getreg("g"), false)
end, { desc = "Google" })

vim.keymap.set("n", "<leader>!", function()
  google(vim.fn.expand("<cWORD>"), true)
end, { desc = "Google (Lucky)" })

vim.keymap.set("x", "<leader>!", function()
  google(vim.fn.getreg("g"), true)
end, { desc = "Google (Lucky)" })


---@param path string
local function open(path)
  vim.fn.jobstart({ vim.g.open_command, path }, { detach = true })
  vim.notify(string.format("Opening %s", path))
end

--  ╭────────────────────────────────────╮
--  │ GX - replicate netrw functionality │
--  ╰────────────────────────────────────╯
local function open_link()
  local file = vim.fn.expand("<cfile>")
  if not file or vim.fn.isdirectory(file) > 0 then
    return vim.cmd.edit(file)
  end

  if file:match("http[s]?://") then
    return open(file)
  end

  -- consider anything that looks like string/string a github link
  local plugin_url_regex = "[%a%d%-%.%_]*%/[%a%d%-%.%_]*"
  local link = string.match(file, plugin_url_regex)
  if link then
    return open(string.format("https://www.github.com/%s", link))
  end
end

vim.keymap.set("n", "gx", open_link, { desc = "Open Link" })
-- vim.keymap.set("n", "gf", "<cmd>e <cfile><cr>", { desc = "Open File" })

--  ╭──────────╮
--  │ Commands │
--  ╰──────────╯
vim.api.nvim_create_user_command("ToggleBackground", function()
  vim.o.background = vim.o.background == "dark" and "light" or "dark"
end, {})

-- https://github.com/amaanq/nvim-config
-- -- Swap clangd compile commands
-- local function swap_compilecommands()
--   local json = require("json")
--   -- take rootdir/compile_commands.json and swap the two entries
--   local rootdir = vim.fn.getcwd()
--   local file = rootdir .. "/compile_commands.json"
--   local f = io.open(file, "r")
--   if not f then
--     vim.notify("No compile_commands.json found")
--     return
--   end
--   local data = f:read("*all")
--   f:close()
--   local commands = json.decode(data)
--   commands[1], commands[2] = commands[2], commands[1]

--   f = io.open(file, "w")
--   if not f then
--     vim.notify("Could not open compile_commands.json for writing!")
--     return
--   end
--   f:write(json.encode(commands))
--   f:close()
--   vim.notify("Swapped compile_commands.json!")
-- end

-- local function swap_compilecommands2()
--   local shell_code = [=[
-- #!/usr/bin/env bash

-- compile_commands_file="$PWD/compile_commands.json"
-- echo "$compile_commands_file"
-- tmp_file=$(mktemp)

-- jq '[.[1], .[0]]' "$compile_commands_file" >"$tmp_file" && mv "$tmp_file" "$compile_commands_file"
-- ]=]
--   local tmp_file = vim.fn.tempname()
--   local f = io.open(tmp_file, "w")
--   if not f then
--     vim.notify("Could not open tmp_file for writing!")
--     return
--   end
--   f:write(shell_code)
--   f:close()
--   vim.fn.jobstart({ "sh", tmp_file }, { detach = true })
--   vim.notify("Swapped compile_commands.json!")
-- end

-- vim.keymap.set("n", "<leader>clf", swap_compilecommands2, { desc = "Swap Compile Commands" })

-- Unmap mappings used by tmux plugin
-- map("n", "<C-h>", "")
-- vim.keymap.del("n", "<C-h>")
-- vim.keymap.del("n", "<C-j>")
-- vim.keymap.del("n", "<C-k>")
-- vim.keymap.del("n", "<C-l>")
-- vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
-- vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
-- vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
-- vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")

-- UI
-- vim.keymap.set("n", "<leader>uF", function()
--   vim.o.foldenable = not vim.o.foldenable
-- end, {
--   desc = "Toggle [U]I [F]olding",
-- })
