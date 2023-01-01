-- UltiSnips
-- This must be loaded at startup and not in after

-- Make sure it picks up our snippet file first, so our overwrites take effect.
vim.g.UltiSnipsDontReverseSearchPath = true

-- vim.api.nvim_exec([[let g:UltiSnipsExpandTrigger = '<C-j>']], true)
-- vim.api.nvim_exec([[let g:UltiSnipsJumpForwardTrigger = '<C-j>']], true)


vim.g.UltiSnipsExpandTrigger = "<c-j>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
-- vim.g.UltiSnipsListSnippets = '<c-q>'
-- vim.g.UltiSnipsListSnippets                <c-tab>

vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/UltiSnips" }
