---@module 'lazy.types'
---@type LazySpec
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	keys = {
		{
			"<leader>s/",
			":LiveGrepOpenFiles<cr>",
			desc = "[S]earch [/] in Open Files",
		},
		{
			"<leader>sG",
			":LiveGrepGitRoot<cr>",
			desc = "[S]earch by [G]rep on Git Root",
		},
		{
			"<leader>sb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "[S]earch [B]uffers",
		},
		{
			"<leader>s?",
			function()
				require("telescope.builtin").builtin()
			end,
			desc = "[S]earch [S]elect Telescope",
		},
		{
			"<leader>sc",
			function()
				require("telescope.builtin").git_files()
			end,
			desc = "Search [G]it [F]iles",
		},
		{
			"<leader>sf",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "[S]earch [F]iles",
		},
		{
			"<leader>sh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "[S]earch [H]elp",
		},
		{
			"<leader>sw",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "[S]earch current [W]ord",
		},
		{
			"<leader>sg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "[S]earch by [G]rep",
		},
		{
			"<leader>sd",
			function()
				require("telescope.builtin").diagnostics()
			end,
			desc = "[S]earch [D]iagnostics",
		},
		{
			"<leader>sr",
			function()
				require("telescope.builtin").resume()
			end,
			desc = "[S]earch [R]esume",
		},
		{
			"<leader>?",
			function()
				require("telescope.builtin").oldfiles()
			end,
			desc = "[?] Find recently opened files",
		},
		{
			"gd",
			function()
				require("telescope.builtin").lsp_definitions()
			end,
			desc = "[G]oto [D]efinition",
		},
		{
			"gr",
			function()
				require("telescope.builtin").lsp_references()
			end,
			desc = "[G]oto [R]eferences",
		},
		{
			"gI",
			function()
				require("telescope.builtin").lsp_implementations()
			end,
			desc = "[G]oto [I]mplementation",
		},
		{
			"gD",
			function()
				require("telescope.builtin").lsp_type_definitions()
			end,
			desc = "Type [D]efinition",
		},
		{
			"<leader>ss",
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
			desc = "[S]earch [S]ymbols",
		},
		{
			"<leader>sS",
			function()
				require("telescope.builtin").lsp_dynamic_workspace_symbols()
			end,
			desc = "[W]orkspace [S]ymbols",
		},
		{
			"<leader>/",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end,
			desc = "[/] Fuzzily search in current buffer",
		},
	},
	init = function()
		local function find_git_root()
			local current_file = vim.api.nvim_buf_get_name(0)
			local current_dir
			local cwd = vim.fn.getcwd()
			if current_file == "" then
				current_dir = cwd
			else
				current_dir = vim.fn.fnamemodify(current_file, ":h")
			end

			local git_root =
				vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
			if vim.v.shell_error ~= 0 then
				print("Not a git repository. Searching on current working directory")
				return cwd
			end
			return git_root
		end

		local function live_grep_git_root()
			local git_root = find_git_root()
			if git_root then
				require("telescope.builtin").live_grep({
					search_dirs = { git_root },
				})
			end
		end

		local function telescope_live_grep_open_files()
			require("telescope.builtin").live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end

		vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})
		vim.api.nvim_create_user_command("LiveGrepOpenFiles", telescope_live_grep_open_files, {})
	end,
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-u>"] = true,
					["<C-d>"] = true,
				},
			},
		},
		pickers = {
			find_files = {
				push_tagstack_on_edit = true,
			},
		},
	},
	config = function(config)
		require("telescope").setup(config)
		require("telescope").load_extension("fzf")
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
}
