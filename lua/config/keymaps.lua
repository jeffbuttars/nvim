-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Whichkey goodness maps
local wk = require("which-key")
wk.register({
  ["<leader>gd"] = {
    function()
      local gs = package.loaded.gitsigns
      gs.diffthis("~")
    end,
    "Diffthis",
  },
})

wk.register({
  ["<leader>gb"] = {
    function()
      local gs = package.loaded.gitsigns
      gs.blame_line()
    end,
    "Blame Line",
  },
})

-- diagnostics jump to next/prev
wk.register({
  mode = { "n" },
  ["<leader>xn"] = { vim.diagnostic.goto_next, "diagnostic next" },
  ["<leader>xp"] = { vim.diagnostic.goto_prev, "diagnostic prev" },
})
-- vim.keymap.set("n", "<leader>xn", vim.diagnostic.goto_next)
-- vim.keymap.set("n", "<leader>xp", vim.diagnostic.goto_prev)

-- Search and replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
vim.keymap.set(
  "n",
  "<leader>fx",
  "<cmd>!chmod +x %<CR>",
  { silent = true, desc = "Make current file executable" }
)

-- -- Enclosing/Surrounding character mappings, visually select then double tap the
-- -- character to enclose the selections
-- A part of DoubleTap now
-- vim.api.nvim_set_keymap("v", "((", "<ESC>`>a)<ESC>`<i(<ESC>", { noremap = true })
-- vim.api.nvim_set_keymap("v", "((", "<ESC>`<i(<ESC>`><right>a)<ESC>", { noremap = true })
-- vim.api.nvim_set_keymap("v", "((", "<ESC>`>a}<ESC>`<i{<ESC>", { noremap = true })
-- vim.api.nvim_set_keymap("v", "}}", "<ESC>`<i{<ESC>`><right>a}<ESC>", { noremap = true })
-- vim.api.nvim_set_keymap("v", "[[", "<ESC>`>a]<ESC>`<i[<ESC>", { noremap = true })
-- vim.api.nvim_set_keymap("v", "]]", "<ESC>`<i[<ESC>`><right>a]<ESC>", { noremap = true })
-- vim.api.nvim_set_keymap("v", '""', '<ESC>`>a"<ESC>`<i"<ESC>', { noremap = true })
-- vim.api.nvim_set_keymap("v", "''", "<ESC>`>a'<ESC>`<i'<ESC>", { noremap = true })
-- vim.api.nvim_set_keymap("v", "``", "<ESC>`>a`<ESC>`<i`<ESC>", { noremap = true })

-- Terminal Normal Mode
-- Add CTRL-K/J for up/down movement. This is mostly for UI selectors that use a terminal mode selector
vim.api.nvim_set_keymap("t", "<C-k>", "<C-p>", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-j>", "<C-n>", { noremap = true })

-- Paste over visual selection without the register swap with what's selected
-- vim.keymap.set("x", "<leader>p", [["_dP]])

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

-- Clear search with <esc>
vim.keymap.set(
  { "i", "n" },
  "<leader><esc>",
  "<cmd>noh<cr><esc>",
  { desc = "Escape and clear hlsearch" }
)
-- vim.keymap.del({ "i", "n" }, "<esc>")
