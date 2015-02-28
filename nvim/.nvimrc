if has('nvim')
    runtime! plugin/python_setup.vim
endif

" Load our bundles early
" runtime nvimrc/nerdcomment.vim
" runtime nvimrc/bundles.vim


set lazyredraw      " Don't redraw screen when executing macros
set history=1000 " keep 1000 lines of command line history

" Set our encoding to UTF-8
set encoding=utf-8

set switchbuf=useopen
set laststatus=2          " last window will always have a status line
set showcmd		         " display incomplete commands

" Enable persistent undo
" and tell vim were to store the undo files. 
set undofile
set undodir=~/.nvim/undos
set undolevels=1000
set undoreload=10000

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch on highlighting of the last used search pattern.
if &t_Co > 2
	set hlsearch
endif

" We'll take for granted that we are connected to a fast terminal most of the time
set ttyfast
set laststatus=2 " keep the status line showing
set incsearch    " Enable incremental searching

" ## Autocommands
"
filetype plugin indent on
syntax on

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" For all text files set 'textwidth' to 98 characters.
" XXX Move this to the theme.vim file when we add it.
autocmd FileType text,txt setlocal textwidth=98

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

augroup END


set fileformats=unix,dos,mac " try recognizing line endings in this order


" allow vim commands to copy to system clipboard (*)
" for X11:
"   + is the clipboard register (Ctrl-{c,v})
"   * is the selection register (middle click, Shift-Insert)
set clipboard=unnamed

" use clipboard register when supported (X11 only)
if has("unnamedplus")
    set clipboard+=unnamedplus
endif

" I like to have my files automatically reloaded if they change on disk
set autoread

" XXX Move this to the theme.vim file when we add it.
" More normal Vim tweaks.
" vertical: make a diff split vertical by default
" iwhite: ignore whitespace
" context: show 15 lines of context
set diffopt=filler,vertical,context:15
let g:html_diff_one_file = 1

" Default tab config, use spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=100 " Too narrow for my tastes, but satisfies most standards.
set smarttab
set shiftround	" use multiple of shiftwidth when indenting with '<' and '>'
set expandtab

" Show matching braces
set showmatch 
" Quick blink when a match is made
set mat=5

set noswapfile
set nobackup " do not keep a backup file, use persistent versions instead

" C opts
" Kernel style
"set cinoptions=:0,(0,u0,W1s
" I use  the default, you should
" check out the help for cinoptions and
" tune it to  match your prefered style.
" :h cinoptions
set cinoptions+=J

" Keep this many lines above/below the cursor while scrolling.
set scrolloff=3

" The title of the window to titlestring
" see :h title for better info.
set title

" Conservative fold settings, I don't use folds often
set foldmethod=manual
set nofoldenable
set foldcolumn=1

" Big nasty viminfo setup. If you you have a smaller/slower system use the
" commented viminfo below, it's tuned down.
" track up to 20,000 files.
" store global marks.
" no more than 500 lines per register are saved
" 1000 lines of history
" save the buffer list
set viminfo='20000,f1,<500,:1000,@1000,/1000,%


" HTML output options
" Use more modern css
let html_use_css = 1

" wrap long lines
set wrap
set sidescroll=3


" Some wordwrapp foo from
" [kmandla](http://kmandla.wordpress.com/2009/07/27/proper-word-wrapping-in-vim/)
set formatoptions+=l
set lbr

set selection=inclusive
set shortmess=atI
set wildmenu
set wildmode=list:longest
set wildignore=*.swp,*.bak,*.pyc,*.pyo,*.class,*.6,.git,.hg,.svn,*.o,*.a,*.so,*.obj,*.lib

" If a letters are lower case in a pattern, ignore case.
" Otherwise be case sensitive.
set ignorecase
set smartcase

" set key timeout, good for remaps
set timeoutlen=300

" autowrite: "on" saves a lot of trouble
" set autowrite
" be aggressive/paranoid and save often automatically.
set autowriteall
set	autoread
set mousemodel=popup " Make right mouse button work in gvim
set hidden " Don't acutally close buffers, just hide them.

" dictionary: english words first
" add any text based dictionaries to the list.
" Also, you can use C-X,C-K to autocomplete a word
" using the dictionary. Or, use C-X,C-S to check spelling
" on a word, fun stuff.
set dictionary+=/usr/share/dict/words,/usr/dict/words,/usr/dict/extra.words,/usr/share/dict/cracklib-small

" [Improved_Hex_editing](http://vim.wikia.com/wiki/Improved_Hex_editing)
" ex command for toggling hex mode - define mapping if desired
command! -bar Hexmode call ToggleHex()

" I don't want variables and options saved in my views
" so remove the 'options' option from the default viewoptions setting.
" set viewoptions-=options
set viewoptions=cursor
set sessionoptions=winpos,localoptions

" Make sure I get the expected behavior from ctrl-]
" if cscopetag is set, ctrl-] will try to be too smart
set nocscopetag
set tags=tags,./tags;/

" Source the rest of the config, which is broken out into many files
runtime! nvimrc/*.vim
