local my_utils = require('local.utils')

-- https://github.com/hoob3rt/lualine.nvim

-- local custom_gruvbox = require'lualine.themes.gruvbox'
-- -- Change the background of lualine_c section for normal mode
-- custom_gruvbox.normal.c.bg = '#112233' -- rgb colors are supported
-- require'lualine'.setup{
--   options = { theme  = custom_gruvbox },
--   ...
-- }

local l_options = {
  section_separators = {my_utils.icons.half_circle_right_filled, my_utils.icons.half_circle_left_filled},
  -- component_separators = {my_utils.icons.cresent_circle_right, my_utils.icons.cresent_circle_left}
}

if vim.env.TERM_META == 'dark' then
    l_options.theme = 'solarized_dark'
else
    l_options.theme = 'solarized_light'
end

require('lualine').setup({
    options = l_options,
    extension = {'quickfix', 'fugitive', 'fzf', 'nvim-tree'}
})

