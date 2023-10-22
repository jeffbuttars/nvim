-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- show diagnostics popup when we're chillin in normal mode
local MyLSPGroup = vim.api.nvim_create_augroup("ButtarsCustomAutocmds", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float({ focusable = false, scope = "line", source = true })
  end,
  group = MyLSPGroup,
})
