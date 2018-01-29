" https://github.com/roxma/nvim-completion-manager


" Most relevant matches start after 1 character, less relevant are included after 3 chars types
" let g:cm_refresh_default_min_word_len = [[1,3],[7,1]]
let g:cm_refresh_length = [[1,1],[7,1]]


let g:cm_matcher = {'module': "cm_matchers.fuzzy_matcher", 'case': "smartcase"}

" let g:flow#flowpath


" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to hide the menu and also start a new line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use tab to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
