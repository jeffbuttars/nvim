return {
	{
		"ajorgensen/vim-markdown-toc",
		ft = { "markdown" },
	},
	{ 
        "iamcco/markdown-preview.nvim",
        build = "cd app && yarn install",
        ft = { "markdown", "pandoc.markdown", "rmd" },
        config = function()
            vim.g.mkdp_preview_options = {
                uml = {
                    -- For using local server:
                    --   `plantuml -picoweb:9999`
                    server = 'http://127.0.0.1:9999/plantuml',
                    imageFormat = 'svg',
                },
            }

            vim.g.mkdp_filetypes = { "markdown", "plantuml" }
            vim.g.mkdp_auto_close = false
            -- vim.g.mkdp_combine_preview = false
            -- vim.g.mkdp_combine_preview_auto_refresh = true
        end
    },
	{
		"toppair/peek.nvim",
		cmd = { "PeekOpen", "PeekClose" },
		build = "deno task --quiet build:fast",
		config = function()
			-- default config:
			require("peek").setup({
				auto_load = true, -- whether to automatically load preview when
				-- entering another markdown buffer
				close_on_bdelete = true, -- close preview window on buffer delete

				syntax = true, -- enable syntax highlighting, affects performance

				theme = "light", -- 'dark' or 'light'

				update_on_change = true,

				-- relevant if update_on_change is true
				throttle_at = 200000, -- start throttling when file exceeds this
				-- amount of bytes in size
				throttle_time = 200, -- minimum amount of time in milliseconds
				-- that has to pass before starting new render

				app = "browser",
			})

			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
}
