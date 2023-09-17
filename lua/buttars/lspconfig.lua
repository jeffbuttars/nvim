local lspconfig = require('lspconfig')

-- -- TypeScript
-- lspconfig.tsserver.setup({})
-- lspconfig.eslint.setup({})

-- HTML / Emmet
lspconfig.emmet_ls.setup({
    -- capabilities = vim.lsp.protocol.make_client_capabilities(),
    filetypes = {
        "css",
        "html",
        "htmldjango",
        "javascriptreact",
        "less",
        "sass",
        "scss",
        "typescriptreact",
    },
})

-- lspconfig.pyls-black.setup({
-- })

-- lspconfig.pylsp.setup({
--     -- configurationSources = {"black"},
--     settings = {
--         pylsp = {
--             plugins = {
--                 black = {
--                     enabled = false,
--                     lineLength = 100
--                     -- preview = true
--                 },
--                 pyls_mypy = {
--                     enabled = true,
--                 },
--                 autopep8 = {
--                     enabled = false
--                 },
--                 jedi_completion = {
--                     enabled = true
--                     -- fuzzy = true
--                 },
--                 pyflakes = {
--                     enabled = false,
--                 },
--                 pycodestyle = {
--                     enabled = false,
--                     ignore = { 'W391' },
--                     maxLineLength = 100
--                 },
--                 pyls_isort = {
--                     enabled = false,
--                     profile = "black"
--                 },
--                 rope_autoimport = {
--                     enabled = false
--                 },
--                 yapf = {
--                     enabled = false
--                 },
--                 mccabe = {
--                     enabled = false
--                 }
--             }
--         }
--     },
-- })

-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
-- For the default config, along with instructions on how to customize the settings
require('lspconfig').ruff_lsp.setup {
    -- on_attach = on_attach,
    init_options = {
        settings = {
            -- Any extra CLI arguments for `ruff` go here.
            args = {},
            fixAll = true,
            organizeImports = true,
        }
    }
}
