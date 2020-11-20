" :FzfPreviewBuffers                            " Select file buffers. Used open-buffer processes.
" imap <C-l> <ESC>:FzfPreviewBuffers<CR>
" map  <C-l> <ESC>:FzfPreviewBuffers<CR>

imap <C-l> <ESC>:Buffers!<CR>
map  <C-l> <ESC>:Buffers!<CR>


" :FzfPreviewProjectFiles                       " Select project files
" imap <C-p> <ESC>:FzfPreviewGitFiles<CR>
" map  <C-p> <ESC>:FzfPreviewGitFiles<CR>
" imap <M-p> <ESC>:FzfPreviewProjectFiles<CR>
" map  <M-p> <ESC>:FzfPreviewProjectFiles<CR>

imap <C-p> <ESC>:GFiles!<CR>
map  <C-p> <ESC>:GFiles!<CR>
imap <M-p> <ESC>:GFiles?<CR>
map  <M-p> <ESC>:GFiles?<CR>

" nnoremap <silent> gs    :<C-u>FzfPreviewGitStatus<CR>
" nnoremap <silent> rg    :<C-u>FzfPreviewProjectGrep --resume<Space>

" let g:fzf_preview_use_dev_icons = 1

let g:fzf_tags_command = 'ctags --options=~/.ctags'
