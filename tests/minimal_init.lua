-- Minimal init for headless plenary.busted runs.
-- Run all: nvim --headless --noplugin -u tests/minimal_init.lua \
--   -c "PlenaryBustedDirectory tests/ { minimal_init = 'tests/minimal_init.lua' }"
local config_root = vim.fn.fnamemodify(vim.fn.expand("<sfile>:p"), ":h:h")
vim.opt.runtimepath:prepend(config_root)

local plenary = vim.fn.stdpath("data") .. "/lazy/plenary.nvim"
vim.opt.runtimepath:prepend(plenary)

vim.cmd("runtime plugin/plenary.vim")
