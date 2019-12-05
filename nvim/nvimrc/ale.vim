let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 500
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_set_loclist = 1
" let g:ale_set_quickfix = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
" let g:ale_echo_cursor = 1
" let g:ale_echo_msg_format = '%s | %linter%'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_highlights = 1

" The way ale choose the venv is not compatible with my dev env.
" So I essentially disable it
let g:ale_virtualenv_dir_names = ['badvenv']

" https://github.com/w0rp/ale/issues/283
" let g:ale_use_ch_sendraw = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" \   'jsx': ['eslint'],
" \   'python': ['flake8'],

let g:ale_python_flake8_args = '--max-line-length=99'

let g:ale_fixers = {
            \    'python': ['black', 'isort', 'remove_trailing_lines', 'trim_whitespace'],
            \    'javascript': ['prettier_standard', 'remove_trailing_lines', 'trim_whitespace'],
            \    'jsx': ['prettier_standard', 'remove_trailing_lines', 'trim_whitespace'],
            \    'css': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
            \    'vim': ['remove_trailing_lines', 'trim_whitespace'],
            \}

" Run fixers with F5
map <F5> :ALEFix<CR>
