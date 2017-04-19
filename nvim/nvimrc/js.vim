
" vim-javascript

let g:javascript_plugin_jsdoc = 1
" let g:javascript_plugin_ngdoc = 1
set conceallevel=1

if executable('prettier-standard')
    " prettier-standard
    autocmd FileType javascript,jsx,javascript.jsx set formatprg=prettier-standard
endif
