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

lspconfig.pylsp.setup({
    settings = {
        formatComnmand = {"black"},
        pylsp = {
            plugins = {
                jedi_completion = {
                    enabled = true,
                    fuzzy = true
                },
                ruff = {
                    enabled = true,
                    config = "~/pyproject.toml",
                    -- extendSelect = {"I"},
                },
                black = {
                    enabled = true,
                    lineLength = 100
                    -- preview = true
                },
                isort = {
                    enabled = true,
                    profile = "black"
                },
                pyls_mypy = {
                    enabled = true,
                },
                autopep8 = {
                    enabled = false
                },
                pyflakes = {
                    enabled = false,
                },
                pycodestyle = {
                    enabled = false,
                    ignore = { 'W391' },
                    maxLineLength = 100
                },
--                 rope_autoimport = {
--                     enabled = false
--                 },
                yapf = {
                    enabled = false
                },
                mccabe = {
                    enabled = false
                }
            }
        }
    },
})

-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
-- For the default config, along with instructions on how to customize the settings
-- lspconfig.ruff_lsp.setup {
--     -- on_attach = on_attach,
--     init_options = {
--         settings = {
--             -- Any extra CLI arguments for `ruff` go here.
--             args = {},
--             fixAll = true,
--             organizeImports = true,
--         }
--     }
-- }
