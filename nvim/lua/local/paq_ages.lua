-- https://github.com/savq/paq-nvim
-- More or less 'borrowed' straight from the repo readme.

-- Load Paq
vim.cmd 'packadd paq-nvim'         -- Load package
local paq = require'paq-nvim'.paq  -- Import module and bind `paq` function
paq{'savq/paq-nvim', opt=true}     -- Let Paq manage itself


-- For writing prose
paq 'junegunn/goyo.vim'

-- Python
paq 'psf/black'
paq {'stsewd/isort.nvim',  run=vim.fn['remote#host#UpdateRemotePlugins'] }


-- FZF setup
-- paq {'junegunn/fzf', run=vim.fn['fzf#install'] }
-- paq 'junegunn/fzf.vim'


-- Iconogrophy
paq 'junegunn/vim-emoji'
paq 'ryanoasis/vim-devicons'
paq 'kyazdani42/nvim-web-devicons' -- for file icons

-- Nerd comments and tree explorer
paq 'preservim/nerdcommenter'
-- paq 'https://github.com/Xuyuanp/nerdtree-git-plugin'
-- paq 'vwxyutarooo/nerdtree-devicons-syntax'

-- Vim Tree
paq 'kyazdani42/nvim-tree.lua'

-- Telescope
use {
  'nvim-telescope/telescope.nvim',
  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
}

-- Unixy commands for vim
paq 'https://github.com/tpope/vim-eunuch.git'

paq {'numirias/semshi', run=vim.fn['remote#host#UpdateRemotePlugins']}

paq 'axelf4/vim-strip-trailing-whitespace'

-- 
-- " One day, I shall resurrect this trap
-- paq {'jeffbuttars/neovim-doubletap', run=vim.fn['remote#host#UpdateRemotePlugins']}

-- Lua utils / lib
paq 'nvim-lua/plenary.nvim'

-- Native LSP
paq 'neovim/nvim-lspconfig'


-- LSP Completion stuff
--
paq 'nvim-lua/completion-nvim'

-- paq 'hrsh7th/nvim-compe'
paq {'tzachar/compe-tabnine', run='./install.sh' }
paq 'tamago324/compe-zsh'
paq 'onsails/lspkind-nvim'

paq {'nvim-treesitter/nvim-treesitter', run=vim.fn['TSUpdate']}
-- paq 'nvim-treesitter/completion-treesitter'

paq 'kyazdani42/nvim-web-devicons'


paq 'PratikBhusal/vim-grip'

-- " Git
--
paq 'https://github.com/tpope/vim-fugitive.git'
paq 'lewis6991/gitsigns.nvim'

paq 'rbong/vim-flog'
paq 'ajorgensen/vim-markdown-toc'


-- Load Ultisnips later to make sure it has the <tab> map
paq 'SirVer/ultisnips'
paq 'honza/vim-snippets'

-- Color Schemes
-- Solarized has been good to me. I plan to keep it a while
-- paq 'iCyMind/NeoSolarized'
paq 'ishan9299/nvim-solarized-lua'
paq 'mhartington/oceanic-next'
paq 'PHSix/nvim-hybrid'
paq 'RRethy/nvim-base16'

-- Treesitter compatible
Plug 'christianchiarulli/nvcode-color-schemes.vim'

paq 'https://github.com/vim-airline/vim-airline-themes'
paq 'https://github.com/vim-airline/vim-airline.git'

-- paq 'morhetz/gruvbox'
-- 
-- " https://github.com/lifepillar/vim-gruvbox8
-- paq 'lifepillar/vim-gruvbox8'
-- 
-- " https://github.com/lifepillar/vim-solarized8
-- " paq 'lifepillar/vim-solarized8'
