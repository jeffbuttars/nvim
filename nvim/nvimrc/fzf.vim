
imap <C-l> <ESC>:Buffers<CR>
map  <C-l> <ESC>:Buffers<CR>
imap <C-p> <ESC>:Files<CR>
map  <C-p> <ESC>:Files<CR>
" imap <C-g> <ESC>:GitFiles<CR>
" map  <C-g> <ESC>:GitFiles<CR>

" Mapping selecting mappings
" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
" inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
