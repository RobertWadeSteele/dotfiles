---@module 'lazy.types'
---@type LazySpec
return {
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	opts = {},
	keys = {
		{
			"<leader>u",
			function()
				require("undotree").toggle()
			end,
			desc = "[O]pen [U]ndotree",
		},
	},
}
