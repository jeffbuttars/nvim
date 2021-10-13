-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
-- https://github.com/hrsh7th/nvim-cmp

vim.o.completeopt = "menu,menuone,noselect"

-- Tabnine config
local tabnine = require('cmp_tabnine.config')
tabnine:setup({
        -- max_lines = 1000;
        max_num_results = 10;
        -- sort = true;
        -- run_on_every_keystroke = true;
        -- snippet_placeholder = '..';
})

local cmp = require'cmp'

local source_name_map = {
    nvim_lsp = "[LSP]",
    buffer = "[Buf]",
    treesitter = "[TS]",
    luasnip = "[Snip]",
    ultisnips = "[Snip]",
    tabnine = "[T9]",
    nvim_lua = "[Lua]",
    path = "[Path]",
    spell = "[Spell]",
    latex_symbols = "[Latex]",
    tags = "[Tags]",
    zsh = "[Zsh]",
}

local comp_items = {
-- if you change or add symbol here
-- replace corresponding line in readme
    -- Text = "",
    Text = " ",
    -- Method = "",
    -- Method = '',
    Method = ' ',
    Function = " ",
    -- Constructor = "",
    Constructor = ' ',
    Field = "ﰠ ",
    Variable = " ",
    Class = "ﴯ ",
    Interface = " ",
    Module = " ",
    -- Property = "ﰠ",
    Property = '',
    Unit = " 塞",
    Value = " ",
    -- Enum = "",
    Enum = '了 ',
    -- Keyword = "",
    Keyword = ' ',
    -- Snippet = "",
    Snippet = ' ',
    Color = " ",
    File = " ",
    Reference = " ",
    Folder = " ",
    EnumMember = "",
    -- Constant = "",
    Constant = ' ',
    Struct = "פּ ",
    Event = " ",
    Operator = " ",
    TypeParameter = "  "
}

local comp_items_text = {
-- if you change or add symbol here
-- replace corresponding line in readme
    Text = "Text",
    Method = "Meth",
    Function = "Func",
    Constructor = " Constructor",
    Field = "Field",
    Variable = "Var",
    Class = "Cls",
    Interface = "Interface",
    Module = "Mod",
    Property = "Prop",
    Unit = "Unit",
    Value = "Value",
    Enum = "Enum",
    Keyword = "KeyW",
    Snippet = "Snip",
    Color = "Color",
    File = "File",
    Reference = "Ref",
    Folder = "Folder",
    EnumMember = "EnumMember",
    Constant = "Const",
    Struct = "Struct",
    Event = "Event",
    Operator = "Oper",
    TypeParameter = "TypeParam",
}

local comp_items_w_text = {}
for k, v in pairs(comp_items) do
    comp_items_w_text[k] = comp_items[k] .. " " .. comp_items_text[k]
end

cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

        -- For `luasnip` user.
        -- require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
    },
    formatting = {
        format = function(entry, vim_item)
            if vim_item.abbr then
                vim_item.abbr = comp_items[vim_item.kind] .. "" .. vim_item.abbr
            end

            -- vim_item.kind = comp_items_text[k]

            vim_item.kind = comp_items_text[vim_item.kind]

            -- set a name for each source
            vim_item.menu = source_name_map[entry.source.name]

            -- vim_item.kind = comp_items[vim_item.kind] .. " | " .. entry.source.name
            -- for k, v in pairs(vim_item) do
            --     print(k, v)
            -- end

            return vim_item
        end
    },
    sources = {
      -- For ultisnips user.
      { name = 'nvim_lsp' },
      { name = 'ultisnips' },
      { name = 'cmp_tabnine' },

      -- For vsnip user.
      -- { name = 'vsnip' },

      -- For luasnip user.
      -- { name = 'luasnip' },
      --
      { name = 'treesitter' },
      { name = 'buffer' },
      { name = 'nvim_lua' },
      { name = 'path' },
      -- { name = 'nuspell' },
      { name = 'spell' },
      { name = 'calc' },
      { name = 'look' },
      { name = 'zsh' },
      { name = 'tags' },
    },
    documentation = {
        -- border b_top , b_right , b_bot , b_left , b_topleft , b_topright , b_botright , b_botleft
        -- border = { '', '', '', ' ', '', '', '', ' ' },
        -- border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
        border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
    },
})
