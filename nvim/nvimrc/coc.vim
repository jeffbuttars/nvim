
" :CocInstall 
" coc-ultisnips 
" coc-python
" coc-json
" coc-javascript
" coc-tslint
" coc-eslint
" coc-css
" coc-sources
" coc-neco
" coc-tsserver
" coc-git
" coc-yank
" coc-svg
" coc-vimlsp
" coc-xml
" coc-tabnine
" coc-highlight
" coc-java
" coc-neoinclude

set hidden


" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
