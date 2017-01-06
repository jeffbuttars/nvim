" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_profile = 1
let g:deoplete#max_menu_width = 15

let g:tern_request_timeout = 1
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" call deoplete#custom#set('javascript', 'min_pattern_length', 1)
" call deoplete#custom#set('jsx', 'min_pattern_length', 1)

let g:deoplete#sources#jedi#show_docstring = 1

" let g:deoplete#sources#ternjs#min_pattern_length = 1
" let g:deoplete#omni#min_pattern_length = 1
" let g:deoplete#sources#ternjs#tern_bin = get(g:, 'deoplete#sources#ternjs#tern_bin', 'tern') 

" Time is ms
let g:deoplete#auto_complete_delay = 100

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" https://gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/

" omnifuncs
augroup MyOmnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

" set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript'] = ['file', 'ternjs', 'ultisnips', 'buffer', ]
let g:deoplete#sources['jsx'] = ['file', 'ternjs', 'ultisnips', 'buffer', ]
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" autocmd FileType python setlocal omnifunc=jedi#completions
"
" tern
" if exists('g:plugs["tern_for_vim"]')
"   let g:tern_show_argument_hints = 'on_hold'
"   let g:tern_show_signature_in_pum = 1
"   autocmd FileType javascript setlocal omnifunc=tern#Complete
" endif

" deoplete tab-complete
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<tab>"

" tern
autocmd FileType javascript,jsx nnoremap <silent> <buffer> gb :TernDef<CR>

autocmd FileType java setlocal omnifunc=javacomplete#Complete

