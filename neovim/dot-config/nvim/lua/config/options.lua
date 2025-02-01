vim.o.diffopt = "internal,filler,closeoff,vertical"
vim.o.clipboard = "unnamedplus"

vim.o.hlsearch = false
vim.o.wrap = false

vim.wo.number = true
vim.wo.relativenumber = true
-- vim.o.statuscolumn = "%s %l %r "

vim.o.mouse = "a"

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = "yes"
vim.wo.foldlevel = 2

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.completeopt = "menuone,noselect"

-- https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevelstart = 99
vim.opt.foldtext = ""

vim.filetype.add({
	extension = { templ = "templ" },
	filename = {
		["docker-compose.yaml"] = "yaml.docker-compose",
	},
})
