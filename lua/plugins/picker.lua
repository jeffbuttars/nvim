return {
  {
    "folke/snacks.nvim",

    -- stylua: ignore
    keys = {
      {
        "<leader><space>",
        function()
          local Snacks = require("snacks")
          if Snacks.git.get_root() then
            Snacks.picker.git_files({untracked = false, submodules = true})
            return
          end

          Snacks.picker.files({cwd = true})
        end,
        desc = "Pick from Git or CWD",
        mode = {"n"},
      },
    },
    opts = {
      explorer = {
        -- your explorer picker configuration comes here
        -- or leave it empty to use the default settings
        -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#explorer
        trash = true,
      },
      picker = {
        sources = {
          explorer = {
            jump = { close = true },
            auto_close = true,
            -- your explorer picker configuration comes here
            -- or leave it empty to use the default settings
            -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#explorer
            layout = {
              preset = "sidebar",
              preview = { enabled = true, main = true }, -- show preview in main window
              layout = {
                width = vim.o.columns / 4,
              },
            },

            win = {
              list = {
                wo = {
                  number = true,
                  relativenumber = true,
                },
              },
            },
          },
        },
      },
    },
  },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   opts = {
  --     event_handlers = {
  --       {
  --         event = "file_opened",
  --         handler = function(_)
  --           require("neo-tree.command").execute({ action = "close" })
  --         end,
  --       },
  --     },
  --     -- buffers = {
  --     --
  --     --   follow_current_file = {
  --     --     enabled = true,
  --     --     leave_dirs_open = false,
  --     --   },
  --     -- },
  --     -- filesystem = {
  --     --   follow_current_file = {
  --     --     enabled = true,
  --     --     leave_dirs_open = false,
  --     --   },
  --     -- },
  --   },
  -- },
}
