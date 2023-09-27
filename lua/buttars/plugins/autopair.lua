return {
	-- -- https://github.com/windwp/nvim-autopairs
	-- {
	-- "windwp/nvim-autopairs",
	-- config = {
	--   disable_filetype = { "TelescopePrompt" , "vim" },
	-- }
	-- },
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		config = function()
			require("ultimate-autopair").setup({})
		end,
	},
}
