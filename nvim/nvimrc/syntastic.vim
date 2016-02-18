
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
" let g:syntastic_loc_list_height=10
let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1
" let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_python_checkers=['prospector', 'flake8', 'pylint']
" let g:syntastic_quiet_messages = {'level': 'warnings'}
" let g:syntastic_python_<checker>_quiet_messages = {'level': 'warnings'}
let g:syntastic_python_flake8_args="--max-line-length=99"
" let g:syntastic_python_checkers_args=['flake8']
"
" let g:syntastic_javascript_checkers=['jshint', 'standard', 'jslint' ]
let g:syntastic_javascript_checkers = ['eslint', 'standard']

"
let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': ['c', 'python', 'ruby', 'php', 'javascript', 'java', 'jsx'],
                               \ 'passive_filetypes': [''] }
