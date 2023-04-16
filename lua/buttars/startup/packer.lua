local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])

        return true
    end

    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- FZF setup
    use({
        "junegunn/fzf",
        dir = "~/.fzf",
        run = { "./install --all" },
    })
    use("junegunn/fzf.vim")

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        -- or                            , branch = '0.1.x',
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        },
    })

    -- Theme / Colors
    use("ishan9299/nvim-solarized-lua")
    use({ "rose-pine/neovim", as = "rose-pine" })
    use("EdenEast/nightfox.nvim")
    use("folke/lsp-colors.nvim")

    -- Tree Sitter
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/playground")

    -- File management
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
    })

    -- Undo
    use("mbbill/undotree")

    -- Shell
    use({
        "akinsho/toggleterm.nvim",
        tag = "*",
        config = function()
            require("toggleterm").setup()
        end,
    })

    -- Git
    use("tpope/vim-fugitive")
    use("lewis6991/gitsigns.nvim")

    -- formatting
    use("jose-elias-alvarez/null-ls.nvim")
    use("axelf4/vim-strip-trailing-whitespace")
    use("psf/black")
    use("brentyi/isort.vim")

    -- Iconogrophy
    use("junegunn/vim-emoji")
    use("kyazdani42/nvim-web-devicons")
    use("mortepau/codicons.nvim")

    -- Status line
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    -- Commenting
    use({
        "numToStr/Comment.nvim",
    })

    -- Misc
    use("monkoose/matchparen.nvim")
    use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
    use({ "windwp/nvim-autopairs" })
    use({ "Bekaboo/deadcolumn.nvim" })

    -- Markdown stuff
    use("PratikBhusal/vim-grip")
    use("ajorgensen/vim-markdown-toc")
    use({ "toppair/peek.nvim", run = "deno task --quiet build:fast" })

	-- Mermaid
	use("craigmac/vim-mermaid")

	-- Rust
	use("simrat39/rust-tools.nvim")

	-- Debug
	use("mfussenegger/nvim-dap")

    -- LSP setup
    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

			{ "sumneko/lua-language-server" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },
            { "hrsh7th/cmp-cmdline" },
            -- { "saadparwaiz1/cmp_luasnip" },
            { "tamago324/cmp-zsh",                   requires = { "Shougo/deol.nvim" } },

            -- Snippets
            -- { "L3MON4D3/LuaSnip" },
            -- { "rafamadriz/friendly-snippets" },
            { "quangnguyen30192/cmp-nvim-ultisnips", requires = { "SirVer/ultisnips" } },
            { "SirVer/ultisnips" },
            { "honza/vim-snippets" },
            { "onsails/lspkind.nvim" },
        },
    })

    if packer_bootstrap then
        require("packer").sync()
    end
end)
