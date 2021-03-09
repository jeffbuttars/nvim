" #### NERDCommenter 
"
let b:leader = exists('g:mapleader') ? g:mapleader : '\'
" I like to use CTRL-C to toggle comments 
exec 'noremap <C-C> :call NERDComment("n", "AlignLeft")<cr>'
exec 'noremap <C-N> :call NERDComment("n", "Uncomment")<cr>'

" I like space around comments
let g:NERDSpaceDelims = 1

" Custom comment delimiters for NERDCommenter 
let g:NERDCustomDelimiters = {
    \ 'ecl': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
    \ 'javascript.jsx': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\ }

" ### NERD Tree ###

" map <C-d> :NERDTreeToggle<CR>
map <C-d> :NERDTreeFind<CR>
let NERDTreeWinSize = 64
let NERDTreeQuitOnOpen = 1
let NERDTreeHijackNetrw = 1
let NERDTreeShowLineNumbers=1

autocmd StdinReadPre * let s:std_in=1

" How can I open a NERDTree automatically when vim starts up if no files were specified?
" Stick this in your vimrc:
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"How can I open NERDTree automatically when vim starts up on opening a directory?
" autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | exe 'NERDTreeFocus' | endif


" git integration, a separate pkg
" There is a predefined map used nerdfonts, to enable it
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
