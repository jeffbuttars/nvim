-- https://github.com/nvim-neo-tree/neo-tree.nvim

require("neo-tree").setup({
    filesystem = {
        follow_current_file = true,
        use_libuv_file_watcher = true,
    },

    buffers = {
        follow_current_file = true,
    },
})


vim.api.nvim_set_keymap(
    "n",
    "<C-d>",
    ":Neotree reveal action=focus toggle<CR>",
    { noremap = true, silent = true }
)
