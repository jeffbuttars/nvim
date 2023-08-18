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
                    enabled = true
                },
                isort = {
                    enabled = true,
                    profile = "black"
                },
                jedi_completion = {
                    enabled = true
                    -- fuzzy = true
                },
                rope_autoimport = {
                    enabled = true
                },
                pycodestyle = {
                    enabled = false,
                    ignore = { 'W391' },
                    maxLineLength = 100
                },
            }
        }
    },
})
