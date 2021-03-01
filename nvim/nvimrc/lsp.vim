" https://neovim.io/doc/user/lsp.html
" https://github.com/neovim/nvim-lspconfig
"
lua << EOF
require'lspconfig'.pyls.setup{
  configurationSources = { "flake8", "black", "mypy" };
}
require'lspconfig'.pyright.setup{}
require("nvim-ale-diagnostic")
EOF

" Example config from lsp docs
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" help vim.lsp.diagnostic.on_publish_diagnostics
" Note:
"     Each of the configuration options accepts:
"     • `false` : Disable this feature
"     • `true` : Enable this feature, use default settings.
"     • `table` : Enable this feature, use overrides.
"     • `function`: Function with signature (bufnr, client_id) that
"         returns any of the above.>
lua << EOF

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,

    -- Enable virtual text, override spacing to 4
--    virtual_text = {
--      spacing = 2,
--      prefix = '|~',
--    },
    virtual_text = false,

    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    -- signs = function(bufnr, client_id)
    --   return vim.bo[bufnr].show_signs == false
    -- end,
    signs = true,

    -- Disable a feature
    -- • Update diagnostics in InsertMode or wait
    -- until InsertLeave
    update_in_insert = true,
  }
)
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     underline = true,
--     virtual_text = false,
--     signs = true,
--     update_in_insert = false,
--   }
-- )
EOF

" Show lsp virtual text on cursor hold
augroup lsp
    autocmd!
    autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
    autocmd BufEnter * lua require'completion'.on_attach()
augroup END

" require'lspconfig'.pylance.setup{
"   settings = {
"     python = {
"       analysis = {
"         typeCheckingMode = "strict"
"       }
"     }
"   }
" }

" Configure the completion chains
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet', 'tabnine', 'buffers', 'ts']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]

" let g:completion_chain_complete_list = {
"             \'default' : {
"             \	'default' : [
"             \		{'complete_items' : ['lsp', 'snippet', 'tabnine']},
"             \		{'mode' : 'file'}
"             \	],
"             \	'comment' : [],
"             \	'string' : []
"             \	},
"             \'vim' : [
"             \	{'complete_items': ['snippet', 'tabnine']},
"             \	{'mode' : 'cmd'}
"             \	],
"             \'c' : [
"             \	{'complete_items': ['ts']}
"             \	],
"             \'python' : [
"             \	{'complete_items': ['lsp', 'ts']}
"             \	],
"             \'lua' : [
"             \	{'complete_items': ['ts']}
"             \	],
"             \}

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

set completeopt-=preview
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
let g:completion_enable_snippet = 'UltiSnips'

	" configurationSources = { "pyflakes", "black", "mypy", "pycodestyle" };
	" plugins = {
	"     black = {
	"         enabled = true;
	"     };
	"     jedi_completion = {
	"         enabled = true;
	"         fuzzy = true;
	"     }
	" }
