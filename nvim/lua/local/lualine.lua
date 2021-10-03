-- https://github.com/hoob3rt/lualine.nvim

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
