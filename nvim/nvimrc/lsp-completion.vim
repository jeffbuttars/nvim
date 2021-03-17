" https://github.com/neovim/nvim-lspconfig

" " Example config from lsp docs
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" Show lsp virtual text on cursor hold
augroup lsp
    autocmd!
    autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
    "autocmd CursorHold * lua vim.lsp.buf.document_highlight()
    autocmd BufEnter * lua require'completion'.on_attach()
augroup END

" autocmd BufWritePost * lua vim.lsp.buf.formatting()

" When TreeSitter is solid, add it as the 'ts' item
" \{'complete_items': ['lsp', 'ts', 'tabnine', 'snippet', 'buffers']},

" Configure the completion chains
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'tabnine', 'snippet', 'buffers']},
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
let g:completion_enable_auto_signature = 1
let g:completion_enable_auto_hover = 1
let g:completion_enable_auto_popup = 1

"
" possible value: "length", "alphabet", "none"
let g:completion_sorting = "length"
let g:completion_matching_strategy_list = ['exact', 'fuzzy', 'substring', 'all']
let g:completion_trigger_keyword_length = 1 " default = 1
let g:completion_timer_cycle = 80 "default value is 80
let g:completion_matching_smart_case = 1

let g:completion_customize_lsp_label = {
            \ 'Buffers': '﬘ Buf',
            \ 'Class': ' Class',
            \ 'Color': ' Color',
            \ 'Constant': ' Const',
            \ 'Constructor': ' Constructor',
            \ 'Enum': '了 Enum',
            \ 'EnumMember': ' EnumMember',
            \ 'File': ' File',
            \ 'Folder': ' Folder',
            \ 'Function': ' Func',
            \ 'Interface': 'ﰮ Interface',
            \ 'Keyword': ' Keyword',
            \ 'Method': 'ƒ Method',
            \ 'Module': ' Module',
            \ 'Property': ' Prop',
            \ 'Snippet': ' Snip',
            \ 'UltiSnips': ' Snip',
            \ 'Struct': ' Struct',
            \ 'Text': ' Text',
            \ 'tabnine': ' ',
            \ 'Unit': ' Unit',
            \ 'Value': ' Val',
            \ 'Variable': ' Var',
            \}
