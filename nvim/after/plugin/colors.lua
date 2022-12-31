

-- highlight OverColLimit term=inverse,bold cterm=bold ctermbg=red ctermfg=black gui=bold guibg=red guifg=black
vim.api.nvim_set_hl(
    0,
    "OverColLimit",
    { standout = true }
    -- { standout = true, bold = true, ctermbg = "black", ctermfg = "red", bg = "black", fg = "red"}
)

local color_scheme = 'solarized-high'
vim.g.colors_name = 'solarized'

if vim.env.TERM_META == 'dark' then
    vim.opt.background = 'dark'
    --vim.g.colors_name = 'terafox'
    --vim.cmd("colorscheme terafox")
    -- vim.g.colors_name = 'nightfox'
    -- vim.g.colors_name = 'duskfox'
    -- vim.g.colors_name = 'nordfox'
elseif vim.env.TERM_META == 'light' then
    vim.opt.background = 'light'
    --vim.g.colors_name = 'solarized'
    -- vim.g.colors_name = 'dayfox'
    -- vim.g.colors_name = 'dawnfox'
end

-- -- Rose Pine setup
-- require('rose-pine').setup({
--     disable_background = true
-- })
--
-- function ColorMyStuff(color)
--     color = color or "rose-pine"
--     vim.cmd.colorscheme(color)
--
--     vim.api.nvim_set_hl(0, "Normal", { bg = "None"  })
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None"  })
-- end
--
-- ColorMyStuff()

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

vim.cmd.colorscheme(color_scheme)
