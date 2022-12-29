local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]

        return true
    end

    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- FZF setup
    use {
        'junegunn/fzf',
        dir = '~/.fzf',
        run = { './install --all' },
    }
    use 'junegunn/fzf.vim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        }
    }

    -- Theme / Colors
    use "ishan9299/nvim-solarized-lua"
    use "EdenEast/nightfox.nvim"
    use "folke/lsp-colors.nvim"
    -- use({
    --     'rose-pine/neovim',
    --     as = 'rose-pine',
    -- })

    -- Tree Sitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    -- File management
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    -- Undo
    use('mbbill/undotree')

    -- Git
    use('tpope/vim-fugitive')

    -- formatting
    use 'axelf4/vim-strip-trailing-whitespace'
    use 'psf/black'
    use 'brentyi/isort.vim'

    -- Iconogrophy
    use 'junegunn/vim-emoji'
    use 'kyazdani42/nvim-web-devicons'
    use 'mortepau/codicons.nvim'

    -- Status line
    -- use "rebelot/heirline.nvim"
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Commenting
    use {
        'numToStr/Comment.nvim',
    }

    -- LSP setup
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { "tamago324/cmp-zsh",
                requires = { "Shougo/deol.nvim" },
            },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            {'rafamadriz/friendly-snippets'},
            { 'honza/vim-snippets' },

            --[[ { 'honza/vim-snippets' },
            -- From cmp-nvim-ultisnips:
            --   UltiSnip was auto-removing tab mappings for select mode,
            --   that leads to we cannot jump through snippet stops
            --   We have to disable this by set UltiSnipsRemoveSelectModeMappings = 0 (Credit JoseConseco)
            {
                "SirVer/ultisnips",
                requires = "honza/vim-snippets",
                config = function()
                    vim.g.UltiSnipsRemoveSelectModeMappings = 0
                end,
            }, ]]
        }
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
