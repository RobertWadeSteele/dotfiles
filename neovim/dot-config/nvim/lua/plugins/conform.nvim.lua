---@module 'lazy.types'
---@type LazySpec
return {
	"stevearc/conform.nvim",
	opts = {
		lsp_format = "fallback",
		formatters_by_ft = {
			terraform = { "terraform_fmt" },
			["terraform-vars"] = { "terraform_fmt" },
			html = { "prettierd" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			toml = { lsp_format = "always" },
			json = { "prettierd" },
			python = { "ruff_format" },
			lua = { "stylua" },
			go = { "gofmt" },
			templ = { "templ", "fm" },
			cs = { "csharpier" },
			sql = { "sql_formatter" },
			nix = { "nixfmt", "nixpkgs_fmt" },
			elixir = { lsp_format = "always" },
			heex = { lsp_format = "always" },
			eex = { lsp_format = "always" },
			nix = { "nixfmt", "nixpkgs_fmt"},
			perl = { lsp_format = "always" },
		},
		debug = true,
	},
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format()
			end,
			desc = "format buffer",
		},
	},
}
