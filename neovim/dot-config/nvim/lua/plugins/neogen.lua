---@module 'lazy.types'
---@type LazySpec
return {
	"danymat/neogen",
	config = true,
	-- Uncomment next line if you want to follow only stable versions
	-- version = "*"
	keys = {
		{ "<leader>cd", ":Neogen<CR>", desc = "Generate documentation" },
	},
}
