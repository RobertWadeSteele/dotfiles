---@module 'lazy.types'
---@type LazySpec
return {
	"folke/which-key.nvim",

	config = function()
		require("which-key").add({
			{ "<leader>c", group = "Code" },
			{ "<leader>g", group = "Git" },
			{ "<leader>gt", group = "Toggle" },
			{ "<leader>d", group = "DAP" },
			{ "<leader>s", group = "Search" },
			{ "<leader>w", group = "Workspace" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>", desc = "VISUAL <leader>", mode = "v" },
		})
	end,
}
