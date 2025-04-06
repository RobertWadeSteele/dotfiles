--- @param name string
--- @param config table | nil
local function call_setup(name, config)
	local cfg = vim.tbl_deep_extend("force", {
		capabilities = require("blink.cmp").get_lsp_capabilities(),
	}, config or {})

	require("lspconfig")[name].setup(cfg)
end

local server_options = {
	emmet_language_server = {
		filetypes = { "html", "templ", "typescriptreact", "javascriptreact", "elixir", "heex", "eelixir" },
		init_options = {
			userLanguages = {
				elixir = "html-eex",
				eelixir = "html-eex",
				heex = "html-eex",
			},
		},
	},
	ts_ls = {
		filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
		single_file_support = false,
	},
	html = { filetypes = { "html", "twig", "hbs", "templ" } },
	-- htmx = { filetypes = { "html", "templ" } },
	tailwindcss = {
		filetypes = { "html", "templ", "typescriptreact", "javascriptreact", "elixir", "eelixir", "heex" },
		init_options = {
			userLanguages = {
				elixir = "html-eex",
				eelixir = "html-eex",
				heex = "html-eex",
			},
		},
	},
	lua_ls = {
		settings = {
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
			},
		},
	},
}

---
---@module 'lazy.types'
---@type LazySpec
return {
	"williamboman/mason-lspconfig.nvim",
	opts = {},
	config = function()
		require("mason-lspconfig").setup()
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				call_setup(server_name, server_options[server_name])
			end,
			yamlls = function()
				call_setup("yamlls", {
					settings = {
						yaml = {
							schemas = require("schemastore").yaml.schemas(),
							schemastore = { enable = false, url = "" },
						},
					},
				})
			end,
			jsonls = function()
				call_setup("jsonls", {
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
				})
			end,
		})
	end,
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "neovim/nvim-lspconfig" },
		{ "b0o/schemastore.nvim" },
		{ "saghen/blink.cmp" },
	},
}
