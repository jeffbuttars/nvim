--
-- require('feline').setup()

require('feline').setup({
    colors = { bg =  '#073642' },
    -- update_triggers = {
    --     'InsertLeave',
    --     'InsertEnter',
    --     'BufEnter',
    --     'BufLeave',
    --     'BufRead',
    --     'CursorHold',
    --     'FileWritePost',
    --     'VimEnter',
    -- },
})

-- vim.fn(autocmd InsertLeave * :lua require('feline').reset_highlights())
