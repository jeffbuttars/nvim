" " #### NERDCommenter 
" "
" let b:leader = exists('g:mapleader') ? g:mapleader : '\'
" " I like to use CTRL-C to toggle comments 
" exec 'noremap <C-C> :call NERDComment("n", "AlignLeft")<cr>'
" exec 'noremap <C-N> :call NERDComment("n", "Uncomment")<cr>'
" 
" " I like space around comments
" let g:NERDSpaceDelims = 1
" 
" " Custom comment delimiters for NERDCommenter 
" let g:NERDCustomDelimiters = {
"     \ 'ecl': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
"     \ 'javascript.jsx': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
" \ }
