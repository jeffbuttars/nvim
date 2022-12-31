

-- Make text that crosses the column limit standout
vim.api.nvim_set_hl(
    0,
    "OverColLimit",
    { standout = true }
)

local color_scheme = 'solarized-high'
vim.g.colors_name = 'solarized'

if vim.env.TERM_META == 'dark' then
    vim.opt.background = 'dark'
    --vim.g.colors_name = 'terafox'
    -- vim.g.colors_name = 'nightfox'
    -- vim.g.colors_name = 'duskfox'
    -- vim.g.colors_name = 'nordfox'
elseif vim.env.TERM_META == 'light' then
    vim.opt.background = 'light'
    --vim.g.colors_name = 'solarized'
    -- vim.g.colors_name = 'dayfox'
    -- vim.g.colors_name = 'dawnfox'
end

--
-- Solarized setup
--
vim.g.solarized_visibility = 'high'
vim.g.solarized_statusline = 'high'
vim.g.solarized_diffmode = 'normal'

-- termtrans If you want to keep the transparency in your terminal (default: disabled)
-- To enable transparency
if vim.fn.has('gui_running') == 0 then
    vim.g.solarized_termtrans = 0
else
    vim.g.solarized_termtrans = 1
end

-- Set the colorscheme!
vim.cmd.colorscheme(color_scheme)
