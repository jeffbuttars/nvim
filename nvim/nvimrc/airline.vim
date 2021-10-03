let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 1
" let g:airline_theme='solarized'
" let g:airline_theme='tender'
let g:airline_custom_theme_colors = 1



" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''

let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''

if $TERM_META =~ 'dark'
    set background=dark
    " let g:airline_theme='solarized_flood'
else
    set background=light
    " let g:airline_theme='solarized'
endif
