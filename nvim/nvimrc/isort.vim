let g:vim_isort_python_version = 'python3'

command! -range=% Isort :<line1>,<line2>! isort -

" autocmd BufWrite *.py Isort
