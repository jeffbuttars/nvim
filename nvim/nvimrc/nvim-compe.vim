" https://github.com/hrsh7th/nvim-compe#concept


set completeopt=menuone,noselect

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.calc = v:true
let g:compe.source.zsh = v:true

let g:compe.source.buffer = {}
let g:compe.source.buffer.priority = 4000

" TabNine source
" Enable
let g:compe.source.tabnine = {}
let g:compe.source.tabnine.priority = 5000

let g:compe.source.nvim_treesitter = {}
let g:compe.source.nvim_treesitter.priority = 5500

let g:compe.source.nvim_lsp = {}
let g:compe.source.nvim_lsp.priority = 7000

let g:compe.source.nvim_lua = v:true

let g:compe.source.ultisnips = {}
let g:compe.source.ultisnips.priority = 6000


" Mappings
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Highlight
" You can change documentation window's highlight group via following.
highlight link CompeDocumentation NormalFloat


" Or, to set some options:
" let g:compe.source.tabnine = {}
" let g:compe.source.tabnine.max_line = 1000
" let g:compe.source.tabnine.max_num_results = 7
" let g:compe.source.tabnine.priority = 5000

lua << EOF
-- Set snippetSupport=true for LSP capabilities.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Tab and S-Tab keys need to be mapped to <C-n> and <C-p> when completion menu is visible.
-- Following example will use Tab and S-Tab (shift+tab)
-- to navigate completion menu and jump between vim-vsnip placeholders when possible:

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  -- elseif vim.fn.call("snip#available", {1}) == 1 then
  --   return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  -- elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
  --   return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF
