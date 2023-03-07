local lualine_cfg = {
    options = {
        theme = "auto",
        -- theme = "rose-pine-alt",
        disabled_filetypes = { 'neo-tree', 'packer', 'nofile' },
        -- ignore_focus = { 'neo-tree' },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
}

require("lualine").setup(lualine_cfg)
