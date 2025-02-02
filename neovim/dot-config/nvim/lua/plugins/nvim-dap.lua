---@module 'lazy.types'
---@type LazySpec
return {
	"mfussenegger/nvim-dap",

	dependencies = {
		{
			"igorlfs/nvim-dap-view",
			opts = {},
			keys = {
				{
					"<leader>dw",
					function()
						require("dap-view").toggle()
					end,
					desc = "dap toggle-view"
				},
				{
					"<leader>dB",
					function()
						require("dap-view.state").current_section = "breakpoints"
						require("dap-view").open()
					end,
					desc = "dap view breakpoints"
				},
			},
		},
	},

	init = function()
		vim.fn.sign_define("DapBreakpoint", { text = "B", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "C", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapLogPoint", { text = "L", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "→", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointRejected", { text = "R", texthl = "", linehl = "", numhl = "" })
	end,
	keys = {
		{
			"<F1>",
			function()
				require("dap").continue()
			end,
		},
		-- {
		-- 	"<F2>",
		-- 	function()
		-- 		require("dap").run_to_cursor()
		-- 	end,
		-- },
		{
			"<F2>",
			function()
				require("dap").pause()
			end,
		},
		-- {
		-- 	"<A-F1>",
		-- 	function()
		-- 		require("dap").continue({
		-- 			before = function(config)
		-- 				local args_string = vim.fn.input("Arguments: ")
		-- 				config.args = vim.split(args_string, " +")
		-- 			end,
		-- 		})
		-- 	end,
		-- },
		{
			"<F5>",
			function()
				require("dap").step_into()
			end,
		},
		{
			"<F6>",
			function()
				require("dap").step_over()
			end,
		},
		{
			"<F7>",
			function()
				require("dap").step_out()
			end,
		},
		{
			"<F11>",
			function()
				require("dap").terminate()
			end,
		},
		{
			"<leader>db",
			function()
				local hit_count = tostring(vim.v.count)

				require("dap").toggle_breakpoint(nil, hit_count)
			end,
			desc = "breakpoint",
		},
		{
			"<leader>dc",
			function()
				--- @type string | nil
				local condition = vim.fn.input("Condition: ")
				local hit_count = tostring(vim.v.count)

				require("dap").set_breakpoint(condition, hit_count, nil)
			end,
			desc = "conditional breakpoint",
		},
		{
			"<leader>dl",
			function()
				--- @type string | nil
				local log_message = vim.fn.input("Log message: ")
				local hit_count = tostring(vim.v.count)

				require("dap").set_breakpoint(nil, hit_count, log_message)
			end,
			desc = "log breakpoint"
		},
	},
}
