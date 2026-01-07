local Snacks = require("snacks")

return {
  {
    "folke/snacks.nvim",
    opts = {
      -- lazygit = {
      --   configure = true,
      --   theme_path = vim.fs.normalize("~/.config/lazygit/catpuccin/themes/macchiato/rosewater.yml"),
      -- },
      --     animate = {
      --       enabled = true,
      --       -- ---@class snacks.animate.Config
      --       -- ---@field easing? snacks.animate.easing|snacks.animate.easing.Fn
      --       -- {
      --       --   ---@type snacks.animate.Duration|number
      --       --   duration = 20, -- ms per step
      --       --   easing = "linear",
      --       --   fps = 60, -- frames per second. Global setting for all animations
      --       -- }
      --     },
      --     image = {
      --       enabled = true,
      --     },
      zen = {
        win = {
          width = 140,
        },
        toggles = {
          git_signs = true,
          mini_diff_signs = true,
          dim = false,
          -- dim = {
          --   scope = {
          --     min_size = 10,
          --     max_size = 100,
          --     siblings = true,
          --   },
          -- },
        },
      },
      dashboard = {
        preset = {
          header = [[
          ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
          ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
          ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
          ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
          ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
          ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        },

        sections = {
          -- { section = "header" },
          -- {
          --   pane = 2,
          --   section = "terminal",
          --   cmd = "colorscript -e square",
          --   height = 5,
          --   padding = 1,
          -- },
          { section = "keys", gap = 1, padding = 1 },
          -- {
          --   pane = 2,
          --   icon = " ",
          --   title = "Recent Files",
          --   section = "recent_files",
          --   indent = 2,
          --   padding = 1,
          -- },
          -- {
          --   pane = 2,
          --   icon = " ",
          --   title = "Projects",
          --   section = "projects",
          --   indent = 2,
          --   padding = 1,
          -- },

          {
            -- icon = " ",
            -- title = "Git Status",
            pane = 2,
            height = 7,
            section = "terminal",
            cmd = "echo ''",
            indent = 3,
            enabled = true,
          },
          {
            pane = 2,
            -- icon = "  ",
            title = "",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "echo -n ' '; git config --get remote.origin.url; git branch --list --color --sort=refname --sort=-committerdate | head -n 3; echo ''; git status --short --branch --renames",
            padding = 1,
            ttl = 5 * 60,
            indent = 1,
          },
          { section = "startup" },
        },
      },
    },
  },
}
