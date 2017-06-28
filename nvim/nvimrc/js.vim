
" vim-javascript

let g:javascript_plugin_jsdoc = 1
" let g:javascript_plugin_ngdoc = 1
set conceallevel=1

if executable('prettier-standard')
    " prettier-standard
    autocmd FileType javascript,jsx,javascript.jsx,css,ts set formatprg=prettier-standard\ --print-width\ 100\ --single-quote\ --flow-parser
endif
