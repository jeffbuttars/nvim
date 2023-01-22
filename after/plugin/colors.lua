-- Declare hl groups for cmp completion menu
cmp_hl_group = {
	PmenuSel = { bg = "#282C34", fg = "NONE" },
	Pmenu = { fg = "#C5CDD9", bg = "#22252A" },

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

for k, v in pairs(cmp_hl_group) do
	vim.cmd("highlight! " .. k .. " guibg=" .. v.bg .. " guifg=" .. v.fg)
	-- print('highlight! '.. k .. ' guibg=' .. v.bg .. ' guifg=' .. v.fg)
end

-- Make text that crosses the column limit standout
vim.api.nvim_set_hl(0, "OverColLimit", { standout = true })

-- Solarized
-- local color_scheme = "solarized-high"
-- vim.g.colors_name = "solarized"

if vim.env.TERM_META == "dark" then
	vim.opt.background = "dark"
elseif vim.env.TERM_META == "light" then
	vim.opt.background = "light"
end

-- Rose Pine
local color_scheme = "rose-pine"
-- vim.g.colors_name = color_scheme

-- https://github.com/rose-pine/neovim
require("rose-pine").setup({
	dark_variant = "moon",
})

-- --
-- -- Solarized setup
-- --
-- vim.g.solarized_visibility = "high"
-- vim.g.solarized_statusline = "high"
-- vim.g.solarized_diffmode = "normal"
--
-- -- termtrans If you want to keep the transparency in your terminal (default: disabled)
-- -- To enable transparency
-- if vim.fn.has("gui_running") == 0 then
-- 	vim.g.solarized_termtrans = 0
-- else
-- 	vim.g.solarized_termtrans = 1
-- end

-- Set the colorscheme!
vim.cmd.colorscheme(color_scheme)
