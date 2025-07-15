-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local ButtarsACmds = vim.api.nvim_create_augroup("ButtarsCustomAutocmds", { clear = true })

local function AutoSave(args)
  -- Restart LSP servers every 30 minutes, keep em fresh
  local now = vim.fn.reltimefloat(vim.fn.reltime())

  -- NOTE: (jeff), If there is a mis-behaving lsp, the restart interval can help
  -- if vim.g.lsp_restart_interval then
  --   if not vim.g.lsp_restart_last then
  --     vim.g.lsp_restart_last = now
  --   end
  --
  --   if (now - vim.g.lsp_restart_last) > vim.g.lsp_restart_interval then
  --     require("notify")("Restarting LSP Servers...")
  --     -- vim.print("Restarting LSP Servers: " .. (now - vim.g.lsp_restart_last) .. " : " .. now .. " : " .. vim.g.lsp_restart_last)
  --     vim.api.nvim_cmd({ cmd = "LspRestart" }, {})
  --     vim.g.lsp_restart_last = now
  --   end
  -- end

  -- close the preview window if it's visible
  -- and the pop up menu is not visible, but not if
  -- we're in a preview window.
  if vim.fn.pumvisible() == 0 and vim.opt.buftype:get() == "" then
    vim.api.nvim_command("pclose")
  end

  -- Ignore hidden or unlisted buffers and other types of buffers
  if
    (not vim.opt.modified:get())
    or (not vim.api.nvim_buf_get_option(0, "modifiable"))
    or vim.opt.readonly:get()
    or vim.opt.buflisted:get() == false
    or vim.opt.bufhidden:get() == "hide"
  then
    return
  end

  if vim.fn.expand("%") ~= "" then
    if not vim.api.nvim_buf_get_option(args.buf, "modified") then
      -- print("Not Saved " .. vim.fn.expand("%") .. " Unmodified")
      return
    end

    vim.api.nvim_buf_call(args.buf, function()
      vim.api.nvim_cmd({ cmd = "write", args = {}, bang = true, mods = { silent = true } }, {})
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

-- Put the results of a good old grep into the cwindow to easily naviagate the results
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
    -- vim.opt.cursorline = false
    vim.opt.cursorcolumn = false
    vim.opt.relativenumber = false
  end,
  group = ButtarsACmds,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "WinLeave" }, {
  pattern = "*",
  callback = function()
    vim.opt.cursorcolumn = false
    vim.opt.cursorline = false
    vim.opt.relativenumber = false
  end,
  group = ButtarsACmds,
})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "WinEnter" }, {
  pattern = "*",
  callback = function()
    vim.opt.relativenumber = true
    vim.opt.cursorline = true
    vim.opt.cursorcolumn = true
  end,
  group = ButtarsACmds,
})
