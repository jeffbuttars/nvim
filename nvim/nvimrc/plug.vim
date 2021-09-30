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

" Lua utils / lib
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

" For writing prose
Plug 'junegunn/goyo.vim'

" Python
Plug 'psf/black'
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }


" FZF setup
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Telescope
Plug 'nvim-telescope/telescope.nvim'

Plug 'tami5/sqlite.lua'
Plug 'nvim-telescope/telescope-frecency.nvim'

Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/vim-airline/vim-airline.git'

" Iconogrophy
Plug 'junegunn/vim-emoji'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mortepau/codicons.nvim'

" Nerd comments and tree explorer
Plug 'preservim/nerdcommenter'
" Plug 'preservim/nerdtree'
" Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
" Plug 'vwxyutarooo/nerdtree-devicons-syntax'


" Vim Tree
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'folke/lsp-trouble.nvim'

" Unixy commands for vim
Plug 'https://github.com/tpope/vim-eunuch.git'

" Plug 'https://github.com/will133/vim-dirdiff.git'

Plug 'sindrets/diffview.nvim'

" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" https://github.com/axelf4/vim-strip-trailing-whitespace
Plug 'axelf4/vim-strip-trailing-whitespace'

" 
" " One day, I shall resurrect this trap
" Plug 'jeffbuttars/neovim-doubletap', { 'do': ':UpdateRemotePlugins' }
" Plug 'cohama/lexima.vim'


" LSP and Completion stuff

" Default LSP configs
Plug 'neovim/nvim-lspconfig'

" ### hrsh7th/nvim-compe Another completion manager
Plug 'hrsh7th/nvim-compe'
Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }
Plug 'tamago324/compe-zsh'
Plug 'Shougo/deol.nvim'
Plug 'onsails/lspkind-nvim'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
" Plug 'nvim-treesitter/completion-treesitter'
" Plug 'andymass/vim-matchup'

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

" Markdown stuff
Plug 'PratikBhusal/vim-grip'
Plug 'ajorgensen/vim-markdown-toc'

" " Git
"
Plug 'https://github.com/tpope/vim-fugitive.git'
" Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'lewis6991/gitsigns.nvim'
Plug 'rbong/vim-flog'


" https://github.com/lifepillar/vim-solarized8
" Plug 'lifepillar/vim-solarized8'

" Treesitter compatible solarized
Plug 'ishan9299/nvim-solarized-lua'

" Plug 'altercation/vim-colors-solarized'
" Plug 'JulioJu/neovim-qt-colors-solarized-truecolor-only'
Plug 'folke/lsp-colors.nvim'

" Load Ultisnips later to make sure it has the <tab> map
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Color Schemes
" Solarized has been good to me. I plan to keep it a while
" Plug 'iCyMind/NeoSolarized'
Plug 'ishan9299/nvim-solarized-lua'
Plug 'mhartington/oceanic-next'
Plug 'PHSix/nvim-hybrid'
Plug 'RRethy/nvim-base16'

" Treesitter compatible
Plug 'christianchiarulli/nvcode-color-schemes.vim'

" Plug 'morhetz/gruvbox'
" 
" " https://github.com/lifepillar/vim-gruvbox8
" Plug 'lifepillar/vim-gruvbox8'
" 
" " https://github.com/lifepillar/vim-solarized8
" " Plug 'lifepillar/vim-solarized8'

call plug#end()
