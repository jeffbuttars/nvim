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

" Place your Plugs here!

" For writing prose
" Plug 'junegunn/goyo.vim'

" Plug 'https://github.com/Shougo/vimproc.vim', { 'do': 'make' }
" Plug 'https://github.com/Shougo/unite.vim'

" Python
" Plug 'psf/black'
" Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }


" FZF setup
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'


" Plug 'https://github.com/vim-airline/vim-airline-themes'
" Plug 'https://github.com/bling/vim-airline.git'

" Iconogrophy
" Plug 'junegunn/vim-emoji'
" Plug 'ryanoasis/vim-devicons'


" Nerd comments and tree explorer
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'


" Plug 'https://github.com/tpope/vim-eunuch.git'
" Plug 'https://github.com/will133/vim-dirdiff.git'

" Big language pack!
" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

" 
" " One day, I shall resurrect this trap
" Plug 'jeffbuttars/neovim-doubletap', { 'do': ':UpdateRemotePlugins' }
" 
" Plug 'https://github.com/davidhalter/jedi-vim'


" Native LSP
" Plug 'neovim/nvim-lspconfig'
" Plug 'aca/pylance.nvim', { 'do': './install.sh' }

" " Completion stuff
" Plug 'nvim-lua/completion-nvim'
" Plug 'aca/completion-tabnine', { 'do': './install.sh' }
" Plug 'steelsojka/completion-buffers'
" 
" " Plug 'haorenW1025/completion-nvim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/playground'
" Plug 'nvim-treesitter/completion-treesitter', {'do': ':TSInstall query'}

" Plug 'andymass/vim-matchup'

" " Keep builtin CSS completions up to date
" Plug 'othree/csscomplete.vim'

" Plug 'chrisbra/vim-diff-enhanced'
" Plug 'ryanoasis/vim-webdevicons'

" Tags / Symbol navigator
" Plug 'liuchengxu/vista.vim'

" " JSON syntax
"Plug 'https://github.com/elzr/vim-json.git'

" " JS syntax
" Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
" 
" 
" " post install (yarn install | npm install) then load plugin only for editing supported files
" Plug 'mitermayer/vim-prettier', {
" 	\ 'do': 'yarn install; npm i -g prettier',
" 	\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }
" 
" ####### JUST USE grip !!! ###############
" Plug 'PratikBhusal/vim-grip'

" " Git
"
" Plug 'https://github.com/lambdalisue/gina.vim'
" Plug 'https://github.com/tpope/vim-fugitive.git'
" Plug 'https://github.com/tpope/vim-rhubarb.git'
" Plug 'https://github.com/airblade/vim-gitgutter.git'
" Plug 'rbong/vim-flog'


Plug 'ajorgensen/vim-markdown-toc'


" Load Ultisnips later to make sure it has the <tab> map
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Color Schemes
" Solarized has been good to me. I plan to keep it a while
" Plug 'iCyMind/NeoSolarized'
"
" Plug 'morhetz/gruvbox'
" 
" " https://github.com/lifepillar/vim-gruvbox8
" Plug 'lifepillar/vim-gruvbox8'
" 
" " https://github.com/lifepillar/vim-solarized8
" " Plug 'lifepillar/vim-solarized8'
" 
" " Plug 'altercation/vim-colors-solarized'
" Plug 'JulioJu/neovim-qt-colors-solarized-truecolor-only'
" 
" Plug 'jacoborus/tender.vim'

" " treesitter aware
" Plug 'sainnhe/sonokai'

call plug#end()
