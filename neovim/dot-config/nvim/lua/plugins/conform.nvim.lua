---@module 'lazy.types'
---@type LazySpec
return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			terraform = { "terraform_fmt" },
			html = { "prettierd" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			toml = { lsp_format = "always" },
			json = { "prettierd" },
			python = { "ruff_format", lsp_format = "fallback" },
			lua = { "stylua" },
			go = { "gofmt" },
			templ = { "templ", "fm" },
			cs = { "csharpier" },
			sql = { "sql_formatter" },
			nix = { "nixfmt", "nixpkgs_fmt"}
		},
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
