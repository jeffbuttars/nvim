-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { focusable = false }
)

-- https://neovim.io/doc/user/lsp.html
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    severity_sort = true,
  }
)

-- require'lspconfig'.pyright.setup{}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
-- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
local servers = { 'clangd', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do

  -- nvim_lsp[lsp].setup {
  require('lspconfig')[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end
