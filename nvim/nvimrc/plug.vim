"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ## Plugs
"
" We deal with our plugs first thing because later sections
" rely on them being available.
"
" #### [Pathogen](https://github.com/tpope/vim-pathogen)
" [Pathogen](https://github.com/tpope/vim-pathogen) is a
" nice package format for Vim _'packages'_.  
" [Vim Plug](https://github.com/junegunn/vim-plug)
" is our current package manager for Pathogen bundles.
"
"
" # Vim Plug initialization

" More or less 'borrowed' straight from the repo readme.

call plug#begin('~/.config/nvim/plugged')
" 
" " function! DoRemote()
" "   UpdateRemotePlugins
" " endfunction
" 
" " Place your Plugs here!
" 
Plug 'https://github.com/Shougo/vimproc.vim', { 'do': 'make' }
Plug 'https://github.com/Shougo/unite.vim'
" 
" " Python
" Plug 'https://github.com/klen/python-mode.git', { 'for': 'python' }
" Plug 'fisadev/vim-isort', { 'for': 'python' }
" Plug 'ambv/black'
" Plug 'sbdchd/neoformat'
" 
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/bling/vim-airline.git'
" Plug 'https://github.com/bling/vim-bufferline.git'

" Plug 'https://github.com/junegunn/rainbow_parentheses.vim'
" " Plug 'https://github.com/djdt/pyparens.nvim'
" 
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/tpope/vim-eunuch.git'
Plug 'https://github.com/will133/vim-dirdiff.git'
" Plug 'https://github.com/Raimondi/delimitMate'
Plug 'https://github.com/mhinz/vim-nginx'
" 
" " One day, I shall resurrect this trap
" " Plug 'jeffbuttars/neovim-doubletap', { 'do': function('DoRemote') }
" 
" " Plug 'https://github.com/davidhalter/jedi-vim'
" Plug 'zchee/deoplete-jedi'
" 
" 
" " Java gets it's own completion plugin, but only on those days I actually need it.
" " Plug 'artur-shaik/vim-javacomplete2', { 'for': ['java']}
" 
" " REQUIRED: Add a syntax file. YATS is the best
" " Plug 'HerringtonDarkholme/yats.vim'
" " Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" 
" " For Denite features
" " Plug 'Shougo/denite.nvim'
" 
" " Ctags stuff, never seems to work right
" " Plug 'c0r73x/neotags.nvim', {'do': 'make'}
" " Plug 'jsfaint/gen_tags.vim'
" 
" " Deoplete setup
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'wokalski/autocomplete-flow'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }


"NCM2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-tagprefix'
Plug 'filipekiss/ncm2-look.vim'
" Plug 'ncm2/ncm2-gtags'
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
" Plug 'mhartington/nvim-typescript'
Plug 'ncm2/ncm2-jedi'
" Plug 'ncm2/ncm2-racer'
Plug 'ncm2/ncm2-clang'
Plug 'ncm2/ncm2-pyclang'
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
Plug 'ncm2/ncm2-go'
Plug 'phpactor/ncm2-phpactor'
Plug 'ObserverOfTime/ncm2-jc2', {'for': ['java', 'jsp']}
Plug 'artur-shaik/vim-javacomplete2', {'for': ['java', 'jsp']}
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-rst-subscope'
" Plug 'ncm2/ncm2-match-highlight'  " Kinda weird
" 
" Plug 'https://github.com/neomake/neomake.git'
Plug 'w0rp/ale'
" 
" " Keep builtin CSS completions up to date
" Plug 'othree/csscomplete.vim'
" 
Plug 'chrisbra/vim-diff-enhanced'
Plug 'ryanoasis/vim-webdevicons'
" 
" " JSON syntax
Plug 'https://github.com/elzr/vim-json.git'
" 
" " JS syntax
" Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
" 
" " Pub/Jade syntax
" Plug 'digitaltoad/vim-pug'
" 
" " post install (yarn install | npm install) then load plugin only for editing supported files
" Plug 'mitermayer/vim-prettier', {
" 	\ 'do': 'yarn install; npm i -g prettier',
" 	\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }
" 
" Plug 'https://github.com/plasticboy/vim-markdown.git'
" Plug 'https://github.com/suan/vim-instant-markdown.git', { 'do': 'echo Run: npm install -g instant-markdown-d' }
" 
" " Solidity
" Plug 'tomlion/vim-solidity'
" 
" " Git
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
" Plug 'RRethy/vim-illuminate'
" 
" " Autoclosers
Plug 'jiangmiao/auto-pairs'
" 
" " Colorschemes
" "
" Solarized has been good to me. I plan to keep it a while
Plug 'iCyMind/NeoSolarized'
Plug 'altercation/vim-colors-solarized'
Plug 'JulioJu/neovim-qt-colors-solarized-truecolor-only'

" Plug 'https://github.com/MaxSt/FlatColor'
"
" Load Ultisnips last to make sure it has the <tab> map
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()
