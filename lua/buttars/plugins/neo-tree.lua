return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        keys = { "<C-d>" },
        config = function()
            -- https://github.com/nvim-neo-tree/neo-tree.nvim
            require("neo-tree").setup({
                filesystem = {
                    follow_current_file = true,
                    use_libuv_file_watcher = true,
                },

                window = {
                    -- width = "fit_content",
                    max_width = "33%",
                },

                buffers = {
                    follow_current_file = true,
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
                        deleted = "✖", -- this can only be used in the git_status source
                        renamed = "", -- this can only be used in the git_status source
                        -- Status type
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                },
                event_handlers = {
                    -- {
                    -- 	event = "neo_tree_window_after_open",
                    -- 	handler = function()
                    -- 		vim.wo.number = true
                    -- 		vim.wo.relativenumber = true
                    -- 	end,
                    -- },
                    {
                        event = "neo_tree_buffer_enter",
                        handler = function()
                            vim.wo.number = true
                            vim.wo.relativenumber = true
                        end,
                    },
                    {
                        event = "file_opened",
                        handler = function()
                            require("neo-tree").close_all()
                        end,
                    },
                },
            })

            -- vim.api.nvim_set_keymap("n", "<C-d>", ":NeoTreeFocus<CR>", { noremap = true, silent = true })
            -- vim.api.nvim_set_keymap("n", "<C-d>", ":Neotree action=focus reveal_force_cwd<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<C-d>", ":Neotree action=focus<CR>", { noremap = true, silent = true })
        end
    }
}
