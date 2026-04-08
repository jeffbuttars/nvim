local Snacks = require("snacks")

return {
  {
    "folke/snacks.nvim",

    -- stylua: ignore
    keys = {
      {
        "<leader><space>",
        function()
          if Snacks.git.get_root() then
            Snacks.picker.git_files({untracked = false, submodules = true})
            return
          end

          Snacks.picker.files({cwd = true})
        end,
        desc = "Pick from Git or CWD",
        mode = {"n"},
      },
      {
        "<leader>e",
        Snacks.picker.explorer,
        desc = "Sidebar Explorer",
        mode = {"n"},
      },
      {
        "<leader>E",
        function()
          Snacks.picker.explorer({ cwd = vim.fn.expand("%:p:h") })
        end,
        desc = "Sidebar Explorer @ file's directory",
        mode = {"n"},
      }
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
            enabled = true,
            jump = { close = true },
            auto_close = true,
            -- your explorer picker configuration comes here
            -- or leave it empty to use the default settings
            -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#explorer
            layout = {
              -- preset = "vertical",
              -- preset = "vscode",
              preset = "sidebar",
              preview = { enabled = true, main = true }, -- show preview in main window
              layout = {
                width = (vim.o.columns / 4) > 50 and (vim.o.columns / 4) or 50,
                -- width = vim.o.columns / 4,
                -- height = vim.o.lines - 4,
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
}
