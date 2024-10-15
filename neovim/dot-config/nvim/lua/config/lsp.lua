vim.filetype.add({
  extension = { templ = "templ" },
  filename = {
    ['docker-compose.yaml'] = 'yaml.docker-compose'
  }
})

local servers = {
  clangd = {},
  gopls = {},
  templ = {},
  pyright = {},
  emmet_language_server = { filetypes = { 'html', 'templ', 'typescriptreact', 'javascriptreact' } },
  rust_analyzer = {},
  -- tsserver = {},
  html = { filetypes = { 'html', 'twig', 'hbs', 'templ' } },
  htmx = { filetypes = { 'html', 'templ' } },
  tailwindcss = { filetypes = { 'html', 'templ', 'typescriptreact', 'javascriptreact' } },
  csharp_ls = {},
  -- omnisharp = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
  function(server_name)
    local config = {
      capabilities = capabilities,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }

    require('lspconfig')[server_name].setup(config)
  end,
})

-- Lesser used LSP functionality
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
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
