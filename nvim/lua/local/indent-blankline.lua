-- vim.opt.termguicolors = true

-- Solarized colors

-- for k,v in pairs(require('solarized.solarized-normal.highlights')) do
--     print(k, v)
-- end

print("terminal_color_0" .. vim.g.terminal_color_0)

-- local ib1 = require('solarized.solarized-normal.highlights.colors.base02')[0]

vim.cmd("highlight IndentBlanklineIndent1 guibg=" .. vim.g.terminal_color_0 .. " gui=nocombine")
vim.cmd("highlight IndentBlanklineIndent2 guibg=" .. vim.g.terminal_color_10 .. " gui=nocombine")
-- vim.cmd("highlight IndentBlanklineIndent2 guibg=" .. vim.g.terminal_color_10 .. " gui=nocombine")
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

-- require("indent_blankline").setup
--     char = " ",
--     char_highlight_list = {
--         "IndentBlanklineIndent1",
--         "IndentBlanklineIndent2",
--     },
--     space_char_highlight_list = {
--         "IndentBlanklineIndent1",
--         "IndentBlanklineIndent2",
--     },
--     show_trailing_blankline_indent = false,
-- }
-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    char = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },

    space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },

    show_trailing_blankline_indent = false,

    -- space_char_blankline = " ",
    -- show_current_context = true,
}
