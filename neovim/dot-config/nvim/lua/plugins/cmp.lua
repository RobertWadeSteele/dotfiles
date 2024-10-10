return {
  'hrsh7th/nvim-cmp',
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    require('luasnip.loaders.from_vscode').lazy_load()
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = 'menu,menuone,noinsert,noselect',
      },
      preselect = cmp.PreselectMode.None,
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
      },
      sorting = {
        priority_weight = 1,
        comparators = {
          cmp.config.compare.exact,
          cmp.config.compare.recently_used,
          cmp.config.compare.score,
          cmp.config.compare.kind,
          cmp.config.compare.offset,
        }
      }
    }
  end,
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
