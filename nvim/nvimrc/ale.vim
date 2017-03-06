let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_delay = 500
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_format = '%s | %linter%'

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'jsx': ['eslint'],
\}
" \   'python': ['flake8'],

" let g:ale_python_pylint_options = '--rcfile ~/.config/pylintrc'
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_args = '--max-line-length=99'
