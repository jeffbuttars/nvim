vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste over visual selection without the register swap with what's selected
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Shortcut for copying to/from System Clipboard : asbjornHaland
-- We use clipboard opt instead, but you can use this instead if you wish
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Avoid inadvertent 'Q'
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

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

vim.keymap.set({ "n", "t" }, "<C-PageDown>", ":tabNext<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "t" }, "<C-PageUp>", ":tabprevious<CR>", { noremap = true, silent = true })
