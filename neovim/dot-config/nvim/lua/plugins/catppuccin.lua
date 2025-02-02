return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavor = "mocha",
			dim_inactive = {
				enabled = true,
				percentage = 0.8,
			},
		})
		vim.o.termguicolors = true
		vim.cmd.colorscheme("catppuccin")
	end,
}
