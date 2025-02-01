---@module 'lazy.types'
---@type LazySpec
return {
	"mfussenegger/nvim-dap",
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
		{
			"<A-F1>",
			function()
				require("dap").continue({
					before = function(config)
						local args_string = vim.fn.input("Arguments: ")
						config.args = vim.split(args_string, " +")
					end,
				})
			end,
		},
		{
			"<F2>",
			function()
				require("dap").step_into()
			end,
		},
		{
			"<F3>",
			function()
				require("dap").step_over()
			end,
		},
		{
			"<F4>",
			function()
				require("dap").step_out()
			end,
		},
		{
			"<F7>",
			function()
				require("dap").terminate()
			end,
		},
		{
			"<leader>b",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "breakpoint",
		},
		{
			"<leader>B",
			function()
				--- @type string | nil
				local condition = vim.fn.input("Condition: ")
				--- @type string | nil
				local hit_count = vim.fn.input("Hit count: ")
				--- @type string | nil
				local log_message = vim.fn.input("Log message: ")

				condition = condition ~= "" and condition or nil
				hit_count = hit_count ~= "" and hit_count or nil
				log_message = log_message ~= "" and log_message or nil

				require("dap").set_breakpoint(condition, hit_count, log_message)
			end,
			desc = "conditional breakpoint",
		},
	},
}
