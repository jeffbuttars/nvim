-- https://github.com/L3MON4D3/LuaSnip

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()

local luasnip = require("luasnip")

-- vim.keymap.set("i", "<C-j>", "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : ''")
vim.keymap.set(
    "i",
    "<C-j>",
    function()
        if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        end
    end,
    { desc = "LuaSnip trigger and jump forward" }
)
