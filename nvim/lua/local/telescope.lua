-- https://github.com/nvim-telescope/telescope.nvim
--

local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
      -- '--color=never',
    },
    -- prompt_prefix = "> ",
    prompt_prefix = " ",
    -- selection_caret = "> ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "vertical",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
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
    }
  }
}

-- vim.api.nvim_set_keymap(mode, lhs, rhs, options)
vim.api.nvim_set_keymap('i', '<C-l>', '<CMD>lua require\'telescope.builtin\'.buffers()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<CMD>lua require\'telescope.builtin\'.buffers()<CR>', { silent = true })

vim.api.nvim_set_keymap('i', '<C-p>', '<CMD>lua require\'telescope.builtin\'.git_files()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', '<CMD>lua require\'telescope.builtin\'.git_files()<CR>', { silent = true })

-- vim.api.nvim_set_keymap('i', '<leader>fg', '<CMD>lua require\'telescope.builtin\'.live_grep()<CR>', { silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>fg', '<CMD>lua require\'telescope.builtin\'.live_grep()<CR>', { silent = true })

-- vim.api.nvim_set_keymap('i', '<leader>fh', '<CMD>lua require\'telescope.builtin\'.man_pages()<CR>', { silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>fh', '<CMD>lua require\'telescope.builtin\'.man_pages()<CR>', { silent = true })

-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
--
-- nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
-- nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
-- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
