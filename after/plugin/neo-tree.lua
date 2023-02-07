-- https://github.com/nvim-neo-tree/neo-tree.nvim

require("neo-tree").setup({
	filesystem = {
		follow_current_file = true,
		use_libuv_file_watcher = true,
	},

	buffers = {
		follow_current_file = true,
	},
	git_status = {
		symbols = {
			-- Change type
			added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
			modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
			deleted = "✖", -- this can only be used in the git_status source
			renamed = "", -- this can only be used in the git_status source
			-- Status type
			untracked = "",
			ignored = "",
			unstaged = "",
			staged = "",
			conflict = "",
		},
	},
})

-- vim.api.nvim_set_keymap("n", "<C-d>", ":NeoTreeFocus<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-d>", ":Neotree action=focus reveal_force_cwd<CR>", { noremap = true, silent = true })
