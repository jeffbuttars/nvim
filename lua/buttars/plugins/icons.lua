return {
    -- Iconogrophy
    {
        "nvim-tree/nvim-web-devicons",
        opts = {
            -- your personal icons can go here (to override)
            -- DevIcon will be appended to `name`
            override = {
                zsh = {
                    icon = "",
                    color = "#428850",
                    name = "Zsh",
                },
            },
            -- globally enable default icons (default to false)
            -- will get overridden by `get_icons` option
            default = true,
        },
    },
    "mortepau/codicons.nvim",
    "junegunn/vim-emoji",
    -- "kyazdani42/nvim-web-devicons",
}
