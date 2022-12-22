
-- [[ Setting options ]]
-- See `:help vim.o`

-- enable early
-- https://neovim.io/doc/user/filetype.html
-- Turn on filetype based plugin loading as well as filetype specific indent
vim.cmd [[filetype plugin indent on]]

-- Don't redraw screen when executing macros                                                                             │
-- set lazyredraw
vim.opt.lazyredraw = true

-- keep 10000 lines of command line history
vim.opt.history = 10000


-- CursorHold updatime time in ms
vim.opt.updatetime = 250

vim.opt.switchbuf = "split"

-- Enable persistent undo
-- and tell vim were to store the undo files.
vim.opt.undofile = true
--vim.opt.undodir=~/.config/nvim/undos
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undolevels=1000
vim.opt.undoreload=10000

-- Enable break indent
vim.opt.breakindent = true
vim.opt.smartindent = true

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shortmess = "aotIc"
vim.opt.wildmode = "list:longest"
vim.opt.wildignore = '*.swp,*.bak,*.pyc,*.pyo,*.class,*.6,.git,.hg,.svn,*.o,*.a,*.so,*.obj,*.lib'

-- If you want to ALWAYS use the clipboard for ALL operations (as opposed
-- to interacting with the '+' and/or '*' registers explicitly), set the
-- following option:
-- vim.cmd[[set clipboard+=unnamed]]
-- vim.cmd[[set clipboard+=unnamedplus]]
vim.opt.clipboard:append {"unnamed"}
vim.opt.clipboard:append {"unnamedplus"}

-- I like to have my files automatically reloaded if they change on disk
vim.opt.autoread = true

-- vim.opt.guicursor = ""

-- Relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Default tab setup sucks, use spaces at 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.textwidth = 100
vim.opt.shiftround = true

--  The title of the window to titlestring
vim.opt.title = true

vim.wo.signcolumn = 'yes'

vim.opt.inccommand = 'nosplit'

-- Split vertical to the right by default
vim.opt.splitright = true

-- Split horizontal below by default
vim.opt.splitbelow = true

-- ====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======
-- vim.cmd[[set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"]]
-- vim.opt.listchars = {tab = '»', trail = '·', nbsp = '~'}
-- vim.opt.listchars = {tab = '»'}
vim.opt.listchars = {trail = '·', nbsp = '~', tab = '»»'}
vim.opt.list = true


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
    "algorithm:histogram"
}

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"

vim.g.mapleader = " "
