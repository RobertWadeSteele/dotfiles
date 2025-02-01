---@module 'lazy.types'
---@type LazySpec
return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	opts = {},
	keys = {
		{
			"<leader>w",
			function()
				require("dapui").toggle()
			end,
			desc = "UI",
		},
	},
	-- init = function()
	-- 	local dap = require("dap")
	-- 	dap.listeners.before.attach.dapui_config = function()
	-- 		require("dapui").open({})
	-- 	end
	-- 	dap.listeners.before.launch.dapui_config = function()
	-- 		require("dapui").open({})
	-- 	end
	-- end,
}
