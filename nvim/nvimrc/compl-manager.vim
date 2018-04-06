" https://github.com/roxma/nvim-completion-manager


" [source_priority, trigger_char_num]
let g:cm_refresh_length = [[1,2],[7,1]]

" let g:cm_matcher = {'module': "cm_matchers.fuzzy_matcher", 'case': "smartcase"}

" let g:flow#flowpath


" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to hide the menu and also start a new line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use tab to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

au User CmSetup call cm#register_source({'name' : 'cm-javascript-omni',
        \ 'priority': 8,
        \ 'abbreviation': 'omni',
        \ 'scopes': ['javascript','jsx'],
        \ 'word_pattern': '[\w$\-]+',
        \ 'cm_refresh_patterns':['\.'],
        \ 'cm_refresh': {'omnifunc': 'javascriptcomplete#CompleteJS'},
        \ })

" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
