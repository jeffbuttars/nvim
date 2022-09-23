
-- Set a builtin scheme as a default
-- vim.g.colors_name = 'elflord'

vim.opt.termguicolors = true
vim.opt.cursorline = false

vim.opt.background = 'light'
vim.g.colors_name = 'solarized'
vim.cmd("colorscheme solarized")

if vim.env.TERM_META == 'dark' then
    vim.opt.background = 'dark'
    vim.g.colors_name = 'terafox'
    vim.cmd("colorscheme terafox")
    -- vim.g.colors_name = 'nightfox'
    -- vim.g.colors_name = 'duskfox'
    -- vim.g.colors_name = 'nordfox'
elseif vim.env.TERM_META == 'light' then
    vim.g.colors_name = 'solarized'
    vim.cmd("colorscheme solarized")
    -- vim.g.colors_name = 'dayfox'
    -- vim.g.colors_name = 'dawnfox'
end

vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- gray
vim.cmd('highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080')

-- blue
vim.cmd('highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6')
vim.cmd('highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6')

-- light blue
vim.cmd('highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE')
vim.cmd('highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE')
vim.cmd('highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE')

-- pink
vim.cmd('highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0')
vim.cmd('highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0')

-- front
vim.cmd('highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4')
vim.cmd('highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4')
vim.cmd('highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4')

vim.cmd('highlight! PmenuSel guibg=#282C34 guifg=NONE')
vim.cmd('highlight! Pmenu guibg=NONE guifg=#C5CDD9')

local cmp_high_group = {
  PmenuSel = { bg = "#282C34", fg = "NONE" },
  Pmenu = { fg = "#C5CDD9", bg = "NONE" },

  CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", fmt = "strikethrough" },
  CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", fmt = "bold" },
  CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", fmt = "bold" },
  CmpItemMenu = { fg = "#C792EA", bg = "NONE", fmt = "italic" },

  CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },

  CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },

  CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },

  CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },

  CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
  CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },

  CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },

  CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },

  CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
  CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
  CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
}

-- for k, v in pairs(cmp_high_group) do
--     vim.cmd('highlight! '.. k .. ' guibg=' .. v.bg .. ' guifg=' .. v.fg)
--     -- print('highlight! '.. k .. ' guibg=' .. v.bg .. ' guifg=' .. v.fg)
-- end
