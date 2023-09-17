return {

    {
        "monkoose/matchparen.nvim",
        config = function()
            vim.g.loaded_matchparen = 1
            require('matchparen').setup()
        end
    },
}
