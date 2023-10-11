return {
	-- Theme / Colors
	-- "ishan9299/nvim-solarized-lua",

	{
		-- https://github.com/rose-pine/neovim
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			dark_variant = "moon",
			-- disable_italics = true,
		},
	},
	{
		"Tsuzat/NeoSolarized.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		opts = {
            transparent = false,
		    style = "light",
		},
		-- config = function()
		-- 	vim.cmd([[ colorscheme NeoSolarized ]])
		-- end,
	},
	{
		"EdenEast/nightfox.nvim",
		-- opts = {
		-- 	transparent = true,
		-- },
	},
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- },
	{
		"folke/lsp-colors.nvim",
	},
	{
		-- https://github.com/norcalli/nvim-colorizer.lua
		"/norcalli/nvim-colorizer.lua",
		ft = { "css", "html", "bash", "javascript", "markdown" },
	},
}
