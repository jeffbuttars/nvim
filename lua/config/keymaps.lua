-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- diagnostics jump to next/prev
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)

-- Search and replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- -- Enclosing/Surrounding character mappings, visually select then double tap the
-- -- character to enclose the selections
-- A part of DoubleTap now
-- vim.api.nvim_set_keymap("v", "((", "<ESC>`>a)<ESC>`<i(<ESC>", { noremap = true })
-- vim.api.nvim_set_keymap("v", "))", "<ESC>`<i(<ESC>`><right>a)<ESC>", { noremap = true })
-- vim.api.nvim_set_keymap("v", "{{", "<ESC>`>a}<ESC>`<i{<ESC>", { noremap = true })
-- vim.api.nvim_set_keymap("v", "}}", "<ESC>`<i{<ESC>`><right>a}<ESC>", { noremap = true })
-- vim.api.nvim_set_keymap("v", "[[", "<ESC>`>a]<ESC>`<i[<ESC>", { noremap = true })
-- vim.api.nvim_set_keymap("v", "]]", "<ESC>`<i[<ESC>`><right>a]<ESC>", { noremap = true })
-- vim.api.nvim_set_keymap("v", '""', '<ESC>`>a"<ESC>`<i"<ESC>', { noremap = true })
-- vim.api.nvim_set_keymap("v", "''", "<ESC>`>a'<ESC>`<i'<ESC>", { noremap = true })
-- vim.api.nvim_set_keymap("v", "``", "<ESC>`>a`<ESC>`<i`<ESC>", { noremap = true })

-- Paste over visual selection without the register swap with what's selected
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "c-]", function()
  vim.lsp.buf.definition()
end, { noremap = true })

vim.keymap.set("n", "c-i", function()
  vim.lsp.buf.implementation()
end, { noremap = true })

--  DELETED Keymaps --
-- Remove some keymaps that I don't find are any better than the default Vim key maps
vim.keymap.del("n", "<leader>ww")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>w-")
vim.keymap.del("n", "<leader>w|")
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")

-- buffers
vim.keymap.del("n", "[b")
vim.keymap.del("n", "]b")

-- Move Lines
vim.keymap.del("n", "<A-j>")
vim.keymap.del("n", "<A-k>")
vim.keymap.del("i", "<A-j>")
vim.keymap.del("i", "<A-k>")

-- save file
vim.keymap.del({ "i", "x", "n", "s" }, "<C-s>")
--
-- new file
vim.keymap.del("n", "<leader>fn")

-- quit
vim.keymap.del("n", "<leader>qq")

-- REMAPS --
-- ALT is used by my WM, so we remap things that use ALT that are useful
vim.keymap.del("v", "<A-j>")
vim.keymap.del("v", "<A-k>")
vim.keymap.set("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
