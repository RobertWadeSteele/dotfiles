---@module 'lazy.types'
---@type LazySpec
return {
	"ThePrimeagen/harpoon",
	opts = {},
	keys = {
		{
			"<leader>hm",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "[M]ark file",
		},
		{
			"<leader>hh",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "[O]pen [H]arpoon",
		},
		{
			"[h",
			function()
				require("harpoon.ui").nav_prev()
			end,
			desc = "[H]arpoon Next",
		},
		{
			"]h",
			function()
				require("harpoon.ui").nav_next()
			end,
			desc = "[H]arpoon Prev",
		},
	},
}
