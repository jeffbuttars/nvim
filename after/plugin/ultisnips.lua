-- UltiSnips

-- Make sure it picks up our snippet file first, so our overwrites take effect.
vim.g.UltiSnipsDontReverseSearchPath = true

vim.g.UltiSnipsExpandTrigger = '<c-j>'
vim.g.UltiSnipsJumpForwardTrigger = '<c-j>'
-- vim.g.UltiSnipsListSnippets = '<c-q>'
-- vim.g.UltiSnipsListSnippets                <c-tab>
-- vim.g.UltiSnipsJumpForwardTrigger          <c-j>
-- vim.g.UltiSnipsJumpBackwardTrigger         <c-k>

vim.g.UltiSnipsSnippetDirectories = {'~/.config/nvim/UltiSnips'}
