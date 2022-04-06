-- https://github.com/kyazdani42/nvim-tree.lua

local my_signs = require("local.utils").signs
local actions = require('telescope.actions')

-- 0 by default, will enable file highlight for git attributes (can be used without the icons).
-- vim.cmd('let g:nvim_tree_icons = 1')
vim.cmd('let g:nvim_tree_git_hl = 1')

vim.api.nvim_set_keymap("n", "<C-d>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

require'nvim-tree'.setup {
  -- disables netrw completely
  disable_netrw       = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {},
  -- opens the tree when changing/opening a new tab if the tree wasn"t previously opened
  open_on_tab         = false,

  actions = {
      change_dir = {
          enable = true,
          global = false,
      },
      open_file = {
          quit_on_open = true,
          resize_window = true,
          window_picker = {
              enable = false,
              chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
              exclude = {
                filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                buftype = { "nofile", "terminal", "help" },
              },
          },
      },
  },

  update_to_buf_dir = {
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
          hint = my_signs.hint,
          -- info = "",
          info = my_signs.info,
          -- warning = "",
          warning = my_signs.warning,
          -- error = "",
          error = my_signs.error,
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
    -- cmd  = nil,
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`
    width = '20%',
    -- width = 64,

    -- side of the tree, can be one of "left" | "right" | "top" | "bottom"
    side = 'left',

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

-- init.lua

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

-- require'nvim-tree'.setup {
--   disable_netrw        = false,
--   hijack_netrw         = true,
--   open_on_setup        = false,
--   ignore_buffer_on_setup = false,
--   ignore_ft_on_setup   = {},
--   auto_close           = false,
--   auto_reload_on_write = true,
--   open_on_tab          = false,
--   hijack_cursor        = false,
--   update_cwd           = false,
--   hijack_unnamed_buffer_when_opening = false,
--   hijack_directories   = {
--     enable = true,
--     auto_open = true,
--   },
--   diagnostics = {
--     enable = false,
--     icons = {
--       hint = "",
--       info = "",
--       warning = "",
--       error = "",
--     }
--   },
--   update_focused_file = {
--     enable      = false,
--     update_cwd  = false,
--     ignore_list = {}
--   },
--   system_open = {
--     cmd  = nil,
--     args = {}
--   },
--   filters = {
--     dotfiles = false,
--     custom = {}
--   },
--   git = {
--     enable = true,
--     ignore = true,
--     timeout = 500,
--   },
--   view = {
--     width = 30,
--     height = 30,
--     hide_root_folder = false,
--     side = 'left',
--     preserve_window_proportions = false,
--     mappings = {
--       custom_only = false,
--       list = {}
--     },
--     number = false,
--     relativenumber = false,
--     signcolumn = "yes"
--   },
--   trash = {
--     cmd = "trash",
--     require_confirm = true
--   },
--   actions = {
--     change_dir = {
--       enable = true,
--       global = false,
--     },
--     open_file = {
--       quit_on_open = false,
--       resize_window = false,
--       window_picker = {
--         enable = true,
--         chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
--         exclude = {
--           filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", },
--           buftype  = { "nofile", "terminal", "help", },
--         }
--       }
--     }
--   }
-- }
