return {
    -- -- https://github.com/windwp/nvim-autopairs
    -- {
        -- "windwp/nvim-autopairs",
        -- config = {
        --   disable_filetype = { "TelescopePrompt" , "vim" },
        -- }
    -- },
    {
        'altermo/ultimate-autopair.nvim',
        event = { 'InsertEnter', 'CmdlineEnter' },
        branch = 'v0.6',
        opts = {
            tabout = {
                enable = true,
                map = '<S-tab>',        --string or table
                cmap = '<S-tab>',       --string or table
            },
            space2 = { enable = true }, --[ |] > f > [ f| ]
            -- fastwarp={
            --     multi=true,
            --     {},
            --     {faster=true,map='<C-A-e>',cmap='<C-A-e>'},
            -- }
        }
    }
}
