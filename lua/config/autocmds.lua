-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local Util = require("lazyvim.util")

local ButtarsACmds = vim.api.nvim_create_augroup("ButtarsCustomAutocmds", { clear = true })

-- show diagnostics popup when we're chillin in normal mode
-- Show a diagnostic popup on cursor hold
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float({ focusable = false, scope = "line", source = true })
    -- vim.diagnostic.open_float({ focusable = false, scope = "buffer", source = true })
  end,
  group = ButtarsACmds,
})

local function AutoSave(args)
  -- close the preview window if it's visible
  -- and the pop up menu is not visible, but not if
  -- we're in a preview window.
  if vim.fn.pumvisible() == 0 and vim.opt.buftype:get() == "" then
    vim.api.nvim_command("pclose")
  end

  if
    (not vim.opt.modified:get())
    or (not vim.api.nvim_buf_get_option(0, "modifiable"))
    or vim.opt.readonly:get()
  then
    return
  end

  if vim.fn.expand("%") ~= "" then
    if not vim.api.nvim_buf_get_option(args.buf, "modified") then
      -- print("Not Saved " .. vim.fn.expand("%") .. " Unmodified")
      return
    end

    vim.api.nvim_buf_call(args.buf, function()
      vim.api.nvim_cmd({ cmd = "write", args = {}, bang = true }, {})
      print("Saved " .. vim.fn.expand("%"))
    end)
  end
end

-- AutoSave often
vim.api.nvim_create_autocmd({ "CursorHold", "BufLeave", "FocusLost", "WinLeave", "VimLeave" }, {
  pattern = "*",
  callback = AutoSave,
  group = ButtarsACmds,
  desc = "AutoSave current buffer",
})

-- Format buf on resize ?
-- Need to make this _not_ change the quickfix size.
-- vim.api.nvim_create_autocmd({ "VimResized" }, {
--   pattern = "*",
--   callback = vim.lsp.buf.format,
--   group = ButtarsACmds,
-- })

vim.api.nvim_create_autocmd(
  { "QuickFixCmdPost" },
  { pattern = "*grep*", command = "cwindow", group = ButtarsACmds }
)

-- Only use cursorline/cursorcolumn in normal mode
-- set linenumbers on by default
-- When in insert mode, show linear numbers
-- When not in insert mode, show current line number with relative numbers
-- And last of all, only be relative in the buffer we're editing.
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  pattern = "*",
  callback = function()
    vim.opt.cursorline = true
    vim.opt.cursorcolumn = true
    vim.opt.relativenumber = true
  end,
  group = ButtarsACmds,
})

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  pattern = "*",
  callback = function()
    vim.opt.cursorline = false
    vim.opt.cursorcolumn = false
    vim.opt.relativenumber = false
  end,
  group = ButtarsACmds,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "WinLeave" }, {
  pattern = "*",
  callback = function()
    vim.opt.relativenumber = false
  end,
  group = ButtarsACmds,
})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "WinEnter" }, {
  pattern = "*",
  callback = function()
    vim.opt.relativenumber = true
  end,
  group = ButtarsACmds,
})

-- vim.api.nvim_create_autocmd({ "InsertLeave" }, {
--   pattern = "*",
--   callback = function()
--     Util.format({ force = true })
--   end,
--   group = ButtarsACmds,
-- })

--  When editing a file, always jump to the last known cursor position.
--  Don't do it when the position is invalid or when inside an event handler
--  (happens when dropping a file on gvim).
--  Also don't do it when the mark is in the first line, that is the default
--  position when opening a file.
--
--  Commented out, because LazyVim has it's own version for this
-- vim.api.nvim_create_autocmd({ "BufReadPost" }, {
--   pattern = "*",
--   callback = function()
--     if vim.fn.line("'\"") and vim.fn.line("'\"") <= vim.fn.line("$") then
--       -- vim.api.nvim_cmd("normal! g`\"")
--       vim.api.nvim_cmd({ cmd = "normal", args = { 'g`"' }, bang = true }, {})
--     end
--   end,
--   group = ButtarsACmds
-- })
