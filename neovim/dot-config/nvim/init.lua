if vim.g.vscode then
  return
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local function toggleDiffview(args)
  if require("diffview.lib").get_current_view() then
    require("diffview").close()
  else
    require("diffview").open(args)
  end
end

require('lazy').setup({
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  'tpope/vim-sleuth',

  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    config = function(opts)
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {           -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus"
        },
      })
      -- vim.cmd("colorscheme kanagawa")
      vim.o.termguicolors = true
      vim.cmd.colorscheme("kanagawa")
    end,
    priority = 1000
  },
  -- {
  --   "catppuccin/nvim",
  --   config = function()
  --     vim.o.termguicolors = true
  --     vim.cmd.colorscheme("catppuccin")
  --   end,
  --   name = "catppuccin",
  --   priority = 1000
  -- },
  -- {
  --   'projekt0n/github-nvim-theme',
  --   lazy = false,  -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require('github-theme').setup({})
  --
  --     vim.o.termguicolors = true
  --     vim.cmd('colorscheme github_dark')
  --   end,
  -- },

  {
    'numToStr/Navigator.nvim',
    opts = {},
    keys = {
      { "<C-h>",  "<cmd>:NavigatorLeft<cr>" },
      { "<C-l>",  "<cmd>:NavigatorRight<cr>" },
      { "<C-j>",  "<cmd>:NavigatorDown<cr>" },
      { "<C-k>",  "<cmd>:NavigatorUp<cr>" },
      { "<C-\\>", "<cmd>:NavigatorPrevious<cr>" },
    }
  },

  {
    "sindrets/diffview.nvim",
    keys = {
      {
        "<leader>od",
        function() toggleDiffview({}) end,
        desc = "[O]pen Diffview"
      },
      {
        "<leader>oD",
        function() toggleDiffview({ "origin/HEAD...HEAD", "--imply-local" }) end,
        desc = "[O]pen PR Diffview"
      }
    },
    lazy = true
  },

  -- {
  --   'jmbuhr/otter.nvim',
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --   },
  --   opts = {},
  -- },

  {
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
      }
    },
    keys = {
      { "<leader>Ors", ":Octo review start<CR>",   desc = "[S]tart Review" },
      { "<leader>Ord", ":Octo review discard<CR>", desc = "[D]iscard Review" }
    },
  },

  {
    'ThePrimeagen/harpoon',
    opts = {},
    keys = {
      { "<leader>m",  function() require("harpoon.mark").add_file() end,        desc = "[M]ark file" },
      { "<leader>oh", function() require("harpoon.ui").toggle_quick_menu() end, desc = "[O]pen [H]arpoon" },
      { "<M-l>",      function() require("harpoon.ui").nav_prev() end,          desc = "[H]arpoon Next" },
      { "<M-l>",      function() require("harpoon.ui").nav_next() end,          desc = "[H]arpoon Prev" },
    },
  },

  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    init = function()
      vim.g.netrw_nogx = 1 -- disable netrw gx
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,      -- default settings
    submodules = false, -- not needed, submodules are required only for tests
  },

  {
    'stevearc/oil.nvim',
    opts = {
      view_options = {
        show_hidden = true
      }
    },
    keys = {
      { "-", ":Oil<CR>", desc = "Oil" }
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
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
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "luvit-meta/library", words = { "vim%.uv" } },
          },
        },
        dependencies = {
          { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
        }
      },
    },
  },

  {
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
      },
      'saadparwaiz1/cmp_luasnip',

      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      'rafamadriz/friendly-snippets',
    },
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },

  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
      { "<leader>ou", function() require("undotree").toggle() end, desc = "[O]pen [U]ndotree" }
    },
  },

  {
    'mfussenegger/nvim-dap',
    init = function()
      vim.api.nvim_set_hl(0, 'debug', {
        bg = '#FFFFFF',
        fg = '#000000'
      })
      -- vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = 'debug', linehl = '', numhl = '' })
      -- vim.fn.sign_define('DapBreakpoint', { text = 'B', texthl = 'debug', linehl = '', numhl = '' })
      -- vim.fn.sign_define('DapBreakpointCondition', { text = 'C', texthl = 'debug', linehl = '', numhl = '' })
      -- vim.fn.sign_define('DapLogPoint', { text = 'L', texthl = 'debug', linehl = '', numhl = '' })
      -- vim.fn.sign_define('DapStopped', { text = '→', texthl = 'debug', linehl = '', numhl = '' })
      -- vim.fn.sign_define('DapBreakpointRejected', { text = 'R', texthl = 'debug', linehl = '', numhl = '' })
    end,
    keys = {
      { '<leader>rc', function() require("dap").continue() end,  desc = '[C]ontinue' },
      {
        '<leader>rC',
        function()
          require("dap").continue({
            before = function(config)
              local args_string = vim.fn.input('Arguments: ')
              config.args = vim.split(args_string, " +")
            end
          })
        end
      },
      { '<leader>ri', function() require("dap").step_into() end, desc = 'Step [O]ver' },
      { '<leader>ro', function() require("dap").step_over() end, desc = 'Step [O]ver' },
      { '<leader>rO', function() require("dap").step_out() end,  desc = 'Step [O]ver' },
      { '<leader>rT', function() require("dap").terminate() end, desc = 'Step [O]ver' },
      {
        '<leader>rb',
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = 'Toggle [B]reakpoint'
      },
      {
        '<leader>rB',
        function()
          local condition = vim.fn.input("Condition: ")
          local hit_count = vim.fn.input("Hit count: ")
          local log_message = vim.fn.input("Log message: ")
          condition = condition ~= "" and condition or nil
          hit_count = hit_count ~= "" and hit_count or nil
          log_message = log_message ~= "" and log_message or nil
          require("dap").set_breakpoint(condition, hit_count, log_message)
        end,
        desc = "Conditional [B]reakpoint"
      }
    },
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    opts = {},
    keys = {
      { '<leader>ow', function() require("dapui").toggle() end, desc = 'DAP UI' }
    },
    -- init = function()
    --   local dap = require('dap')
    --   dap.listeners.before.attach.dapui_config = function()
    --     require("dapui").open({})
    --   end
    --   dap.listeners.before.launch.dapui_config = function()
    --     require("dapui").open({})
    --   end
    -- end
  },

  {
    'mfussenegger/nvim-dap-python',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    event = "BufRead *.py",
    keys = {
      { '<leader>rv', function() require("dap-python").debug_selection() end, desc = 'Debug selection', ft = "python", mode = "v" },
      { '<leader>tm', function() require("dap-python").test_method() end,     desc = 'Test method',     ft = "python" },
      { '<leader>tc', function() require("dap-python").test_class() end,      desc = 'Test class',      ft = "python" },
    },
    config = function()
      local venv_path = os.getenv("VIRTUAL_ENV")
      if venv_path == nil then
        print("no active virtual environment - unable to activate python dap")
        return
      end

      local python_path = venv_path .. '/bin/python'

      require("dap-python").setup(python_path, { include_configs = false })
    end
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {}
  },

  {
    'folke/which-key.nvim',
    opts = {}
  },

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to next hunk' })

        map({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to previous hunk' })

        -- Actions
        -- visual mode
        map('v', '<leader>gs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage git hunk' })
        map('v', '<leader>gr', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset git hunk' })
        -- normal mode
        map('n', '<leader>gs', gs.stage_hunk, { desc = 'git stage hunk' })
        map('n', '<leader>gr', gs.reset_hunk, { desc = 'git reset hunk' })
        map('n', '<leader>gS', gs.stage_buffer, { desc = 'git Stage buffer' })
        map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
        map('n', '<leader>gR', gs.reset_buffer, { desc = 'git Reset buffer' })
        map('n', '<leader>gp', gs.preview_hunk, { desc = 'preview git hunk' })
        map('n', '<leader>gb', function()
          gs.blame_line { full = false }
        end, { desc = 'git blame line' })
        map('n', '<leader>gd', gs.diffthis, { desc = 'git diff against index' })
        map('n', '<leader>gD', function()
          gs.diffthis '~'
        end, { desc = 'git diff against last commit' })

        map('n', '<leader>tgb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
        map('n', '<leader>tgd', gs.toggle_deleted, { desc = 'toggle git show deleted' })

        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
      end,
    },
  },

  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },

  {
    'numToStr/Comment.nvim',
    opts = {}
  },

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    opts = {
      pickers = {
        find_files = {
          push_tagstack_on_edit = true
        }
      }
    }
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
}, {})

vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y", { desc = "yank to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", "\"+d", { desc = "delete to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>c", "\"+c", { desc = "copy to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p", { desc = "paste from clipboard" })

-- vim.keymap.set("n", "<M-j>", "<cmd>:cnext<cr>")
-- vim.keymap.set("n", "<M-k>", "<cmd>:cprev<cr>")
vim.keymap.set("n", "]q", "<cmd>:cnext<cr>")
vim.keymap.set("n", "[q", "<cmd>:cprev<cr>")


vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "tt", ":tab split<CR>")
vim.keymap.set("n", "tc", ":tabclose<CR>")

-- vim.cmd("cnoreabbrev <expr> h getcmdtype() == ':' && getcmdline() == 'h' ? 'tab help' : 'h'")
-- vim.cmd("cnoreabbrev <expr> help getcmdtype() == ':' && getcmdline() == 'help' ? 'tab help' : 'help'")

vim.o.diffopt = "internal,filler,closeoff,vertical"

vim.o.hlsearch = false
vim.o.wrap = false

vim.wo.number = true

vim.o.mouse = 'a'

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = 'yes'

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.completeopt = 'menuone,noselect'

vim.o.foldmethod = "indent"
vim.o.foldopen = "block"
vim.o.foldlevelstart = 99

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

require('telescope').load_extension('fzf')

local function find_git_root()
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  if current_file == '' then
    current_dir = cwd
  else
    current_dir = vim.fn.fnamemodify(current_file, ':h')
  end

  local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 then
    print 'Not a git repository. Searching on current working directory'
    return cwd
  end
  return git_root
end

local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep {
      search_dirs = { git_root },
    }
  end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end

vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<leader>sS', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = { 'c_sharp', 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash' },

    auto_install = false,
    sync_install = false,
    ignore_install = {},
    playground = { enable = true },
    modules = {},
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  }
end, 0)

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
vim.keymap.set('n', '<leader>ca', function()
  -- vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
  vim.lsp.buf.code_action()
end, { desc = '[C]ode [A]ction' })

vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = '[G]oto [D]efinition' })
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences' })
vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = '[G]oto [I]mplementation' })
vim.keymap.set('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, { desc = 'Type [D]efinition' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').lsp_document_symbols, { desc = '[S]earch [S]ymbols' })
vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
  { desc = '[W]orkspace [S]ymbols' })

-- See `:help K` for why this keymap
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
vim.keymap.set('n', '<C-S-k>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })

-- Lesser used LSP functionality
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = '[W]orkspace [A]dd Folder' })
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = '[W]orkspace [R]emove Folder' })
vim.keymap.set('n', '<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = '[W]orkspace [L]ist Folders' })

local custom_format = function()
  local filetype = vim.bo.filetype
  if filetype == "templ" then
    vim.lsp.buf.format({ filter = function(client) return client.name == 'templ' end })
  else
    vim.lsp.buf.format()
  end
end

vim.keymap.set({ 'n', 'v' }, '<leader>f', custom_format, { desc = 'Format current buffer' })

require('which-key').add({
  { "<leader>c", group = "[C]ode" },
  { "<leader>g", group = "[G]it" },
  { "<leader>h", group = "[H]arpoon" },
  { "<leader>r", group = "[R]ename" },
  { "<leader>s", group = "[S]earch" },
  { "<leader>t", group = "[T]oggle" },
  { "<leader>w", group = "[W]orkspace" },
})

require('which-key').add({
  { '<leader>',  desc = 'VISUAL <leader>', mode = 'v' },
  { '<leader>h', desc = 'Git [H]unk',      mode = 'v' }
})

vim.filetype.add({
  extension = { templ = "templ" },
  filename = {
    ['docker-compose.yaml'] = 'yaml.docker-compose'
  }
})

local servers = {
  clangd = {},
  gopls = {},
  templ = {},
  pyright = {},
  emmet_language_server = { filetypes = { 'html', 'templ' } },
  rust_analyzer = {},
  tsserver = {},
  html = { filetypes = { 'html', 'twig', 'hbs', 'templ' } },
  tailwindcss = {},
  csharp_ls = {},
  omnisharp = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

local lsp_configs = {
  -- pyright = {
  --   settings = {
  --     pyright = {
  --       disableOrganizeImports = true
  --     },
  --     python = {
  --       analysis = {
  --         ignore = { "*" }
  --       }
  --     },
  --   }
  -- },
  -- ruff_lsp = {
  --   on_attach = function(client, bufnr)
  --     if client.name == 'ruff_lsp' then
  --       client.server_capabilities.hoverProvider = false
  --     end
  --   end
  -- }
}

mason_lspconfig.setup_handlers {
  function(server_name)
    local config = {
      capabilities = capabilities,
      -- on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }

    if lsp_configs[server_name] ~= nil then
      config = vim.tbl_deep_extend('force', config, lsp_configs[server_name])
    end

    require('lspconfig')[server_name].setup(config)
  end,
}

local cmp = require 'cmp'
local luasnip = require 'luasnip'
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
      cmp.config.compare.offset,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.kind,
    }
  }
}
