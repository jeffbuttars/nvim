
-- Load our paq ages.
require("local/paq_ages")

-- enable early
-- https://neovim.io/doc/user/filetype.html
-- Turn on filetype based plugin loading as well as filetype specific indent

vim.cmd("filetype plugin indent on")

vim.cmd("set history=10000")  -- keep 10000 lines of command line history
