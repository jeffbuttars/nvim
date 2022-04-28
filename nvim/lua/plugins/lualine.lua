-- local my_utils = require('local.utils')
local nf_icons = require('local.nf-icons')
local colors = require('local.utils').solarized_colors

-- You can explicitly set the color theme, or let lualine use the current colorscheme
-- to figure it out
-- local current_theme_name = vim.g.colors_name
-- -- Setup and customize our theme
-- local current_theme_name = 'solarized_light'

-- if vim.env.TERM_META == 'dark' then
--     current_theme_name = 'solarized_dark'
-- end

-- local current_theme = require('lualine.themes' .. '.' .. current_theme_name)
local remote_hostname_color = '#FF6666'

function in_remote_session ()
  -- print("in_remote_session:", not not (vim.env.SSH_CLIENT or vim.env.SSH_TTY))
  return not not (vim.env.SSH_CLIENT or vim.env.SSH_TTY)
end

-- if vim.env.TERM_META == 'dark' then
--     -- make the colors the same on boths sides of the line
--     -- current_theme.normal.b = current_theme.normal.c
--     current_theme.normal.b.bg = colors.base02
--     current_theme.normal.b.fg = colors.base0

--     current_theme.normal.c.bg = colors.base03
--     current_theme.normal.c.fg = colors.base1

--     if in_remote_session() then
--         remote_hostname_color = colors.orange
--     end
-- end

-- https://github.com/hoob3rt/lualine.nvim

-- local custom_gruvbox = require'lualine.themes.gruvbox'
-- -- Change the background of lualine_c section for normal mode
-- custom_gruvbox.normal.c.bg = '#112233' -- rgb colors are supported
-- require'lualine'.setup{
--   options = { theme  = custom_gruvbox },
--   ...
-- }

local l_options = {
  section_separators = { left = nf_icons['ple-right_half_circle_thick'], right = nf_icons['ple-left_half_circle_thick'] },
  -- component_separators = {nf_icons['ple-right_half_circle_thick'], nf_icons['ple-left_half_circle_thick']}

  -- 'pl-right_soft_divider' => ''
  -- 'pl-left_soft_divider' => ''
  -- component_separators = { left = nf_icons['pl-left_soft_divider'], right = nf_icons['pl-right_soft_divider'] },
  -- theme = current_theme
}

local lualine_cfg = {
    options = l_options,
    extension = {'quickfix', 'fugitive', 'fzf', 'nvim-tree'},
    sections = {
      lualine_b = {
        {
          'hostname',
          cond = in_remote_session,
          color = { fg = remote_hostname_color },
        },
        'branch',
      },
      lualine_c = {
          {
            'filename',
            separator = nf_icons['oct-dash'],
            -- separator = ':',
          },
          {
            'filesize',
            separator = ' ' .. nf_icons['oct-bug'],
            -- separator = nf_icons['pl-left_soft_divider'],
          },
          {
            'diagnostics',
            -- table of diagnostic sources, available sources:
            -- 'nvim_diagnostic', 'nvim', 'coc', 'ale', 'vim_lsp'
            -- Or a function that returns a table like
            --   {error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt}
            sources = {'nvim_diagnostic'},
            -- displays diagnostics from defined severity
            sections = {'error', 'warn', 'info', 'hint'},
            separator = nf_icons['pl-left_soft_divider'],
          }
      },
      -- lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_x = {},
      lualine_y = {'filetype'},
      lualine_z = {'progress', 'location'}
    }
}

require('lualine').setup(lualine_cfg)