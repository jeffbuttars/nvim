return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            -- https://github.com/akinsho/toggleterm.nvim

            -- If we're running Neovide, map C-Z to toggle term
            local open_mapping = [[<c-\]]

            if vim.g.neovide then
                open_mapping = [[<c-z>]]
            end

            require("toggleterm").setup{
                open_mapping = open_mapping,
                direction = 'float',
                float_opts = {
                --     border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
                border = 'curved',
                },
            }
        end
},
}
