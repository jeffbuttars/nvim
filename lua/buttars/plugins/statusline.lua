return {
    {
        -- Status line
        "nvim-lualine/lualine.nvim",
        dependencies = {
            -- "kyazdani42/nvim-web-devicons",
            "nvim-tree/nvim-web-devicons",
            opt = true
        },
        opts = {
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
    },

    {
        -- Buffer line (top line)
        'willothy/nvim-cokeline',
        dependencies = {
            "nvim-lua/plenary.nvim",     -- Required for v0.4.0+
            -- "kyazdani42/nvim-web-devicons", -- If you want devicons
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local hlgroups = require("cokeline.hlgroups")
            -- local buf_delete = require("cokeline/utils").buf_delete

            require("cokeline").setup({
                -- default_hl = {
                --     focused = function(buffer)
                --     return
                --         buffer.is_focused
                --         and get_hex('Normal', 'fg')
                --         or get_hex('Comment', 'fg')
                --     end,
                --     -- bg = get_hex('ColorColumn', 'bg'),
                -- },

                sidebar = {
                    filetype = "neo-tree",
                    components = {
                        {
                            text = "     Filesystem",
                            fg = hlgroups.get_hl_attr("NeoTreeNormal", "fg"),
                            bg = hlgroups.get_hl_attr("NeoTreeNormal", "bg"),
                            highlight = hlgroups.get_hl_attr("NeoTreeFileName", "fg"),
                            style = "bold",
                        },
                    },
                },

                components = {
                    {
                        text = "",
                        fg = function(buffer)
                            return (buffer.is_focused and hlgroups.get_hl_attr('Normal', 'fg')) or hlgroups.get_hl_attr('Normal', 'bg')
                        end,
                        bg = function(_)
                            return hlgroups.get_hl_attr('Normal', 'bg')
                        end,
                    },
                    {
                        text = function(buffer)
                            return " " .. buffer.devicon.icon
                        end,
                        fg = function(buffer)
                            return (buffer.is_focused and hlgroups.get_hl_attr('Normal', 'bg')) or hlgroups.get_hl_attr('Normal', 'fg')
                        end,
                    },
                    {
                        text = function(buffer)
                            return buffer.filename .. "  "
                        end,
                        style = function(buffer)
                            return buffer.is_focused and "bold" or nil
                        end,
                    },
                    {
                        text = "",
                        -- text = function(buffer)
                        --     vim.print("TEXT", buffer.is_hovered)
                        --     if buffer.is_hovered and buffer.is_focused then
                        --         return ""
                        --     end
                        --
                        --     return ""
                        -- end,
                        -- delete_buffer_on_left_click = true,
                        -- on_click = function(idx, clicks, buttons, modifiers, buffer)
                        --     -- vim.print(buffer.delete, buffer.number)
                        --     -- vim.print(buffer)
                        --     buf_delete(buffer.number, nil, false)
                        --     -- buffer.delete()
                        -- end,
                        on_click = function(_, _, _, _, buffer)
                            buffer:delete()
                        end,
                        -- on_mouse_enter = function(cx, screen_col)
                        --     vim.print("on_mouse_enter", cx, screen_col)
                        --     -- cx.text = ""
                        --     -- return cx
                        -- end,
                        -- on_mouse_leave = function(cx)
                        --     cx.text = ""
                        --     return cx
                        -- end,
                    },
                    {
                        text = "",
                        fg = function(buffer)
                            return (buffer.is_focused and hlgroups.get_hl_attr('Normal', 'fg')) or hlgroups.get_hl_attr('Normal', 'bg')
                        end,
                        bg = function(_)
                            return hlgroups.get_hl_attr('Normal', 'bg')
                        end,
                    },
                },
            })
        end
    },
}
