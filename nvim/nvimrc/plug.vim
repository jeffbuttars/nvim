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
" Plug 'junegunn/goyo.vim'

" Python
Plug 'psf/black'
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }


" FZF setup
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Telescope
Plug 'nvim-telescope/telescope.nvim'

" Plug 'tami5/sqlite.lua'
" Plug 'nvim-telescope/telescope-frecency.nvim'

" Plug 'https://github.com/vim-airline/vim-airline-themes'
" Plug 'https://github.com/vim-airline/vim-airline.git'

" Iconogrophy
Plug 'junegunn/vim-emoji'
" Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mortepau/codicons.nvim'

" Status lines
" Plug 'https://github.com/vim-airline/vim-airline-themes'
" Plug 'https://github.com/vim-airline/vim-airline.git'

Plug 'famiu/feline.nvim'
Plug 'hoob3rt/lualine.nvim'
" If you want to have icons in your statusline choose one of these
" *  'kyazdani42/nvim-web-devicons'
" *  'ryanoasis/vim-devicons'


" Nerd comments
Plug 'preservim/nerdcommenter'

" Vim Tree
" Install 'kyazdani42/nvim-web-devicons' for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Plug 'folke/lsp-trouble.nvim'

" Unixy commands for vim
Plug 'https://github.com/tpope/vim-eunuch.git'

" Plug 'https://github.com/will133/vim-dirdiff.git'

Plug 'sindrets/diffview.nvim'

" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" htplugrip-trailing-whitespace
Plug 'axelf4/vim-strip-trailing-whitespace'

" 
" " One day, I shall resurrect this trap
" Plug 'jeffbuttars/neovim-doubletap', { 'do': ':UpdateRemotePlugins' }

" LSP and Completion stuff

" Default LSP configs
Plug 'neovim/nvim-lspconfig'

" ### hrsh7th/nvim-cmp Another completion manager
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'quangnguyen30192/cmp-nvim-tags'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'ray-x/cmp-treesitter'
Plug 'hrsh7th/cmp-calc'
Plug 'f3fora/cmp-spell'
" Plug 'f3fora/cmp-nuspell'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-look'
Plug 'hrsh7th/nvim-cmp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
" Plug 'tamago324/cmp-zsh'
Plug 'Shougo/deol.nvim'
Plug 'onsails/lspkind-nvim'

" Plug 'nvim-lua/popup.nvim'

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
Plug 'lewis6991/gitsigns.nvim'
Plug 'rbong/vim-flog'


" https://github.com/lifepillar/vim-solarized8
" Plug 'lifepillar/vim-solarized8'

" Treesitter compatible solarized
" https://github.com/ishan9299/nvim-solarized-lua
Plug 'ishan9299/nvim-solarized-lua'

Plug 'folke/lsp-colors.nvim'

" Load Ultisnips later to make sure it has the <tab> map
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Color Schemes
" Solarized has been good to me. I plan to keep it a while
Plug 'ishan9299/nvim-solarized-lua'

call plug#end()
