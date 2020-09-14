" :FzfPreviewBuffers                            " Select file buffers. Used open-buffer processes.
imap <C-l> <ESC>:FzfPreviewBuffers<CR>
map  <C-l> <ESC>:FzfPreviewBuffers<CR>

" :FzfPreviewProjectFiles                       " Select project files
imap <C-p> <ESC>:FzfPreviewProjectFiles<CR>
map  <C-p> <ESC>:FzfPreviewProjectFiles<CR>

nnoremap <silent> gs    :<C-u>FzfPreviewGitStatus<CR>

let g:fzf_preview_use_dev_icons = 1
