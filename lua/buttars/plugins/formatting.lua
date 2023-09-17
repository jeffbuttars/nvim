return {
    -- "jose-elias-alvarez/null-ls.nvim",
    {
        "cappyzawa/trim.nvim",
        opts = {
            -- if you want to ignore markdown file.
            -- you can specify filetypes.
            ft_blocklist = {"markdown"},
        }
    },
    { "psf/black" },
    -- Use ruff for import sorting
    -- { "brentyi/isort.vim" },
}
