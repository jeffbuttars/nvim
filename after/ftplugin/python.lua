
-- vim.keymap.set("n", "<F5>", "<cmd>Isort<CR><cmd>Black<CR>")
vim.keymap.set("n", "<F5>", "<cmd>%!isort --profile black - 2>/dev/null<CR><cmd>Black<CR>")
