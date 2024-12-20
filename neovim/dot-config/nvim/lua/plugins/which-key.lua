---@module 'lazy.types'
---@type LazySpec
return {
	"folke/which-key.nvim",

	config = function()
		require("which-key").add({
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>g", group = "[G]it" },
			{ "<leader>gt", group = "[T]oggle" },
			{ "<leader>h", group = "[H]arpoon" },
			{ "<leader>r", group = "[R]un" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>w", group = "[W]orkspace" },
			{ "<leader>l", group = "[L]SP" },
			{ "<leader>", desc = "VISUAL <leader>", mode = "v" },
		})
	end,
}
