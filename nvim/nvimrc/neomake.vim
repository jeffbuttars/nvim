" " load local eslint in the project root
" " modified from https://github.com/mtscout6/syntastic-local-eslint.vim
" 
" " let g:neomake_javascript_enabled_makers = ['eslint', 'jscs']
" let g:neomake_jsx_enabled_makers = ['eslint', 'jscs', 'flow']
" " let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
" " let g:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
" 
" " let g:neomake_jsx_eslint_exe =g:neomake_javascript_eslint_exe
" " let g:neomake_jsx_enabled_makers =g:neomake_javascript_enabled_makers
" " let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint')
" 
" " let g:neomake_python_enabled_makers = ['prospector', 'flake8', 'pylint']
" "
" let g:neomake_python_enabled_makers = ['flake8']
" let g:neomake_verbose = 0
" let g:neomake_echo_current_error = 1
" let g:neomake_airline = 1
" let g:neomake_serialize = 1
" let g:neomake_serialize_abort_on_error = 1
" 
" let g:neomake_python_flake8_args = ["--max-line-length=99"]
" " let g:neomake_error_sign='✗'
" " let g:neomake_warning_sign='⚠'
" 
" " *g:neomake_open_list*
" " This setting will open the |loclist| or |quickfix| list (depending on whether
" " it is operating on a file) when adding entries. A value of 2 will preserve the
" " cursor position when the |loclist| or |quickfix| window is opened. Defaults to 0.
" let g:neomake_open_list = 0
" 
" " Full config: when writing or reading a buffer, and on changes in insert and
" " normal mode (after 1s; no delay when writing).
" " call neomake#configure#automake('nrwi', 1000)
" 
" " When writing a buffer (no delay), and on normal mode changes (after 750ms).
" " call neomake#configure#automake('nw', 750)
"  call neomake#configure#automake({
"   \ 'TextChanged': {},
"   \ 'InsertLeave': {'delay': 0},
"   \ 'BufWritePost': {'delay': 0},
"   \ 'BufWinEnter': {},
"   \ }, 500)
