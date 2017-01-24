" load local eslint in the project root
" modified from https://github.com/mtscout6/syntastic-local-eslint.vim

let g:neomake_javascript_enabled_makers = ['eslint', 'jscs']
let g:neomake_jsx_enabled_makers = ['eslint', 'jscs']
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

" let g:neomake_jsx_eslint_exe =g:neomake_javascript_eslint_exe
" let g:neomake_jsx_enabled_makers =g:neomake_javascript_enabled_makers
" let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint')

" let g:neomake_python_prospector_maker = {
"             \ 'args': ['-o', 'pylint', '-M', '--absolute-paths', '%:p', '-W', 'pylint'],
"             \ 'errorformat':
"             \ '%-G%.%#module named%.%#,' .
"             \ '%f:%l:%c [%t%n%.%#] %m,' .
"             \ '%E%f:%l%\%.%c %trror: %m,' .
"             \ '%E%f:%l%\%.%c-%\d%\+%\%.%\d%\+ %trror: %m,' .
"             \ '%W%f:%l%\%.%c %tarning: %m,' .
"             \ '%W%f:%l%\%.%c-%\d%\+%\%.%\d%\+ %tarning: %m,' .
"             \ '%C%\s%\+%m,' .
"             \ '%-G%.%#'
"             \ }
let g:neomake_python_prospector_maker = {
            \ 'args': ['-o', 'pylint', '--absolute-paths', '%:p'],
            \ 'errorformat':
            \ '%-G%.%#module named%.%#,' .
            \ '%f:%l:%c [%t%n%.%#] %m,' .
            \ '%E%f:%l%\%.%c %trror: %m,' .
            \ '%E%f:%l%\%.%c-%\d%\+%\%.%\d%\+ %trror: %m,' .
            \ '%W%f:%l%\%.%c %tarning: %m,' .
            \ '%W%f:%l%\%.%c-%\d%\+%\%.%\d%\+ %tarning: %m,' .
            \ '%C%\s%\+%m,' .
            \ '%-G%.%#'
            \ }
" let g:neomake_python_enabled_makers = ['prospector', 'flake8', 'pylint']
" let g:neomake_python_enabled_makers = ['prospector', 'flake8', 'pylint', 'pylama']
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_verbose = 0
let g:neomake_echo_current_error = 1
let g:neomake_airline = 1
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

let g:neomake_python_flake8_args = ["--max-line-length=99"]
" let g:neomake_error_sign='✗'
" let g:neomake_warning_sign='⚠'

" *g:neomake_open_list*
" This setting will open the |loclist| or |quickfix| list (depending on whether
" it is operating on a file) when adding entries. A value of 2 will preserve the
" cursor position when the |loclist| or |quickfix| window is opened. Defaults to 0.
let g:neomake_open_list = 0

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
"   autocmd!
  " autocmd BufEnter,WinEnter,InsertChange,CursorHold,TextChanged,InsertLeave * silent update | Neomake

  " Recommended
  " autocmd BufWritePost,CursorHold * Neomake
  autocmd BufEnter,WinEnter,BufWritePost * Neomake

  " Remaining is Experimental, often buggy
  " autocmd BufEnter,WinEnter * Neomake

  " Lint as you type
  " autocmd TextChanged,InsertLeave * silent update | Neomake
  " More agressive lint as you type
  " autocmd InsertChange,TextChanged,InsertLeave * silent update | Neomake
augroup END
