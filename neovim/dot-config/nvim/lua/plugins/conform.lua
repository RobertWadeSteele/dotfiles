---@module 'lazy.types'
---@type LazySpec
return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			html = { "prettierd" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			json = { "prettierd" },
			python = { "ruff_format", lsp_format = "fallback" },
			lua = { "stylua" },
			go = { "gofmt" },
			templ = { "templ", "fm" },
			cs = { "csharpier" },
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
