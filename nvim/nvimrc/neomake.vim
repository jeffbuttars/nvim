let g:neomake_javascript_enabled_makers = ['eslint', 'standard']
let g:neomake_verbose = 0
" let g:neomake_error_sign='✗'
" let g:neomake_warning_sign='⚠'

" autocmd! CursorMovedI,BufWritePost,BufEnter,BufReadPost,TextChanged, * Neomake
" autocmd InsertLeave,BufWritePost,BufRead,CursorHold * Neomake
autocmd BufWritePost,BufRead,CursorHold * Neomake
