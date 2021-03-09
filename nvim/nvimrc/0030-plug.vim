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
Plug 'junegunn/goyo.vim'

" Python
Plug 'psf/black'
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }


" FZF setup
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/bling/vim-airline.git'

" Iconogrophy
Plug 'junegunn/vim-emoji'
Plug 'ryanoasis/vim-devicons'


" Nerd comments and tree explorer
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'


" Unixy commands for vim
Plug 'https://github.com/tpope/vim-eunuch.git'

" Plug 'https://github.com/will133/vim-dirdiff.git'

" Big language pack!
Plug 'sheerun/vim-polyglot'

" 
" " One day, I shall resurrect this trap
" Plug 'jeffbuttars/neovim-doubletap', { 'do': ':UpdateRemotePlugins' }

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
" Plug 'nvim-treesitter/completion-treesitter', {'do': ':TSInstall query'}

" Plug 'andymass/vim-matchup'

Plug 'ryanoasis/vim-webdevicons'

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


Plug 'PratikBhusal/vim-grip'

" " Git
"
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'rbong/vim-flog'


Plug 'ajorgensen/vim-markdown-toc'


" Load Ultisnips later to make sure it has the <tab> map
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Color Schemes
" Solarized has been good to me. I plan to keep it a while
Plug 'iCyMind/NeoSolarized'
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
