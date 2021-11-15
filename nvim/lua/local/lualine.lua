-- local my_utils = require('local.utils')
local nf_icons = require('local.nf-icons')
local ll_utils = require 'lualine.utils.utils'

local current_theme_name = 'solarized_dark'
local current_theme = require('lualine.themes' .. '.' .. current_theme_name)

-- https://github.com/hoob3rt/lualine.nvim

-- local custom_gruvbox = require'lualine.themes.gruvbox'
-- -- Change the background of lualine_c section for normal mode
-- custom_gruvbox.normal.c.bg = '#112233' -- rgb colors are supported
-- require'lualine'.setup{
--   options = { theme  = custom_gruvbox },
--   ...
-- }

local l_options = {
  section_separators = {nf_icons['ple-right_half_circle_thick'], nf_icons['ple-left_half_circle_thick']},
  -- section_separators = {my_utils.icons.half_circle_right_filled, my_utils.icons.half_circle_left_filled},
  -- component_separators = {my_utils.icons.cresent_circle_right, my_utils.icons.cresent_circle_left}

}

if vim.env.TERM_META == 'dark' then
    l_options.theme = 'solarized_dark'
else
    l_options.theme = 'solarized_light'
end

require('lualine').setup({
    options = l_options,
    extension = {'quickfix', 'fugitive', 'fzf', 'nvim-tree'},
    sections = {
      lualine_b = {
          'hostname',
          {
            'branch',
            color = {
                  bg = current_theme.normal.c.bg,
                  fg =  current_theme.normal.c.fg,
            },
            separator = {
                left = nf_icons['pl-left_soft_divider'],
                right = nf_icons['pl-left_soft_divider'],
            },
          },
          {
            'filename',
            color = {
                  bg = current_theme.normal.c.bg,
                  fg =  current_theme.normal.c.fg,
            },
            separator = nf_icons['ple-right_half_circle_thick'],
          },
          -- 'diff',
         {
          'diagnostics',
    --       -- table of diagnostic sources, available sources:
    --       -- 'nvim_lsp', 'nvim', 'coc', 'ale', 'vim_lsp'
    --       -- Or a function that returns a table like
    --       --   {error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt}
          sources = {'nvim_lsp'},
    --       -- displays diagnostics from defined severity
          sections = {'error', 'warn', 'info', 'hint'},
          diagnostics_color = {
              error = {
                  bg = current_theme.normal.c.bg
              },
              warn = {
                  bg = current_theme.normal.c.bg
              },
              info = {
                  bg = current_theme.normal.c.bg
              },
              hint = {
                  bg = current_theme.normal.c.bg
              },
          --   -- Same values like general color option can be used here.
          --   error = 'DiagnosticError', -- changes diagnostic's error color
          --   warn  = 'DiagnosticWarn',  -- changes diagnostic's warn color
          --   info  = 'DiagnosticInfo',  -- Changes diagnostic's info color
          --   hint  = 'DiagnosticHint',  -- Changes diagnostic's hint color
          },
    -- --       symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
          colored = true, -- displays diagnostics status in color if set to true
          update_in_insert = false, -- Update diagnostics in insert mode
          always_visible = false, -- Show diagnostics even if count is 0, boolean or function returning boolean
        }
      },

      lualine_c = {}
    }
})
