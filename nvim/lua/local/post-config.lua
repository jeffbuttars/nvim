-- [concisionandconcinnity.blogspot.com](http://concisionandconcinnity.blogspot.com/2009/07/vim-part-ii-matching-pairs.html)
--  The above URL also has good stuff for autoclosing matching pairs, like ().
-- One of the nicer minor features of TextMate is its treatment of highlighted text.
-- If you have something highlighted and type a, it replaces the text, like other editors.
-- If you type (, however, it wraps the selected text in parentheses.
-- This is enormously useful. Luckily, it's very easy to recreate in Vim:

local options = { noremap = true }

vim.api.nvim_set_keymap("v", "((",  "<ESC>`>a)<ESC>`<i(<ESC>", options)
vim.api.nvim_set_keymap("v", "))",  "<ESC>`<i(<ESC>`><right>a)<ESC>", options)
vim.api.nvim_set_keymap("v", "{{",  "<ESC>`>a}<ESC>`<i{<ESC>", options)
vim.api.nvim_set_keymap("v", "}}",  "<ESC>`<i{<ESC>`><right>a}<ESC>", options)
vim.api.nvim_set_keymap("v", "[[",  "<ESC>`>a]<ESC>`<i[<ESC>", options)
vim.api.nvim_set_keymap("v", "]]",  "<ESC>`<i[<ESC>`><right>a]<ESC>", options)
-- If allow " here, it messes up", register selection
-- So we use "" instead, and it works.
vim.api.nvim_set_keymap("v", '""',  '<ESC>`>a"<ESC>`<i"<ESC>', options)
vim.api.nvim_set_keymap("v", "''",  "<ESC>`>a'<ESC>`<i'<ESC>", options)
vim.api.nvim_set_keymap("v", "``",  "<ESC>`>a`<ESC>`<i`<ESC>", options)


-- https://bluz71.github.io/2017/06/28/current-treats-future-wants-of-neovim.html
-- Make escape work in the Neovim terminal.
-- tnoremap <Esc> <C-\><C-n>
--
-- Make navigation into and out of Neovim terminal splits nicer.
-- tnoremap <C-h> <C-\><C-N><C-w>h
-- tnoremap <C-j> <C-\><C-N><C-w>j
-- tnoremap <C-k> <C-\><C-N><C-w>k
-- tnoremap <C-l> <C-\><C-N><C-w>l

-- https://github.com/nickjj/dotfiles/blob/769402bc839e11f7b0a8a37664391a899b03021b/.vimrc#L328-L332
-- Move 1 more lines up or down in normal and visual selection modes.
-- nnoremap K :m .-2<CR>==
-- nnoremap J :m .+1<CR>==
-- vnoremap K :m '<-2<CR>gv=gv
-- vnoremap J :m '>+1<CR>gv=gv
vim.api.nvim_set_keymap("v", "K",  ":m '<-2<CR>gv=gv", options)
vim.api.nvim_set_keymap("v", "J",  ":m '>+1<CR>gv=gv", options)
