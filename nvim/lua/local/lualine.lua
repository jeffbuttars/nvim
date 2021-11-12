-- https://github.com/hoob3rt/lualine.nvim

-- local custom_gruvbox = require'lualine.themes.gruvbox'
-- -- Change the background of lualine_c section for normal mode
-- custom_gruvbox.normal.c.bg = '#112233' -- rgb colors are supported
-- require'lualine'.setup{
--   options = { theme  = custom_gruvbox },
--   ...
-- }

local l_options = {
  section_separators = {'', ''},
  -- component_separators = {'', ''}
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

