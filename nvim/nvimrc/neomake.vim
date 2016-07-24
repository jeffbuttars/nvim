let g:neomake_javascript_enabled_makers = ['eslint', 'standard']
let g:neomake_verbose = 0
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

" let g:neomake_error_sign='✗'
" let g:neomake_warning_sign='⚠'

" *g:neomake_open_list*
" This setting will open the |loclist| or |quickfix| list (depending on whether
" it is operating on a file) when adding entries. A value of 2 will preserve the
" cursor position when the |loclist| or |quickfix| window is opened. Defaults to 0.
" let g:neomake_open_list = 2

" autocmd! VimLeave * let g:neomake_verbose = 0

" autocmd! CursorMovedI,BufWritePost,BufEnter,BufReadPost,TextChanged, * Neomake
" autocmd InsertLeave,BufWritePost,BufRead,CursorHold * Neomake
" autocmd BufWritePost,BufRead,CursorHold * Neomake
" autocmd BufWritePost,BufEnter * Neomake

" Lint as you type
" autocmd InsertChange,TextChanged,CursorHold,BufWritePost * silent update | Neomake
" Lint as you type, less agressive
" autocmd InsertChange,CursorHold * silent update | Neomake

" au! WinEnter,BufWritePost * Neomake
augroup MyNeomake
  autocmd!
  " autocmd BufEnter,WinEnter,InsertChange,CursorHold,TextChanged,InsertLeave * silent update | Neomake
  " autocmd BufEnter,WinEnter,InsertChange,CursorHold,TextChanged,InsertLeave * silent update | Neomake
  autocmd BufEnter,WinEnter,BufWritePost,CursorHold,InsertLeave * Neomake
  " autocmd BufWritePost,CursorHold * Neomake
augroup END
