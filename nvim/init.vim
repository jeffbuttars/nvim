" Uncomment to enable debug to a file
" let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
" let $NVIM_NCM_LOG_LEVEL="DEBUG"
" let $NVIM_NCM_MULTI_THREAD=0

" enable early
" https://neovim.io/doc/user/filetype.html
" Turn on filetype based plugin loading as well as filetype specific indent
filetype plugin indent on
" 
" " Explicitly set the python3 executable
" let g:python3_host_prog = '/usr/bin/python3'
" 
" " " Need to load the nerdcommenter settings before the plugin
" " runtime nvimrc/nerdcomment.vim
" 
" " " Load our 'plugs' early
" runtime nvimrc/plug.vim
" 
" " set lazyredraw      " Don't redraw screen when executing macros
set history=10000 " keep 10000 lines of command line history

" 
" " Set our encoding to UTF-8
" " set encoding=utf-8
" 
" " set switchbuf=useopen
set switchbuf=split

" " set laststatus=2          " last window will always have a status line

" Enable persistent undo
" and tell vim were to store the undo files. 
set undofile
set undodir=~/.config/nvim/undos
set undolevels=1000
set undoreload=10000

" " In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" ## Autocommands
" If you don't want to turn 'hlsearch' on, but want to highlight all                                                              │~
"         matches while searching, you can turn on and off 'hlsearch' with                                                                │~
"         autocmd.
" augroup vimrc-incsearch-highlight
"   autocmd!
"   autocmd CmdlineEnter /,\? :set hlsearch
"   autocmd CmdlineLeave /,\? :set nohlsearch
" augroup END


" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

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


" set fileformats=unix,dos,mac " try recognizing line endings in this order


" If you want to ALWAYS use the clipboard for ALL operations (as opposed
" to interacting with the '+' and/or '*' registers explicitly), set the
" following option:
set clipboard+=unnamed
set clipboard+=unnamedplus


" I like to have my files automatically reloaded if they change on disk
set autoread

" Default tab config, use spaces instead of real tabs.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=100
set smarttab
set shiftround	" use multiple of shiftwidth when indenting with '<' and '>'
set expandtab

" Don't create a swapfile for each buffer
set noswapfile

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
" set foldmethod=manual
" set nofoldenable
" set foldcolumn=1

" Treesitter folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

" " Big nasty viminfo setup. If you you have a smaller/slower system use the
" " commented viminfo below, it's tuned down.
" " track up to 20,000 files.
" " store global marks.
" " no more than 500 lines per register are saved
" " 1000 lines of history
" " save the buffer list
" set viminfo='20000,f1,<500,:1000,@1000,/1000,%
" Use Shada now for Neovim
" set shada='sfuff, see help'

" " Some wordwrapp foo from
" " [kmandla](http://kmandla.wordpress.com/2009/07/27/proper-word-wrapping-in-vim/)
" set formatoptions+=l
" set lbr
 
set shortmess=atI
set wildmode=list:longest
set wildignore=*.swp,*.bak,*.pyc,*.pyo,*.class,*.6,.git,.hg,.svn,*.o,*.a,*.so,*.obj,*.lib

" If first letter is lower case in a pattern, ignore case.
" Otherwise be case sensitive.
set ignorecase
set smartcase

" " set key timeout, good for remaps
" " set timeoutlen=300

" autowrite: "on" saves a lot of trouble
" be aggressive/paranoid and save often automatically.
set autowriteall
set autoread
set mousemodel=popup " Make right mouse button work in gvim
" set hidden " Don't acutally close buffers, just hide them.

" dictionary: english words first
" add any text based dictionaries to the list.
" Also, you can use C-X,C-K to autocomplete a word
" using the dictionary. Or, use C-X,C-S to check spelling
" on a word, fun stuff.
" set dictionary+=/usr/share/dict/words,/usr/dict/words,/usr/dict/extra.words,/usr/share/dict/cracklib-small

" [Improved_Hex_editing](http://vim.wikia.com/wiki/Improved_Hex_editing)
" ex command for toggling hex mode - define mapping if desired
command! -bar Hexmode call ToggleHex()

" " I don't want variables and options saved in my views
" " so remove the 'options' option from the default viewoptions setting.
" " set viewoptions-=options
" " set viewoptions=cursor
" " set sessionoptions=winpos,localoptions
" 
" set guicursor=
" set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
"     \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
"     \,sm:block-blinkwait175-blinkoff150-blinkon175     
" 
" " Make sure I get the expected behavior from ctrl-]
" " if cscopetag is set, ctrl-] will try to be too smart
" set nocscopetag
" set tags=tags,./tags;/
" 
" set grepprg=grep\ -n\ -Ir\ --exclude-dir='.git'\ --exclude-dir='.hg'\ --exclude-dir='.svn'\ --exclude-dir='.venv'\ --exclude-dir='.cvs'\ --exclude='*.pyo'\ --exclude='*.pyc'\ --exclude='*~'\ --exclude=TAGS\ --exclude=tags\ $*\ /dev/null

set inccommand=nosplit
" Split vertical to the right by default
set splitright
" Split horizontal below by default
set splitbelow

" "====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" algorithm:{text} Use the specified diff algorithm with the
" internal diff engine. Currently supported
" algorithms are:
" myers      the default algorithm
" minimal    spend extra time to generate the
"         smallest possible diff
" patience   patience diff algorithm
" histogram  histogram diff algorithm
" context: show 15 lines of context
set diffopt=filler,vertical,context:15,algorithm:patience

" Source the rest of the config, which is broken out into many files
" runtime! nvimrc/*.vim
runtime nvimrc/0010-maps.vim
runtime nvimrc/0020-custom-configs.vim
" " Load our 'plugs' early
runtime nvimrc/0030-plug.vim
runtime nvimrc/0040-nerd.vim
runtime nvimrc/0050-theme.vim
runtime nvimrc/0055-airline.vim
runtime nvimrc/0060-fzf.vim
runtime nvimrc/0900-post-config.vim
