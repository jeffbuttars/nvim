" Save file, Run fixers and reload the file with F5
map <F5> :w<CR>:StripTrailingWhitespace<CR>:Isort<CR>:Black<CR>:e %<CR><CR>

" map <F5> :w<CR>:StripTrailingWhitespace<CR>:Isort<CR>:Black<CR>
" let b:ale_fixers = ['isort', 'autoimport', 'remove_trailing_lines', 'trim_whitespace', 'add_blank_lines_for_python_control_statements', 'black']
