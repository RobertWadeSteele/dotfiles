return {
  'hrsh7th/nvim-cmp',
  opts = function(_, opts)
    opts.sources = opts.sources or {}
    table.insert(opts.sources, {
      name = "lazydev",
      group_index = 0,
    })
  end,
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has 'win32' == 1 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = { "rafamadriz/friendly-snippets" },
      keys = {
        { "<C-K>", function() require("luasnip").expand() end, desc = "expand snippet",                mode = { "i" } },
        { "<C-L>", function() require("luasnip").jump(1) end,  desc = "jump to next snippet slot",     mode = { "i", "s" } },
        { "<C-J>", function() require("luasnip").jump(-1) end, desc = "jump to previous snippet slot", mode = { "i", "s" } },
        {
          "<C-K>",
          function()
            local ls = require("luasnip")
            if ls.choice_active() then
              ls.change_choice(1)
            end
          end,
          desc = "switch to next snippet",
          mode = { "i" }
        },
      }
    },
    'saadparwaiz1/cmp_luasnip',

    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',

    'rafamadriz/friendly-snippets',
  },
}
