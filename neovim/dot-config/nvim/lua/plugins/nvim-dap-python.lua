---@module 'lazy.types'
---@type LazySpec
return {
	"mfussenegger/nvim-dap-python",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	event = "BufReadPre",
	ft = "python",
	keys = {
		{
			"<leader>de",
			"<ESC>:lua require('dap-python').debug_selection()<CR>",
			desc = "eval selection",
			ft = "python",
			mode = "v",
		},
		{
			"<leader>dM",
			":lua require('dap-python').test_method()",
			desc = "test method",
			ft = "python",
		},
		{
			"<leader>dC",
			":lua require('dap-python').test_class()",
			desc = "test class",
			ft = "python",
		},
	},
	config = function()
		require("dap-python").setup("uv")
	end,
}
