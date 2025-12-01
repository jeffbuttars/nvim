-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

-- uv python find
-- If uv is installed, ask it
if vim.fn.executable("uv") == 1 then
  vim.g.python3_host_prog = string.gsub(vim.fn.system("uv python find"), "\n", "")
else
  -- If my preferred Python venv is available, use it.
  local py_venv_exec = os.getenv("HOME") .. "/.venv/bin/python"
  if vim.fn.filereadable(py_venv_exec) == 1 then
    -- Explicitly set the python3 executable
    vim.g.python3_host_prog = py_venv_exec
  end
end

vim.opt.updatetime = 1000 -- Save swap file and trigger CursorHold

-- transparency menus seem to work with Alacritty ok, Wezterm is a maybe

-- opt.pumheight = 10 -- Maximum number of entries in a popup
-- vim.opt.pumheight = 15 -- Maximum number of entries in a popup
-- vim.opt.pumblend = 0 -- Set to 0 if using transparency causes rendering issues
vim.opt.pumblend = 15
vim.api.nvim_set_hl(0, "PmenuSel", { blend = 0 })
-- vim.api.nvim_set_hl(0, "Pmenu", { blend = 0 })

-- Disable LazyVim auto format, default is true
-- vim.g.autoformat = true
-- This may be annoying, set to false if so
-- opt.confirm = true -- Confirm to save changes before exiting modified buffer
-- I like to have my files automatically reloaded if they change on disk
vim.autoread = true
vim.opt.autowriteall = true

--  The title of the window to titlestring
vim.opt.title = true

vim.opt.listchars = { trail = "·", tab = "  ", nbsp = "~" }

-- diffopt
-- context: show 15 lines of context
-- closeoff when a window is closed where 'diff' is set
--   and there is only one window remaining in the
--   same tab page with 'diff' set, execute
--   `:diffoff` in that window.  This undoes a
--   `:diffsplit` command.
-- hiddenoff Do not use diff mode for a buffer when it
--   becomes hidden.
-- indent-heuristic
--         Use the indent heuristic for the internal
--         diff library.
-- algorithm:{text} Use the specified diff algorithm with the
--   internal diff engine. Currently supported
--   algorithms are:
--     myers      the default algorithm
--     minimal    spend extra time to generate the smallest possible diff
--     patience   patience diff algorithm
--     histogram  histogram diff algorithm
vim.opt.diffopt = {
  "internal",
  "filler",
  "vertical",
  "context:15",
  "closeoff",
  "hiddenoff",
  "indent-heuristic",
  "algorithm:histogram",
  "linematch:60",
}

-- Line wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "↪"

-- Instead of swapfiles and backups, aggressive saving is setup in ./autocmds.lua
vim.opt.swapfile = false
-- vim.opt.backup = false
vim.opt.backup = true
vim.opt.backupdir = "~/tmp/.vim/backup,/tmp//"
vim.opt.directory = "~/tmp/.vim/swap,/tmp//"
vim.opt.undodir = "~/tmp/.vim/undo,/tmp//"

vim.g.lsp_restart_interval = 60 * 30 -- 30 minutes
vim.g.lsp_restart_last = vim.fn.reltimefloat(vim.fn.reltime())
-- vim.g.lazyvim_python_lsp = "basedpyright"
-- vim.g.lazyvim_python_ruff = "ruff"
vim.g.lazyvim_picker = "snacks"

-- vim.opt.timeoutlen = 300  -- default
vim.opt.timeoutlen = 500

-- Only copy is supported, paste with Ctrl+shift+v
-- if vim.env.SSH_TTY then
--   local osc52 = require("vim.ui.clipboard.osc52")
--
--   local function copy_reg(reg)
--     local orig = osc52.copy(reg)
--     return function(lines, regtype)
--       -- Write to Vim's internal register
--       vim.fn.setreg(reg, table.concat(lines, "\n"), regtype)
--
--       -- Send OSC52 to local clipboard
--       -- orig(lines, regtype)
--       orig(lines)
--     end
--   end
--
--   vim.g.clipboard = {
--     name = "OSC 52 with register sync",
--     copy = {
--       ["+"] = copy_reg("+"),
--       ["*"] = copy_reg("*"),
--     },
--     -- Do NOT use OSC52 paste, just use internal registers
--     paste = {
--       ["+"] = function()
--         return vim.fn.getreg("+"), "v"
--       end,
--       ["*"] = function()
--         return vim.fn.getreg("*"), "v"
--       end,
--     },
--   }
--
--   vim.o.clipboard = "unnamedplus"
-- end
