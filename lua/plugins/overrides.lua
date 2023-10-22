return {
  {
    -- Disable the floating command line input,
    -- Use the bottom line
    "folke/noice.nvim",
    enabled = false,
    opts = function(_, opts)
      opts.cmdline = { view = "cmdline" }
      opts.presets.bottom_search = true -- use a classic bottom cmdline for search
      opts.presets.command_palette = true -- position the cmdline and popupmenu together
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults.mappings.i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
      }
      opts.defaults.mappings.n = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
      }
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.wo.number = true
            vim.wo.relativenumber = true
          end,
        },
        {
          event = "file_opened",
          handler = function()
            require("neo-tree").close_all()
          end,
        },
      },
    },
  },
}
