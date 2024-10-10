return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim',
      opts = {}
    },

    {
      'williamboman/mason-lspconfig.nvim',
      opts = {}
    },

    {
      'j-hui/fidget.nvim',
      opts = {}
    },

    {
      "folke/lazydev.nvim",
      ft = "lua",   -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
      },
      dependencies = {
        { "Bilal2453/luvit-meta", lazy = true },   -- optional `vim.uv` typings
      }
    },
  },
}
