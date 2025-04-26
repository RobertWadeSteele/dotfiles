---@module 'lazy.types'
---@type LazySpec
return {
	"ThePrimeagen/harpoon",
	config = function()
		require("harpoon").setup()
		require("telescope").load_extension("harpoon")
	end,
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
	},
	keys = {
		{
			"<leader>m",
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
		{
			"<leader>sh",
			":Telescope harpoon marks<CR>",
			desc = "search marks",
		},
	},
}
