return {
	"folke/lazydev.nvim",
	ft = "lua", -- only load on lua files

	---@module 'lazydev.config'
	---@type lazydev.Config
	opts = {
		library = {
			-- See the configuration section for more details
			-- Load luvit types when the `vim.uv` word is found
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
			{ "nvim-dap-ui" },
		},
	},
	dependencies = {
		{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	},
}
