-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    if vim.w.auto_cursorline then
      vim.wo.cursorline = true
      vim.w.auto_cursorline = nil
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    if vim.wo.cursorline then
      vim.w.auto_cursorline = true
      vim.wo.cursorline = false
    end
  end,
})

-- https://www.lazyvim.org/configuration/general#auto-commands
-- Fix conceallevel for json & help files
-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc", "markdown"},
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

-- Tree-Sitter highlighting for filetypes not autodetected
-- vim.filetype.add({
--   extension = {
--     overlay = "dts",
--     keymap = "dts",
--     conf = "dosini",
--   },
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   callback = function()
--     local commentstrings = {
--       dts = "// %s",
--     }
--     local ft = vim.bo.filetype
--     if commentstrings[ft] then
--       vim.bo.commentstring = commentstrings[ft]
--     end
--   end,
-- })

-- create directories when needed, when saving a file
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
--   callback = function(event)
--     local file = vim.loop.fs_realpath(event.match) or event.match

--     vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
--     local backup = vim.fn.fnamemodify(file, ":p:~:h")
--     backup = backup:gsub("[/\\]", "%%")
--     vim.go.backupext = backup
--   end,
-- })

-- Set indent level for certain filetypes
-- vim.api.nvim_create_autocmd({ "FileType", "BufRead" }, {
--   pattern = { "firrtl", "lua", "javascript", "typescript", "typescriptreact", "text", "query" },
--   callback = function()
--     vim.bo.shiftwidth = 2
--     vim.bo.tabstop = 2
--     vim.bo.softtabstop = 2
--     vim.bo.expandtab = true
--   end,
-- })

-- close dap-float with <q>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = {
--     "dap-float",
--     "httpResult",
--   },
--   callback = function(event)
--     vim.bo[event.buf].buflisted = false
--     vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true, desc = "Close Window" })
--   end,
-- })

-- close dap-terminal with <q>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = {
--     "dap-terminal",
--   },
--   callback = function(event)
--     vim.keymap.set("n", "q", "<cmd>bdelete!<cr>", { buffer = event.buf, silent = true, desc = "Close Dap Terminal" })
--   end,
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   callback = function()
--     local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
--     if lang and pcall(vim.treesitter.language.add, lang) then
--       -- vim.treesitter.start()  -- sync
--       vim.treesitter.start(nil, nil, { timeout = 1 }) -- async
--     end
--   end,
-- })

-- Disable diagnostics in a .env file
-- vim.api.nvim_create_autocmd("BufRead", {
--   pattern = ".env",
--   callback = function()
--     vim.diagnostic.disable(0)
--   end,
-- })

-- Disable tree-sitter for files over 1MB in size
-- vim.api.nvim_create_autocmd("BufRead", {
--   pattern = "*",
--   callback = function()
--     local size = vim.fn.getfsize(vim.fn.expand("%:p"))
--     if size > 500000 then
--       -- vim.treesitter.stop()
--     end
--   end,
-- })
