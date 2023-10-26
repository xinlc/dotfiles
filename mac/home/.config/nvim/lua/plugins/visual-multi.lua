-- return {
--   {
--     "mg979/vim-visual-multi",
--     branch = "master",
--     init = function()
--       vim.g.VM_maps = {
--         ["Find Under"] = "<M-d>"
--       }
--     end
--   }
-- }

return {
  {
    "mg979/vim-visual-multi",
    branch = "master",
    lazy = true,
    init = function()
      -- vim.g.VM_default_mappings = 0
      vim.g.VM_maps = {}
      vim.g.VM_maps = {
        ["Find Under"] = "<M-d>",
        ["Find Subword Under"] = "<M-d>"
      }
    end,
    keys = {
      { "<leader>mf", "<Plug>(VM-Find-Under)", mode = { "n" }, desc = "Find Under" },
      { "<leader>ma", "<Plug>(VM-Select-All)", mode = { "n" }, desc = "Select All" },
      { "<leader>mr", "<Plug>(VM-Start-Regex-Search)", mode = { "n" }, desc = "Start Regex Search" },
      { "<leader>mf", "<Plug>(VM-Visual-Find)", mode = { "x" }, desc = "Visual Find" },
      { "<leader>ma", "<Plug>(VM-Visual-All)", mode = { "x" }, desc = "Visual All" },
      { "<leader>mr", "<Plug>(VM-Visual-Regex)", mode = { "x" }, desc = "Visual Regex" },
    }
  }
}
