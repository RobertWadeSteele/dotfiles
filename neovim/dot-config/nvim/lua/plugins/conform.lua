return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			html = { "prettierd" },
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			python = { "ruff" },
			lua = { "stylua" },
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
