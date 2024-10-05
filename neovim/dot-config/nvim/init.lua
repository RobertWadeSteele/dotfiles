-- lazy loads first
require('config.lazy')

require('config.keymaps')
require('config.lsp')
require('config.options')
require('config.treesitter')

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
