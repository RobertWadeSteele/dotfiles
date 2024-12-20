---@module 'lazy.types'
---@type LazySpec
return {
	"stevearc/oil.nvim",
	opts = {
		view_options = {
			show_hidden = true,
		},
	},
	keys = {
		{ "-", ":Oil<CR>", desc = "Oil" },
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
}
