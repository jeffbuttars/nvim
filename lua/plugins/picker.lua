local Snacks = require("snacks")
local wk = require("which-key")

wk.add({ mode = "n", { "<leader>fo", "<cmd>Oil --float<cr><esc>", desc = "Oil" } })

return {
  {
    "folke/snacks.nvim",
    opts = {
      -- explorer = {
      -- your explorer picker configuration comes here
      -- or leave it empty to use the default settings
      -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#explorer
      -- jump = { close = true },
      -- auto_close = true,
      -- },
      picker = {
        sources = {
          explorer = {
            win = {
              list = {
                wo = {
                  number = true,
                  relativenumber = true,
                },
              },
            },
            -- your explorer picker configuration comes here
            -- or leave it empty to use the default settings
            -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#explorer
            jump = { close = true },
            auto_close = true,
            -- layout = { preset = "vscode"},
            -- layout = { preset = "dropdown"},
            -- layout = { preset = "vertical"},
            layout = {
              preset = "sidebar",
              preview = { enabled = false, main = true }, -- show preview in main window
              layout = {
                width = vim.o.columns / 4,
              },
            },
          },
        },
      },
    },
    -- stylua: ignore
    keys = {
      {
        "<leader><space>",
        function()
          if Snacks.git.get_root() then
            Snacks.picker.git_files({untracked = true})
            return
          end

          Snacks.picker.files({cwd = true})
        end,
        desc = "Find in Git repo or CWD",
        mode = {"n"},
      },
    },
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      default_file_explorer = false,
      columns = {
        "icon",
        "permissions",
        "size",
        -- "mtime",
      },
      -- -- Window-local options to use for oil buffers
      win_options = {
        --   wrap = false,
        -- signcolumn = "yes",
        cursorcolumn = true,
        --   foldcolumn = "0",
        --   spell = false,
        --   list = false,
        --   conceallevel = 3,
        --   concealcursor = "nvic",
      },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  },
}
