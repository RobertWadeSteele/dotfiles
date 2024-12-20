---@module 'lazy.types'
---@type LazySpec
return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
		}
	end,
	keys = {
		{
			"<leader>cl",
			function()
				require("lint").try_lint()
			end,
		},
	},
}
