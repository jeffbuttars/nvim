
-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
-- https://github.com/hrsh7th/nvim-cmp

vim.o.completeopt = "menu,menuone,noselect"
local cik = require('vim.lsp.protocol').CompletionItemKind

local lspkind = require('lspkind')
local cmp = require'cmp'

local comp_items = {
-- if you change or add symbol here
-- replace corresponding line in readme
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

local comp_items_w_text = {
-- if you change or add symbol here
-- replace corresponding line in readme
    Text = comp_items.Text .. " Text",
    Method = comp_items.Method .. " Meth",
    Function = comp_items.Function .. " Func",
    Constructor = comp_items.Constructor .. " Constructor",
    Field = comp_items.Field .. " Field",
    Variable = comp_items.Variable .. " Var",
    Class = comp_items.Class .. " Class",
    Interface = comp_items.Interface .. " Interface",
    Module = comp_items.Module .. " Mod",
    Property = comp_items.Property .. " Prop",
    Unit = comp_items.Unit .. " Unit",
    Value = comp_items.Value .. " Value",
    Enum = comp_items.Enum .. " Enum",
    Keyword = comp_items.Keyword .. " Keyw",
    Snippet = comp_items.Snippet .. " Snip",
    Color = comp_items.Color .. " Color",
    File = comp_items.File .. " File",
    Reference = comp_items.Reference .. " Ref",
    Folder = comp_items.Folder .. " Folder",
    EnumMember = comp_items.EnumMember .. " EnumMember",
    Constant = comp_items.Constant .. " Const",
    Struct = comp_items.Struct .. " Struct",
    Event = comp_items.Event .. " Event",
    Operator = comp_items.Operator .. " Oper",
    TypeParameter = comp_items.TypeParameter .. " Type",
}

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
            -- vim_item.kind = comp_items[vim_item.kind] .. " " .. vim_item.kind
            vim_item.kind = comp_items_w_text[vim_item.kind]
            return vim_item
        end
    },
    sources = {
      -- For ultisnips user.
      { name = 'ultisnips' },

      { name = 'nvim_lsp' },
      { name = 'tabnine' },

      -- For vsnip user.
      -- { name = 'vsnip' },

      -- For luasnip user.
      -- { name = 'luasnip' },
      --
      { name = 'nvim_lua' },

      { name = 'buffer', kind = '﬘' },
      { name = 'treesitter' },
      { name = 'path' },
      -- { name = 'nuspell' },
      { name = 'spell' },
      { name = 'calc' },
      { name = 'look' },
      { name = 'zsh' },
      { name = 'tags' },
    }
})

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
        max_lines = 1000;
        max_num_results = 10;
        sort = true;
        run_on_every_keystroke = true;
        snippet_placeholder = '..';
})

-- require'cmp'.setup {
--   enabled = true,
--   autocomplete = true,
--   debug = false,
--   min_length = 1,
--   preselect = 'enable',
--   throttle_time = 80,
--   source_timeout = 200,
--   resolve_timeout = 800,
--   incomplete_delay = 400,
--   max_abbr_width = 100,
--   max_kind_width = 100,
--   max_menu_width = 100,

--   documentation = {
--     border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
--     winhighlight = "NormalFloat:cmpDocumentation,FloatBorder:cmpDocumentationBorder",
--     max_width = 120,
--     min_width = 60,
--     max_height = math.floor(vim.o.lines * 0.3),
--     min_height = 1,
--   },

--   source = {

--     ultisnips = {
--         priority = 9000,
--         kind = '',
--         menu = '| Snip',
--     },

--     nvim_lsp = {
--         priority = 8000,
--         menu = '| LSP',
--     },

--     tabnine = {
--         priority = 7000,
--         menu = '| TN',
--         kind = '',
--     },

--     buffer = {
--         priority = 6000,
--         menu = '| Buffer',
--         kind = '﬘',
--     },

--     -- buffer = true,
--     -- tabnine = true,
--     ultisnips = true,
--     calc = {
--         menu = '| Calc',
--     },
--     nvim_lua = true,
--     path = true,
--     spell = true,
--     tags = true,
--     vsnip = false,
--     luasnip = false,
--     zsh = true,
--     treesitter = true,
--   },
-- }

--   -- Set snippetSupport=true for LSP capabilities.
--   local capabilities = vim.lsp.protocol.make_client_capabilities()
--   capabilities.textDocument.completion.completionItem.snippetSupport = true
--
--
--   local t = function(str)
--     return vim.api.nvim_replace_termcodes(str, true, true, true)
--   end
--
--   local check_back_space = function()
--       local col = vim.fn.col('.') - 1
--       if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--           return true
--       else
--           return false
--       end
--   end

--   -- Use (s-)tab to:
--   --- move to prev/next item in completion menuone
--   --- jump to prev/next snippet's placeholder
--   _G.tab_complete = function()
--     if vim.fn.pumvisible() == 1 then
--       return t "<C-n>"
--     elseif check_back_space() then
--       return t "<Tab>"
--     else
--       return vim.fn['cmp#complete']()
--     end
--   end
--
--   _G.s_tab_complete = function()
--     if vim.fn.pumvisible() == 1 then
--       return t "<C-p>"
--     else
--       return t "<S-Tab>"
--     end
--   end
--
--   -- _G.s_cmp_menu_close_and_return = function()
--   --     return vim.fn['cmp#close']('<c-e>')
--   --     -- return t "<cr>"
--   -- end
--
--   -- Map tab to the above tab complete functions
--   vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
--   vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
--   vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
--   vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

--   -- Map cmp confirm and complete functions
--   -- vim.api.nvim_set_keymap('i', '<CR>', 'cmp#confirm("<CR>")', { expr = true })
--   vim.api.nvim_set_keymap('i', '<C-e>', 'cmp#close("<C-e>")', { expr = true })
--   vim.api.nvim_set_keymap('i', '<c-space>', 'cmp#complete()', { expr = true })
--
--   -- For use with cohama/lexima.vim
--   -- vim.api.nvim_set_keymap('i', '<C-CR>', 'cmp#confirm(lexima#expand("<LT><cr>", "i"))', { expr = true })
--   -- vim.api.nvim_set_keymap('i', '<cr>', 'cmp#confirm(lexima#expand("<LT><cr>", "i"))', { expr = true })
--   vim.api.nvim_set_keymap('i', '<cr>', 'cmp#close("<cr>")', { expr = true })
--   -- vim.api.nvim_set_keymap('i', '<cr>', 'cmp#v:lua.s_cmp_menu_close_and_return()', { expr = true })
--   vim.api.nvim_set_keymap('i', '<C-f>', 'cmp#scroll_docs({ "delta": +4 })', { expr = true })
--   vim.api.nvim_set_keymap('i', '<C-d>', 'cmp#scroll_docs({ "delta": +4 })', { expr = true })
