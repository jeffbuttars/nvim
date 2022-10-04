require'lspconfig'.pylsp.setup{
    settings = {
        configurationSources = { "flake8", "black", "mypy", "isort"},
        plugins = {
            black = {
                enabled = true,
                line_length = 100,
                preview = true,
            },
        --   flake8 = { enabled = true },
        --   pyflakes = { enabled = false },
            pycodestyle = { enabled = false }
        }
    }
}
