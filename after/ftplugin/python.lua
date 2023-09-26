-- vim.keymap.set("n", "<F5>", "<cmd>Isort<CR><cmd>Black<CR>")
-- vim.keymap.set("n", "<F5>", "<cmd>%!isort --profile black - 2>/dev/null<CR><cmd>Black<CR>")
vim.keymap.set(
    "n",
    "<F5>",
    "<cmd>let sv = winsaveview()<cr>" ..
    "<cmd>Black<CR><cmd>%!ruff --fix-only -e -n --stdin-filename % - 2>/dev/null<CR>" ..
    "<cmd>call winrestview(sv)<cr>"
)


-- local FormatPyOnSave = vim.api.nvim_create_augroup("FormatPyOnSave", { clear = true })
--
-- vim.api.nvim_create_autocmd(
--     -- { "CursorHold", "BufLeave", "FocusLost", "WinLeave", "BufWritePre" },
--     "BufWritePre",
--     {
--     pattern = "*.py",
--     command = "silent! %!ruff --fix-only -e -n --stdin-filename % - 2>/dev/null",
--     group = FormatPyOnSave,
--     desc = "Format current buffer with ruff",
-- })
--
-- vim.api.nvim_create_autocmd(
--     -- { "CursorHold", "BufLeave", "FocusLost", "WinLeave", "BufWritePre" },
--     "BufWritePre",
--     {
--     pattern = "*.py",
--     command = "silent! Black",
--     group = FormatPyOnSave,
--     desc = "Format current buffer with black",
-- })
--
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--     pattern = "*.py",
--     callback = function()
--         vim.api.nvim_cmd({ cmd = "normal", args = {"g''"}, bang = true }, {})
--     end,
--     group = FormatPyOnSave,
-- })