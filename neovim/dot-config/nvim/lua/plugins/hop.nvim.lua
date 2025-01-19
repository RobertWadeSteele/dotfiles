---@module 'lazy.types'
---@type LazySpec
return {
	"smoka7/hop.nvim",
	version = "*",
	---@module 'hop'
	opts = {
		keys = "etovxqpdygfblzhckisuran",
		multi_windows = true,
	},
	keys = {
		{
			"<leader>f",
			":HopChar2<CR>",
			desc = "[H]op",
		},
	},
}
