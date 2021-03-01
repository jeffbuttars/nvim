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
Plug 'junegunn/goyo.vim'
" 
Plug 'https://github.com/Shougo/vimproc.vim', { 'do': 'make' }
Plug 'https://github.com/Shougo/unite.vim'
" 
" " Python
Plug 'psf/black'


" FZF setup
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }

"
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/bling/vim-airline.git'
" Plug 'https://github.com/bling/vim-bufferline.git'

Plug 'junegunn/vim-emoji'
" Plug 'https://github.com/junegunn/rainbow_parentheses.vim'
" " Plug 'https://github.com/djdt/pyparens.nvim'
" 
Plug 'preservim/nerdcommenter'

Plug 'preservim/nerdtree'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'

Plug 'ryanoasis/vim-devicons'


Plug 'https://github.com/tpope/vim-eunuch.git'
Plug 'https://github.com/will133/vim-dirdiff.git'
Plug 'https://github.com/mhinz/vim-nginx'

Plug 'sheerun/vim-polyglot'

Plug 'metakirby5/codi.vim'

" 
" " One day, I shall resurrect this trap
" Plug 'jeffbuttars/neovim-doubletap', { 'do': ':UpdateRemotePlugins' }
" 
" Plug 'https://github.com/davidhalter/jedi-vim'
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

" COC
" Plug 'Shougo/neoinclude.vim'
" Plug 'jsfaint/coc-neoinclude'
" " Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release', 'do': { -> coc#util#install()}}
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Shougo/echodoc.vim'

" Native LSP
Plug 'neovim/nvim-lspconfig'
" Plug 'aca/pylance.nvim', { 'do': './install.sh' }

" Completion stuff
Plug 'nvim-lua/completion-nvim'
Plug 'aca/completion-tabnine', { 'do': './install.sh' }
Plug 'steelsojka/completion-buffers'

" Plug 'haorenW1025/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/completion-treesitter'
Plug 'nathunsmitty/nvim-ale-diagnostic'

Plug 'andymass/vim-matchup'

" Plug 'https://github.com/neomake/neomake.git'
Plug 'w0rp/ale'
" 
" " Keep builtin CSS completions up to date
" Plug 'othree/csscomplete.vim'
" 
Plug 'chrisbra/vim-diff-enhanced'
Plug 'ryanoasis/vim-webdevicons'

" Tags / Symbol navigator
Plug 'liuchengxu/vista.vim'
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
" Plug 'https://github.com/suan/vim-instant-markdown', { 'for': 'markdown' }
" ####### JUST USE grip !!! ###############
Plug 'PratikBhusal/vim-grip'

" " Solidity
" Plug 'tomlion/vim-solidity'

" " Git
"
Plug 'https://github.com/lambdalisue/gina.vim'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tpope/vim-rhubarb.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'rbong/vim-flog'

" " Autoclosers
" Plug 'jiangmiao/auto-pairs'
" 
" " Colorschemes
" "
" Solarized has been good to me. I plan to keep it a while
Plug 'iCyMind/NeoSolarized'
Plug 'altercation/vim-colors-solarized'
Plug 'JulioJu/neovim-qt-colors-solarized-truecolor-only'

Plug 'jacoborus/tender.vim'

" Plug 'https://github.com/MaxSt/FlatColor'
"
" Load Ultisnips last to make sure it has the <tab> map
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" VimWiki
"Plug 'vimwiki/vimwiki'

Plug 'ajorgensen/vim-markdown-toc'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'

call plug#end()
