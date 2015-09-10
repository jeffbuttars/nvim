" Syntastic can be used along with the "python-mode" Vim plugin (see
" https://github.com/klen/python-mode). However, they both run syntax checks by
" default when you save buffers to disk, and this is probably not what you want.
" To avoid both plugins opening error windows, you can either set passive mode
" for python in syntastic (see |'syntastic_mode_map'|), or disable lint checks in
" "python-mode", by setting |pymode_lint_write| to 0. E.g.: >
let g:pymode_lint_write = 0

" Trim unused white spaces on save                   *'g:pymode_trim_whitespaces'*
let g:pymode_trim_whitespaces = 1

" Setup max line length                       *'g:pymode_options_max_line_length'*
let g:pymode_options_max_line_length = 99

" Enable colorcolumn display at max_line_length   *'g:pymode_options_colorcolumn'*
let g:pymode_options_colorcolumn = 0

" Setup pymode |quickfix| window
" *'g:pymode_quickfix_maxheight'* *'g:pymode_quickfix_minheight'*
" let g:pymode_quickfix_minheight = 3
" let g:pymode_quickfix_maxheight = 6
"
let g:pymode_folding = 0
let g:pymode_doc = 1

let g:pymode_rope = 0
let g:pymode_rope_completion = 0

" Probably redundant
let g:pymode_rope_lookup_project = 0
