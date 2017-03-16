imap <C-l> <ESC>:Buffers<CR>

map  <C-l> <ESC>:Buffers<CR>
imap <C-p> <ESC>:Files<CR>
map  <C-p> <ESC>:Files<CR>
" imap <C-g> <ESC>:GitFiles<CR>
" map  <C-g> <ESC>:GitFiles<CR>

" [Files] Extra options for fzf
"         e.g. File preview using coderay (http://coderay.rubychan.de/)
" let g:fzf_files_options = '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'
let g:fzf_files_options = '--preview "(coderay {} || cat {}) 2> /dev/null"'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 0

" [[B]Commits] Customize the options used by 'git log':
" let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

let g:fzf_layout = { 'down': '~100%' }


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
" inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
" inoremap <expr> <c-x><c-l> fzf#vim#complete#line()
" inoremap <expr> <c-x><c-f> fzf#vim#complete#path({'left': '15%'})
"
" Use fuzzy completion relative filepaths across directory
imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

" command! -bang -nargs=* Ack call fzf#vim#ag(<q-args>, {'down': '40%', 'options': --no-color'})
