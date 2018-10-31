
" if executable('black')
"     augroup fmt
"         autocmd!
"         autocmd BufWritePre *.py undojoin | silent! Neoformat
"     augroup END
" endif
