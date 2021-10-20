-- https://github.com/kyazdani42/nvim-tree.lua
-- following options are the default

vim.cmd('let g:nvim_tree_disable_window_picker = 1') -- 0 by default, will disable the window picker.
vim.cmd('let g:nvim_tree_quit_on_open = 1') -- 0 by default, closes the tree when you open a file

-- 0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
-- vim.cmd('let g:nvim_tree_respect_buf_cwd = 1')

-- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.cmd('let g:nvim_tree_git_hl = 1')

local tree_cb = require"nvim-tree.config".nvim_tree_callback

require"nvim-tree".setup {
  -- disables netrw completely
  disable_netrw       = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {},
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close          = true,
  -- opens the tree when changing/opening a new tab if the tree wasn"t previously opened
  open_on_tab         = false,

  update_to_buf_dir   = {
  -- hijacks new directory buffers when they are opened.
      -- enable the feature
      enable = true,
      -- allow to open the tree if it was previously closed
      auto_open = true,
  },

  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = true,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd          = false,
  diagnostics = {
      -- show lsp diagnostics in the signcolumn
      enable = true,
      icons = {
          -- hint = "",
          hint = "",
          -- info = "",
          info = "",
          -- warning = "",
          warning = "",
          -- error = "",
          error = "",
      }
  },
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = true,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = true,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    -- ignore_list = { ".py.orig", ".py,cover", "__pycache__" }
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`
    width = 64,
    -- side of the tree, can be one of "left" | "right" | "top" | "bottom"
    side = "left",
    -- if true the tree will resize itself after opening a file
    auto_resize = true,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {}
    }
  }
}

vim.api.nvim_set_keymap("n", "<C-d>", ":NvimTreeToggle<CR>", {})
