vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y", { desc = "yank to clipboard" })
-- vim.keymap.set({ "n", "v" }, "<leader>d", "\"+d", { desc = "delete to clipboard" })
-- vim.keymap.set({ "n", "v" }, "<leader>c", "\"+c", { desc = "copy to clipboard" })
-- vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p", { desc = "paste from clipboard" })
-- vim.keymap.set({ "n", "v" }, "<leader>p", "\"+P", { desc = "paste above from clipboard" })

vim.keymap.set("n", "<C-n>", "<cmd>:cnext<cr>")
vim.keymap.set("n", "<C-p>", "<cmd>:cprev<cr>")

vim.keymap.set("n", "tt", ":tab split<CR>")
vim.keymap.set("n", "tc", ":tabclose<CR>")

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = '[R]ename' })
vim.keymap.set('n', '<leader>ca', function()
  -- vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
  vim.lsp.buf.code_action()
end, { desc = '[C]ode [A]ction' })

-- See `:help K` for why this keymap
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
vim.keymap.set('n', '<C-S-k>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })

