local Snacks = require("snacks")
local selectedSplash

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = { "amansingh-afk/milli.nvim" },

    keys = {
      {
        "<leader><space>",
        function()
          if Snacks.git.get_root() then
            Snacks.picker.git_files({ untracked = false, submodules = true })
            return
          end

          Snacks.picker.files({ cwd = true })
        end,
        desc = "Pick from Git or CWD",
        mode = { "n" },
      },
      {
        "<leader>e",
        Snacks.picker.explorer,
        desc = "Sidebar Explorer",
        mode = { "n" },
      },
      {
        "<leader>E",
        function()
          Snacks.picker.explorer({ cwd = vim.fn.expand("%:p:h") })
        end,
        desc = "Sidebar Explorer @ file's directory",
        mode = { "n" },
      },
    },

    opts = function()
      local splashes = require("milli").list()
      math.randomseed(os.time())
      selectedSplash = splashes[math.random(#splashes)]
      local splash = require("milli").load({ splash = selectedSplash })

      return {
        dashboard = {
          enabled = true,
          preset = {
            header = table.concat(splash.frames[1], "\n"),
          },
          sections = {
            { section = "header" },
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
          },
        },

        zen = {
          win = {
            width = 140,
          },
          toggles = {
            git_signs = true,
            mini_diff_signs = true,
            dim = false,
          },
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

        explorer = {
          -- your explorer picker configuration comes here
          -- or leave it empty to use the default settings
          -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#explorer
          trash = true,
        },
      }
    end,
    config = function(_, opts)
      require("milli").snacks({ splash = selectedSplash, loop = true })
      Snacks.setup(opts)
    end,
    -- dashboard = {
    --   preset = {
    --     --     -- keys = {
    --     --     --   { icon = "🌟", action = "<leader>ac", key = "a", desc = "Open Claude Code" },
    --     --     -- },
    --     --
    --     header = [[
    --         ██████╗ ██████╗  ██████╗ ██╗  ██╗
    --         ██╔══██╗██╔══██╗██╔═████╗╚██╗██╔╝
    --        ██████╔╝██████╔╝██║██╔██║ ╚███╔╝
    --        ██╔═══╝ ██╔══██╗████╔╝██║ ██╔██╗
    --         ██║     ██║  ██║╚██████╔╝██╔╝ ██╗
    --         ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝]],
    --     --     header = [[
    --     --     ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
    --     --     ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
    --     --     ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
    --     --     ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
    --     --     ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
    --     --     ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
    --     --   },
    --     --
    --     --   sections = {
    --     --     -- { section = "header" },
    --     --     -- {
    --     --     --   pane = 2,
    --     --     --   section = "terminal",
    --     --     --   cmd = "colorscript -e square",
    --     --     --   height = 5,
    --     --     --   padding = 1,
    --     --     -- },
    --     --     { section = "keys", gap = 1, padding = 1 },
    --     --     -- {
    --     --     --   pane = 2,
    --     --     --   icon = " ",
    --     --     --   title = "Recent Files",
    --     --     --   section = "recent_files",
    --     --     --   indent = 2,
    --     --     --   padding = 1,
    --     --     -- },
    --     --     -- {
    --     --     --   pane = 2,
    --     --     --   icon = " ",
    --     --     --   title = "Projects",
    --     --     --   section = "projects",
    --     --     --   indent = 2,
    --     --     --   padding = 1,
    --     --     -- },
    --     --
    --     --     {
    --     --       -- icon = " ",
    --     --       -- title = "Git Status",
    --     --       pane = 2,
    --     --       height = 7,
    --     --       section = "terminal",
    --     --       cmd = "echo ''",
    --     --       indent = 3,
    --     --       enabled = true,
    --     --     },
    --     --     {
    --     --       pane = 2,
    --     --       -- icon = "  ",
    --     --       title = "",
    --     --       section = "terminal",
    --     --       enabled = function()
    --     --         return Snacks.git.get_root() ~= nil
    --     --       end,
    --     --       cmd = "echo -n ' '; git config --get remote.origin.url; git branch --list --color --sort=refname --sort=-committerdate | head -n 3; echo ''; git status --short --branch --renames",
    --     --       padding = 1,
    --     --       ttl = 5 * 60,
    --     --       indent = 1,
    --     --     },
    --     --     { section = "startup" },
    --   },
    -- },
    -- },
  },
}
