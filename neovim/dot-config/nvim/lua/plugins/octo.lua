return {
  'pwntester/octo.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    -- OR 'ibhagwan/fzf-lua',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    suppress_missing_scope = {
      projects_v2 = true,
    },
    defaults = {
      layout_strategy = 'flex',
      layout_config = {
        -- height = 0.95
        flip_lines = 100000000
      },
    },
  },
  keys = {
    { "<leader>Ors", ":Octo review start<CR>",   desc = "[S]tart Review" },
    { "<leader>Ord", ":Octo review discard<CR>", desc = "[D]iscard Review" }
  },
}
