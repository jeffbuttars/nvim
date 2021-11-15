-- local my_utils = require('local.utils')
local nf_icons = require('local.nf-icons')

-- Setup and customize our theme
local current_theme_name = 'solarized_dark'
if vim.env.TERM_META == 'dark' then
    current_theme_name = 'solarized_dark'
else
    current_theme_name = 'solarized_light'
end

local current_theme_name = 'solarized_dark'
local current_theme = require('lualine.themes' .. '.' .. current_theme_name)

-- make the colors the same on boths sides of the line
current_theme.normal.b = current_theme.normal.c

-- https://github.com/hoob3rt/lualine.nvim

-- local custom_gruvbox = require'lualine.themes.gruvbox'
-- -- Change the background of lualine_c section for normal mode
-- custom_gruvbox.normal.c.bg = '#112233' -- rgb colors are supported
-- require'lualine'.setup{
--   options = { theme  = custom_gruvbox },
--   ...
-- }

local l_options = {
  -- section_separators = {nf_icons['ple-right_half_circle_thick'], nf_icons['ple-left_half_circle_thick']},
  -- section_separators = {my_utils.icons.half_circle_right_filled, my_utils.icons.half_circle_left_filled},
  -- component_separators = {nf_icons['ple-right_half_circle_thick'], nf_icons['ple-left_half_circle_thick']}
  theme = current_theme
}

require('lualine').setup({
    options = l_options,
    extension = {'quickfix', 'fugitive', 'fzf', 'nvim-tree'},
    sections = {
      lualine_b = {
          'hostname',
          'branch',
          'filename',
         {
          'diagnostics',
    --       -- table of diagnostic sources, available sources:
    --       -- 'nvim_lsp', 'nvim', 'coc', 'ale', 'vim_lsp'
    --       -- Or a function that returns a table like
    --       --   {error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt}
          sources = {'nvim_lsp'},
    --       -- displays diagnostics from defined severity
          sections = {'error', 'warn', 'info', 'hint'},
        }
      },

      lualine_c = {}
    }
})