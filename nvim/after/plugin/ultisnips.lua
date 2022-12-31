-- UltiSnips

-- From cmp-nvim-ultisnips:
--   UltiSnip was auto-removing tab mappings for select mode,
--   that leads to we cannot jump through snippet stops
--   We have to disable this by set UltiSnipsRemoveSelectModeMappings = 0 (Credit JoseConseco)
-- vim.g.UltiSnipsRemoveSelectModeMappings = 0

-- Make sure it picks up our snippet file first, so our overwrites take effect.
vim.g.UltiSnipsDontReverseSearchPath = true
-- let g:UltiSnipsSnippetsDir = '~/.upkg/Viming-With-Buttars.git/vim/UltiSnips'

vim.g.UltiSnipsExpandTrigger = '<c-j>'
vim.g.UltiSnipsJumpForwardTrigger = '<c-j>'
-- vim.g.UltiSnipsListSnippets = '<c-q>'
-- vim.g.UltiSnipsListSnippets                <c-tab>
-- vim.g.UltiSnipsJumpForwardTrigger          <c-j>
-- vim.g.UltiSnipsJumpBackwardTrigger         <c-k>

vim.g.UltiSnipsSnippetDirectories = {'~/.config/nvim/UltiSnips'}
