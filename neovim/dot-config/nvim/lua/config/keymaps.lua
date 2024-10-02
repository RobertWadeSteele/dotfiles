require('which-key').add({
  { "<leader>c", group = "[C]ode" },
  { "<leader>g", group = "[G]it" },
  { "<leader>h", group = "[H]arpoon" },
  { "<leader>r", group = "[R]ename" },
  { "<leader>s", group = "[S]earch" },
  { "<leader>t", group = "[T]oggle" },
  { "<leader>w", group = "[W]orkspace" },
  { "<leader>",  desc = "VISUAL <leader>", mode = 'v' },
  { "<leader>h", desc = "Git [H]unk",      mode = 'v' }
})

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- vim.keymap.set("i", "<C-A>", "<Home>")
-- vim.keymap.set("i", "<C-F>", "<Right>")
-- vim.keymap.set("i", "<C-B>", "<Left>")
-- vim.keymap.set("i", "<C-S-B>", "<S-Left>")
-- vim.keymap.set("i", "<C-S-F>", "<S-Right>")

vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y", { desc = "yank to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", "\"+d", { desc = "delete to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>c", "\"+c", { desc = "copy to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p", { desc = "paste from clipboard" })

vim.keymap.set("n", "<M-j>", "<cmd>:cnext<cr>")
vim.keymap.set("n", "<M-k>", "<cmd>:cprev<cr>")
vim.keymap.set("n", "]q", "<cmd>:cnext<cr>")
vim.keymap.set("n", "[q", "<cmd>:cprev<cr>")

vim.keymap.set("n", "tt", ":tab split<CR>")
vim.keymap.set("n", "tc", ":tabclose<CR>")

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
vim.keymap.set('n', '<leader>ca', function()
  -- vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
  vim.lsp.buf.code_action()
end, { desc = '[C]ode [A]ction' })

-- See `:help K` for why this keymap
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
vim.keymap.set('n', '<C-S-k>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })

-- Lesser used LSP functionality
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = '[W]orkspace [A]dd Folder' })
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = '[W]orkspace [R]emove Folder' })
vim.keymap.set('n', '<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = '[W]orkspace [L]ist Folders' })

local custom_format = function()
  local filetype = vim.bo.filetype
  if filetype == "templ" then
    vim.lsp.buf.format({ filter = function(client) return client.name == 'templ' end })
  else
    vim.lsp.buf.format()
  end
end

vim.keymap.set({ 'n', 'v' }, '<leader>f', custom_format, { desc = 'Format current buffer' })
