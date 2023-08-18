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

lspconfig.pylsp.setup({
    -- configurationSources = {"black"},
    settings = {
        pylsp = {
            plugins = {
                black = {
                    enabled = true,
                    lineLength: 100
                    -- preview: true
                },
                ruff = {
                    enabled = true,
                    lineLength: 100
                },
                autopep8 = {
                    enabled = false
                },
                pyls_isort = {
                    enabled = true,
                    profile = "black"
                },
                pyls_mypy = {
                    enabled = true,
                },
                jedi_completion = {
                    enabled = true
                    -- fuzzy = true
                },
                -- rope_autoimport = {
                --     enabled = true
                -- },
                pycodestyle = {
                    enabled = false,
                    ignore = { 'W391' },
                    maxLineLength = 100
                },
            }
        }
    },
})
