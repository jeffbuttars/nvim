
-- Set a builtin scheme as a default
vim.cmd('colorscheme elflord')

vim.opt.termguicolors = true
vim.opt.cursorline = false

if vim.env.TERM_META == 'dark' then
    vim.opt.background = 'dark'
    vim.cmd('colorscheme nightfox')
    -- vim.cmd('colorscheme duskfox')
    -- vim.cmd('colorscheme nordfox')
    -- vim.cmd('colorscheme terrafox')
else
    vim.opt.background = 'light'
    vim.cmd('colorscheme dayfox')
    -- vim.cmd('colorscheme dawnfox')
end

-- vim.cmd('colorscheme solarized')


vim.opt.cursorline = true
vim.opt.cursorcolumn = true
