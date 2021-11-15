-- https://github.com/ishan9299/nvim-solarized-lua
--

-- italics Enable italics for comments (default: enabled)
vim.g.solarized_italics = 1

-- visibility SpecialChars (like trailing whitespace and tabs) visibility
-- low
-- normal (default)
-- high
vim.g.solarized_visibility = 'high'

-- diffmode
-- low
-- normal (default)
-- high
-- vim.g.solarized_diffmode = 'normal'

-- termtrans If you want to keep the transparency in your terminal (default: disabled)
-- To enable transparency
-- if vim.fn.has('gui_running') == 0 then
--     vim.g.solarized_termtrans = 0
-- else
--     vim.g.solarized_termtrans = 1
-- end
--
--statusline
-- low
-- flat
-- normal (default)
vim.g.solarized_statusline = 'normal'


-- Variants
-- solarized
-- The normal solarized scheme.
-- vim.cmd('colorscheme solarized')

-- solarized-high
-- This one has a higher contrast ratio.
-- vim.cmd('colorscheme solarized-high')

-- solarized-flat
-- This is the flat variant.
-- vim.cmd('colorscheme solarized-flat')

-- solarized-low
-- This is the low contrast option.
-- vim.cmd('colorscheme solarized-low')


vim.cmd('colorscheme solarized')
-- vim.cmd[[
-- highlight LspDiagnosticsLineNrError guibg=#000000 guifg=#FFFFFF gui=bold
-- ]]
