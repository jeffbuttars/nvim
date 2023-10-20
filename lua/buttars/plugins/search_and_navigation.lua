return {
	{
		"junegunn/fzf.vim",
		dependencies = {
			{
				"junegunn/fzf",
				dir = "~/.fzf",
				build = { "./install --all" },
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		keys = { "<C-l>", "<C-p>", "<leader>pf", "<leader>ps" },
		config = function()
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")

			-- Telescope media files setup
			-- require('telescope').load_extension('media_files')

			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							-- ["<esc>"] = actions.close,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
						n = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
					},

					max_results = 10,

					color_devicons = true,
					layout_strategy = "vertical",
					-- layout_strategy = "flex",
					height = 0.25,
					layout_config = {
						vertical = {
							width = 0.9,
							height = 0.95,
							-- height = function(_, _, max_lines)
							--     local percentage
							--     local min = 3
							--     return math.max(math.floor(percentage * max_lines), min)
							-- end,
							-- mirror = false,
						},
					},
				},

				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
					-- media_files = {
					-- filetypes whitelist
					-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
					-- filetypes = {"png", "webp", "jpg", "jpeg"},
					-- find command (defaults to `fd`)
					-- find_cmd = "rg"
					-- }
				},
			})

			-- To get fzf loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("fzf")

			-- project files
			vim.keymap.set("n", "<leader>pf", builtin.find_files, {})

			-- git files
			vim.keymap.set("n", "<C-p>", builtin.git_files, {})

			-- Buffers
			vim.keymap.set("n", "<C-l>", function()
				builtin.buffers({ sort_lastused = true })
			end)

			-- project search
			vim.keymap.set("n", "<leader>ps", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end)

			-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		keys = { "<C-d>", "<C-g>" },
		config = function()
			-- https://github.com/nvim-neo-tree/neo-tree.nvim
			require("neo-tree").setup({
				filesystem = {
					follow_current_file = {
						enabled = true,
						leave_dirs_open = true, -- default: false
					},
					use_libuv_file_watcher = true,
				},

				window = {
					-- width = "fit_content",
					max_width = "33%",
				},

				buffers = {
					follow_current_file = {
						enabled = true,
						leave_dirs_open = true, -- default: false
					},
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
				event_handlers = {
					-- {
					-- 	event = "neo_tree_window_after_open",
					-- 	handler = function()
					-- 		vim.wo.number = true
					-- 		vim.wo.relativenumber = true
					-- 	end,
					-- },
					{
						event = "neo_tree_buffer_enter",
						handler = function()
							vim.wo.number = true
							vim.wo.relativenumber = true
						end,
					},
					{
						event = "file_opened",
						handler = function()
							require("neo-tree").close_all()
						end,
					},
				},
			})

			vim.api.nvim_set_keymap(
				"n",
				"<C-d>",
				":Neotree action=focus toggle reveal<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<C-g>",
				":Neotree action=focus toggle reveal source=git_status<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
