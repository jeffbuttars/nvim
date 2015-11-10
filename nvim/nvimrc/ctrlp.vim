"
" #### Ctrl-P
" let g:ctrlp_map = '<c-l>'
imap <C-l> <ESC>:CtrlPBuffer<CR>
map  <C-l> <ESC>:CtrlPBuffer<CR>

let g:ctrlp_use_caching = 1
let g:ctrlp_max_height = 30
let g:ctrlp_clear_cache_on_exit = 1

" Ignore repos and virtualenvs
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|venv)$',
  \ 'file': '\v\.(pyc|pyo|so|dll)|tags$',
  \ }
" \ 'link': 'some_bad_symbolic_links',
"
"When starting up, CtrlP sets its local working directory according to this variable:
let g:ctrlp_working_path_mode ='ra'

" c - the directory of the current file.
" a - the directory of the current file, unless it is a subdirectory of the cwd
" r - the nearest ancestor of the current file that contains one of these directories or files: .git .hg .svn .bzr _darcs
" w - modifier to "r": start search from the cwd instead of the current file's directory
" 0 or <empty> - disable this feature.      
