local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                -- ["<esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous
            }
        },
    }
}


-- project files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- git files
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- Buffers
vim.keymap.set('n', '<C-l>', function()
    builtin.buffers({sort_lastused = true});
end)

-- project search
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
