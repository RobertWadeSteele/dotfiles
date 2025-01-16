---@module 'lazy.types'
---@type LazySpec
return {
	"neovim/nvim-lspconfig",

	opts = {
		servers = {
			pylsp = {
				settings = {
					pylsp = {
						plugins = {
							autopep8 = {
								enabled = false,
							},
							flake8 = {
								enabled = false,
							},
							mccabe = {
								enabled = false,
							},
							pycodestyle = {
								enabled = false,
							},
							pydocstyle = {
								enabled = false,
							},
							pyflakes = {
								enabled = false,
							},
							pylint = {
								enabled = false,
							},
							yapf = {
								enabled = false,
							},
						},
					},
				},
			},
			clangd = {},
			gopls = {},
			templ = {},
			jsonls = {},
			emmet_language_server = { filetypes = { "html", "templ", "typescriptreact", "javascriptreact" } },
			rust_analyzer = {},
			ts_ls = {
				filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
				single_file_support = false,
			},
			html = { filetypes = { "html", "twig", "hbs", "templ" } },
			-- htmx = { filetypes = { "html", "templ" } },
			tailwindcss = { filetypes = { "html", "templ", "typescriptreact", "javascriptreact" } },
			csharp_ls = {},
			lua_ls = {
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			},
		},
	},

	config = function(_, opts)
		vim.filetype.add({
			extension = { templ = "templ" },
			filename = {
				["docker-compose.yaml"] = "yaml.docker-compose",
			},
		})

		local blink = require("blink.cmp")
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup({
			automatic_installation = false,
			ensure_installed = vim.tbl_keys(opts.servers),
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				local capabilities = blink.get_lsp_capabilities((opts.servers[server_name] or {}).capabilities)

				local config = {
					capabilities = capabilities,
				}

				lspconfig[server_name].setup(config)
			end,
		})
	end,

	dependencies = {
		{ "saghen/blink.cmp" },

		{
			"williamboman/mason.nvim",
			opts = {},
		},

		{
			"williamboman/mason-lspconfig.nvim",
			opts = {},
		},

		{
			"j-hui/fidget.nvim",

			---@module 'fidget.options'
			---@type Config
			opts = {},
		},

		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files

			---@module 'lazydev.config'
			---@type lazydev.Config
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
				},
			},
			dependencies = {
				{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
			},
		},
	},
}
