
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>", -- <C-space> 跟 WezTerm 冲突
          node_incremental = "<CR>",
          scope_incremental = false,
          node_decremental = "<BS>",
        },
      }
    }
  },
}
