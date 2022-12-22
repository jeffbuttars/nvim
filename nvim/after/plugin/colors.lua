
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
vim.cmd.colorscheme(color_scheme)
