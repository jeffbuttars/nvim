return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = { "amansingh-afk/milli.nvim" },
    opts = function()
      local splash = require("milli").load({ splash = "vibecat" })

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
      }
    end,
    config = function(_, opts)
      require("milli").snacks({ splash = "vibecat", loop = true })
      require("snacks").setup(opts)
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
