
" Save file and Run fixers with F5
map <F5> :w<CR>:StripTrailingWhitespace<CR>:Black<CR>:Isort<CR>
let b:ale_fixers = ['isort', 'autoimport', 'remove_trailing_lines', 'trim_whitespace', 'add_blank_lines_for_python_control_statements', 'black']
