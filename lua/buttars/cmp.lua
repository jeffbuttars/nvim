-- Delcaration and some setup for nvim-cmp. This is meant to be required by lsp-zero 'after'
local butt_utils = require("buttars.utils")
local cmp = require("cmp")
local lspkind = require("lspkind")
-- local lsp_zero = require('lsp-zero')

require("cmp_nvim_ultisnips").setup({})

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")


local cmp_formatting_kind_func = lspkind.cmp_format({
    mode = "symbol_text",
    maxwidth = 50,
    symbol_map = { Codeium = "", },
})

local cmp_formatting_source_name_map = {
    buffer = "Buf",
    cmdline = "Cmd",
    emoji = "Emoji",
    latex_symbols = "Latex",
    luasnip = "Snip",
    nvim_lsp = "LSP",
    nvim_lua = "Lua",
    path = "Path",
    spell = "Spell",
    tabnine = "T9",
    tags = "Tags",
    treesitter = "TS",
    ultisnips = "Snip",
    zsh = "Zsh",
    codeium = "Codeium",
}

local cmp_formatting_item_text = {
    Text = "Text",
    Method = "Meth",
    Function = "Func",
    Constructor = " Constructor",
    Field = "Field",
    Variable = "Var ",
    Class = "Cls ",
    Interface = "Interface",
    Module = "Mod ",
    Property = "Prop",
    Unit = "Unit",
    Value = "Val ",
    Enum = "Enum",
    Keyword = "KeyW",
    Snippet = "Snip",
    Color = "Colr",
    File = "File",
    Reference = "Ref ",
    Folder = "Dir ",
    EnumMember = "EnumMbr",
    Constant = "Const",
    Struct = "Struct",
    Event = "Event",
    Operator = "Oper",
    TypeParameter = "TypeParam",
    Codeium = "Codeium",
}

cmp.setup({
    completion = {
        completeopt = "menu,menuone,noselect",
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),

        --  Following is for  C-j/k completion/jumping with ultisnips
        ["<C-j>"] = cmp.mapping(function(fallback)
            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
        end, {
            "i",
            "s", --[[ "c" (to enable the mapping in command mode) ]]
        }),
        ["<C-k>"] = cmp.mapping(function(fallback)
            cmp_ultisnips_mappings.jump_backwards(fallback)
        end, {
            "i",
            "s", --[[ "c" (to enable the mapping in command mode) ]]
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                -- cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end, { "i", "s", "c" }),
    }),
    sources = {
        { name = "codeium",                keyword_length = 1, max_item_count = 3 },
        { name = "ultisnips",              keyword_length = 1, max_item_count = 5 },
        { name = "nvim_lsp",               keyword_length = 1, max_item_count = 5 },
        { name = "nvim_lsp_signature_help" },
        -- { name = "nvim_lua", max_item_count = 5 },
        { name = "buffer",                 keyword_length = 2, max_item_count = 5 },
        { name = "path",                   keyword_length = 2, max_item_count = 5 },
    },
    formatting = {
        expandable_indicator = true,
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- print("entry source: ", vim.inspect(entry))
            local kind_fmt = cmp_formatting_kind_func(entry, vim_item)
            local strings = vim.split(kind_fmt.kind, "%s", { trimempty = true })
            local source_name = cmp_formatting_source_name_map[entry.source.name] or entry.source.name

            -- Left side of word (icon)
            kind_fmt.kind = strings[1]

            -- Right side of word
            kind_fmt.menu = " " .. cmp_formatting_item_text[strings[2]]
                or strings[2] .. " " .. butt_utils.icons["fa-long_arrow_left"] .. source_name
            -- print("KIND: ", vim.inspect(kind))
            return kind_fmt
        end,
    },
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    experimental = {
        ghost_text = true
    }
})

-- https://github.com/hrsh7th/cmp-cmdline
-- Command completion setup
cmp.setup.cmdline(":", {
    -- completion = { autocomplete = false },
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})

cmp.setup.cmdline("/", {
    -- completion = { autocomplete = false },
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})
