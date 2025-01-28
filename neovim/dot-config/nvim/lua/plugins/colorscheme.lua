---@module 'lazy.types'
---@type LazySpec
return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function(opts)
		require("tokyonight").setup({
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			dim_inactive = true,
		})
		vim.o.termguicolors = true
		vim.cmd.colorscheme("tokyonight-night")
	end,
}
