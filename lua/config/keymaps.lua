-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- diagnostics jump to next/prev
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)

-- Search and replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Enclosing/Surrounding character mappings, visually select then double tap the
-- character to enclose the selections
vim.api.nvim_set_keymap("v", "((", "<ESC>`>a)<ESC>`<i(<ESC>", { noremap = true })
vim.api.nvim_set_keymap("v", "))", "<ESC>`<i(<ESC>`><right>a)<ESC>", { noremap = true })
vim.api.nvim_set_keymap("v", "{{", "<ESC>`>a}<ESC>`<i{<ESC>", { noremap = true })
vim.api.nvim_set_keymap("v", "}}", "<ESC>`<i{<ESC>`><right>a}<ESC>", { noremap = true })
vim.api.nvim_set_keymap("v", "[[", "<ESC>`>a]<ESC>`<i[<ESC>", { noremap = true })
vim.api.nvim_set_keymap("v", "]]", "<ESC>`<i[<ESC>`><right>a]<ESC>", { noremap = true })
vim.api.nvim_set_keymap("v", '""', '<ESC>`>a"<ESC>`<i"<ESC>', { noremap = true })
vim.api.nvim_set_keymap("v", "''", "<ESC>`>a'<ESC>`<i'<ESC>", { noremap = true })
vim.api.nvim_set_keymap("v", "``", "<ESC>`>a`<ESC>`<i`<ESC>", { noremap = true })

-- Paste over visual selection without the register swap with what's selected
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "c-]", function()
  vim.lsp.buf.definition()
end, { noremap = true })

vim.keymap.set("n", "c-i", function()
  vim.lsp.buf.implementation()
end, { noremap = true })
