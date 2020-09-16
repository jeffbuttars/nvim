" :FzfPreviewBuffers                            " Select file buffers. Used open-buffer processes.
imap <C-l> <ESC>:FzfPreviewBuffers<CR>
map  <C-l> <ESC>:FzfPreviewBuffers<CR>


" :FzfPreviewProjectFiles                       " Select project files
imap <C-p> <ESC>:FzfPreviewGitFiles<CR>
map  <C-p> <ESC>:FzfPreviewGitFiles<CR>
imap <M-p> <ESC>:FzfPreviewProjectFiles<CR>
map  <M-p> <ESC>:FzfPreviewProjectFiles<CR>

nnoremap <silent> gs    :<C-u>FzfPreviewGitStatus<CR>
nnoremap <silent> rg    :<C-u>FzfPreviewProjectGrep --resume<Space>

let g:fzf_preview_use_dev_icons = 1
