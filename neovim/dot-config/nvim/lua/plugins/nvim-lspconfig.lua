---@module 'lazy.types'
---@type LazySpec
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"j-hui/fidget.nvim",

			---@module 'fidget.options'
			---@type Config
			opts = {},
		},

		{ "folke/lazydev.nvim" },
	},
}
