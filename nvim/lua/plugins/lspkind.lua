-- https://github.com/onsails/lspkind-nvim

-- require'lspkind'.init({
-- })

require'lspkind'.init({
--     -- enables text annotations
--     --
--     -- default: true
    with_text = true,

--     -- default symbol map
--     -- can be either 'default' or
--     -- 'codicons' for codicon preset (requires vscode-codicons font installed)
--     --
--     -- default: 'default'
--     -- preset = 'codicons',
    preset = 'default',

--     -- override preset symbols
--     --
--     -- default: {}
    symbol_map = {
      Text = '',
      Method = ' Meth',
      Function = '  Func',
      Constructor = '',
      Variable = '  Var',
      Class = '  Cls',
      Interface = '  Mod',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    }
});

-- let g:completion_customize_lsp_label = {
--             \ 'Buffers': '﬘ Buf',
--             \ 'Class': ' Class',
--             \ 'Color': ' Color',
--             \ 'Constant': ' Const',
--             \ 'Constructor': ' Constructor',
--             \ 'Enum': '了 Enum',
--             \ 'EnumMember': ' EnumMember',
--             \ 'File': ' File',
--             \ 'Folder': ' Folder',
--             \ 'Function': ' Func',
--             \ 'Interface': 'ﰮ Interface',
--             \ 'Keyword': ' Keyword',
--             \ 'Method': 'ƒ Method',
--             \ 'Module': ' Module',
--             \ 'Property': ' Prop',
--             \ 'Snippet': ' Snip',
--             \ 'UltiSnips': ' Snip',
--             \ 'Struct': ' Struct',
--             \ 'Text': ' Text',
--             \ 'tabnine': ' ',
--             \ 'TabNine': ' ',
--             \ 'Unit': ' Unit',
--             \ 'Value': ' Val',
--             \ 'Variable': ' Var',
--             \}
--

-- require('vim.lsp.protocol').CompletionItemKind = {
--     '', -- Text
--     ' Meth', -- Method
--     '  Func', -- Function
--     '', -- Constructor
--     '', -- Field
--     '  Var ', -- Variable
--     '  Cls ', -- Class
--     'ﰮ', -- Interface
--     '  Mod ', -- Module
--     '', -- Property
--     '', -- Unit
--     '', -- Value
--     '了', -- Enum
--     '  Key ', -- Keyword
--     '  Snip', -- Snippet
--     '', -- Color
--     '', -- File
--     '', -- Reference
--     '', -- Folder
--     '', -- EnumMember
--     '  Const', -- Constant
--     '', -- Struct
--     '', -- Event
--     'ﬦ  Oper', -- Operator
--     '  Param', -- TypeParameter
-- }
