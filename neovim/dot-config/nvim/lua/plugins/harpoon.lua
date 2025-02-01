---@module 'lazy.types'
---@type LazySpec
return {
	"ThePrimeagen/harpoon",
	opts = {},
	keys = {
		{
			"m<leader>",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "Mark file",
		},
		{
			"<leader>h",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Open Harpoon",
		},
		{
			"<A-p>",
			function()
				require("harpoon.ui").nav_prev()
			end,
			desc = "Harpoon Next",
		},
		{
			"<A-n>",
			function()
				require("harpoon.ui").nav_next()
			end,
			desc = "Harpoon Prev",
		},
	},
}
