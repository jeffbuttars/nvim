-- https://github.com/wbthomason/packer.nvim#notices

-- https://github.com/wbthomason/packer.nvim#bootstrapping
-- If you want to automatically install and set up packer.nvim on any machine
-- you clone your configuration to, add the following snippet
-- (which is due to @Iron-E and @khuedoan)
-- somewhere in your config before your first usage of packer:
local fn = vim.fn
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
    -- use 'nvim-lua/plenary.nvim'
    -- use 'nvim-lua/popup.nvim'

    -- For writing prose
    -- Plug 'junegunn/goyo.vim'

    -- Formatting
    use 'axelf4/vim-strip-trailing-whitespace'

    -- -> Python
    use 'psf/black'
    use {
        'stsewd/isort.nvim',
        { run = ':UpdateRemotePlugins', ft = 'python' },
    }

    -- FZF setup
    -- use {
    --     'junegunn/fzf',
    --     dir = '~/.fzf',
    --     run = { './install --all' },
    -- }
    -- use 'junegunn/fzf.vim'

    -- Telescope https://github.com/nvim-telescope/telescope.nvim
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Iconogrophy
    use 'junegunn/vim-emoji'
    use 'kyazdani42/nvim-web-devicons'
    use 'mortepau/codicons.nvim'

    -- Status line
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Commenters
    use 'preservim/nerdcommenter'

    -- NVim Tree
    -- Install 'kyazdani42/nvim-web-devicons' for file icons
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {} end
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
    use "https://github.com/tpope/vim-fugitive"


    use {
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function() require("gitsigns").setup() end
    }
    use {
        "rbong/vim-flog",
        requires = {  "https://github.com/tpope/vim-fugitive" },
    }

    -- Theme / Colors
    use "ishan9299/nvim-solarized-lua"
    use "folke/lsp-colors.nvim"

    -- LSP and completions
    use "neovim/nvim-lspconfig"
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    use {
        "tamago324/cmp-zsh",
        requires = { "Shougo/deol.nvim" },
    }
    -- -> nvim-cmp
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            -- https://github.com/quangnguyen30192/cmp-nvim-ultisnips
            "quangnguyen30192/cmp-nvim-ultisnips",
            "quangnguyen30192/cmp-nvim-tags",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-look",
            "ray-x/cmp-treesitter",
            "f3fora/cmp-spell",
            "tamago324/cmp-zsh",
        },
    }
    use {
        "tzachar/cmp-tabnine",
        run="./install.sh",
        requires = "hrsh7th/nvim-cmp"
    }


-- Examples below
  -- Simple plugins can be specified as strings
  -- use '9mm/vim-closer'

  -- Lazy loading:
  -- Load on specific commands
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  -- use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  -- use {
  --   'w0rp/ale',
  --   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  --   cmd = 'ALEEnable',
  --   config = 'vim.cmd[[ALEEnable]]'
  -- }

  -- Plugins can have dependencies on other plugins
  -- use {
  --   'haorenW1025/completion-nvim',
  --   opt = true,
  --   requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  -- }

  -- Plugins can also depend on rocks from luarocks.org:
  -- use {
  --   'my/supercoolplugin',
  --   rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
  -- }

  -- You can specify rocks in isolation
  -- use_rocks 'penlight'
  -- use_rocks {'lua-resty-http', 'lpeg'}

  -- Local plugins can be included
  -- use '~/projects/personal/hover.nvim'

  -- Plugins can have post-install/update hooks
  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Post-install/update hook with call of vimscript function with argument
  -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use specific branch, dependency and run lua file after load
  -- use {
  --   'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }

  -- Use dependency and run lua function after load
  -- use {
  --   'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  --   config = function() require('gitsigns').setup() end
  -- }

  -- -- You can specify multiple plugins in a single call
  -- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  -- -- You can alias plugin names
  -- use {'dracula/vim', as = 'dracula'}
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
