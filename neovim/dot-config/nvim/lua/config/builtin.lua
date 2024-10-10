vim.o.diffopt = "internal,filler,closeoff,vertical"

vim.o.hlsearch = false
vim.o.wrap = false

vim.wo.number = true

vim.o.mouse = 'a'

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = 'yes'
vim.wo.foldlevel = 2

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.completeopt = 'menuone,noselect'

vim.o.foldmethod = "indent"
vim.o.foldopen = "block"
vim.o.foldlevelstart = 99

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.keymap.set('o', 'il', ':<c-u>normal! $v^<cr>', { silent = true, noremap = true })
vim.keymap.set('x', 'il', ':<c-u>normal! $v^<cr>', { silent = true, noremap = true })
vim.keymap.set('o', 'al', ':<c-u>normal! $v0<cr>', { silent = true, noremap = true })
vim.keymap.set('o', 'al', ':<c-u>normal! $v0<cr>', { silent = true, noremap = true })
