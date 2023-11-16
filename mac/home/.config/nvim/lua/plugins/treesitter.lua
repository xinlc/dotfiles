
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

  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   keys = {
  --     { "<cr>", desc = "Increment selection" },
  --     { "<bs>", desc = "Decrement selection", mode = "x" },
  --   },
  --   opts = {
  --     incremental_selection = {
  --       enable = true,
  --       keymaps = {
  --         init_selection = "<cr>",
  --         node_incremental = "<cr>",
  --         scope_incremental = "<s-cr>",
  --         node_decremental = "<bs>",
  --       },
  --     },
  --   },
}
