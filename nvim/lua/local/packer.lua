-- https://github.com/wbthomason/packer.nvim#notices

-- https://github.com/wbthomason/packer.nvim#bootstrapping
-- If you want to automatically install and set up packer.nvim on any machine
-- you clone your configuration to, add the following snippet
-- (which is due to @Iron-E and @khuedoan)
-- somewhere in your config before your first usage of packer:
local fn = vim.fn
local packer_boostrap = false
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    print("Installing Packer...")
    packer_bootstrap = fn.system(
        {'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path}
    )
end

local packer = require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Lua utils / lib
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    -- For writing prose
    -- Plug 'junegunn/goyo.vim'


    use 'monkoose/matchparen.nvim'

    -- Formatting
    use 'axelf4/vim-strip-trailing-whitespace'

    -- -> Python
    use 'psf/black'
    use 'brentyi/isort.vim'

    -- FZF setup
    use {
        'junegunn/fzf',
        dir = '~/.fzf',
        run = { './install --all' },
    }
    use 'junegunn/fzf.vim'

    -- Telescope https://github.com/nvim-telescope/telescope.nvim
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        }
    }

    -- Iconogrophy
    use 'junegunn/vim-emoji'
    use 'kyazdani42/nvim-web-devicons'
    use 'mortepau/codicons.nvim'

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Commenters
    use 'preservim/nerdcommenter'

    -- NVim Tree
    -- Install 'kyazdani42/nvim-web-devicons' for file icons
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'local/nvim_tree' end
    }

    -- Unixy commands for vim
    -- I don't think I've used this since I've started using plugins like nvim-tree, fzf, etc.
    -- use 'tpope/vim-eunuch'

    -- Diff stuff
    use 'sindrets/diffview.nvim'

    -- Snippets
    --
    use 'honza/vim-snippets'
    -- From cmp-nvim-ultisnips:
    --   UltiSnip was auto-removing tab mappings for select mode,
    --   that leads to we cannot jump through snippet stops
    --   We have to disable this by set UltiSnipsRemoveSelectModeMappings = 0 (Credit JoseConseco)
    use({
    "SirVer/ultisnips",
    requires = "honza/vim-snippets",
    config = function()
        vim.g.UltiSnipsRemoveSelectModeMappings = 0
    end,
    })

    -- Markdown stuff
    use 'PratikBhusal/vim-grip'
    use 'ajorgensen/vim-markdown-toc'

    -- Git
    use "tpope/vim-fugitive"


    use {
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function() require("gitsigns").setup() end
    }
    use {
        "rbong/vim-flog",
        requires = { "tpope/vim-fugitive" },
    }

    -- Theme / Colors
    use "ishan9299/nvim-solarized-lua"
    use "EdenEast/nightfox.nvim"
    use "folke/lsp-colors.nvim"

    -- Tab indicator
    -- use "lukas-reineke/indent-blankline.nvim"

    -- LSP and completions
    use "neovim/nvim-lspconfig"
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    use {
        "tamago324/cmp-zsh",
        requires = { "Shougo/deol.nvim" },
    }

    -- Lua
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
          require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
          }
      end
    }

    -- -> nvim-cmp
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            -- https://github.com/quangnguyen30192/cmp-nvim-ultisnips
            "quangnguyen30192/cmp-nvim-ultisnips",
            "quangnguyen30192/cmp-nvim-tags",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-look",
            'hrsh7th/cmp-cmdline',
            "ray-x/cmp-treesitter",
            "f3fora/cmp-spell",
            "tamago324/cmp-zsh",
            "hrsh7th/cmp-emoji",
        },
    }
    -- use {
    --     "tzachar/cmp-tabnine",
    --     run="./install.sh",
    --     requires = "hrsh7th/nvim-cmp"
    -- }

    if packer_bootstrap then
        require('packer').sync()
    end
end)


-- You can configure Neovim to automatically run :PackerCompile
-- whenever plugins.lua is updated with an autocommand:
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


return packer
