---@module 'lazy.types'
---@type LazySpec
return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map({ "n", "v" }, "]c", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gitsigns.nav_hunk("next")
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Jump to next hunk" })

			map({ "n", "v" }, "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gitsigns.nav_hunk("prev")
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Jump to previous hunk" })

			-- Actions
			-- visual mode
			map("v", "<leader>gs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "stage git hunk" })
			map("v", "<leader>gr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "reset git hunk" })
			-- normal mode
			map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "git stage hunk" })
			map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "git reset hunk" })
			map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "git Stage buffer" })
			map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "undo stage hunk" })
			map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "git Reset buffer" })
			map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "preview git hunk" })
			map("n", "<leader>gb", function()
				gitsigns.blame_line({ full = false })
			end, { desc = "git blame line" })
			map("n", "<leader>gd", gitsigns.diffthis, { desc = "git diff against index" })
			map("n", "<leader>gD", function()
				gitsigns.diffthis("~")
			end, { desc = "git diff against last commit" })

			map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, { desc = "toggle git blame line" })
			map("n", "<leader>gtd", gitsigns.toggle_deleted, { desc = "toggle git show deleted" })

			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "select git hunk" })
		end,
	},
}
