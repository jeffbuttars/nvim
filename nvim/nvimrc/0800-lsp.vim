" https://neovim.io/doc/user/lsp.html
" https://github.com/neovim/nvim-lspconfig

lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.pyls.setup{
  configurationSources = { "flake8", "black", "mypy" };
  plugins = {
    flake8 = { enabled = true };
    pyflakes = { enabled = false };
    pycodestyle = { enabled = false };
  }
}

require("nvim-ale-diagnostic")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)
EOF

" require("local_mods/treesitter")
" EOF
"
" " Example config from lsp docs
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
"
" " help vim.lsp.diagnostic.on_publish_diagnostics
" " Note:
" "     Each of the configuration options accepts:
" "     • `false` : Disable this feature
" "     • `true` : Enable this feature, use default settings.
" "     • `table` : Enable this feature, use overrides.
" "     • `function`: Function with signature (bufnr, client_id) that
" "         returns any of the above.>
" lua << EOF
"
" EOF

" Show lsp virtual text on cursor hold
augroup lsp
    autocmd!
    autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
    autocmd BufEnter * lua require'completion'.on_attach()
augroup END

" autocmd BufWritePost * lua vim.lsp.buf.formatting()

" Configure the completion chains
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet', 'tabnine', 'buffers', 'ts']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]


" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
" "
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
" "
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"

"
" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
let g:completion_enable_snippet = 'UltiSnips'

" let g:completion_enable_auto_popup = 0
"
" possible value: "length", "alphabet", "none"
let g:completion_sorting = "length"
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_trigger_keyword_length = 2 " default = 1
let g:completion_timer_cycle = 500 "default value is 80
