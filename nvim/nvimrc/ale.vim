" let g:ale_linters = {
" \   'java': ['eslint'],
" \}

let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_format = '%s | %linter%'

let g:ale_linters = {
\   'javascript': ['eslint'],
\}
