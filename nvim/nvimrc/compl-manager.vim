" https://github.com/roxma/nvim-completion-manager


" Most relevant matches start after 1 character, less relevant are included after 3 chars types
let g:cm_refresh_default_min_word_len = [[1,3],[7,1]]

inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
