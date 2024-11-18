return {
  -- {
  --   "goolord/alpha-nvim",
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   config = function()
  --     local MiniIcons = require("mini.icons")
  --     local dashboard = require("alpha.themes.dashboard")
  --
  -- -- stylua: ignore
  --   dashboard.section.buttons.val = {
  --     dashboard.button("f", " " .. " Find file",       "<cmd> lua require('telescope.builtin').find_files() <cr>"),
  --     -- dashboard.button("n", " " .. " New file",        "<cmd> ene <BAR> startinsert <cr>"),
  --     dashboard.button("r", " " .. " Recent files",    "<cmd> lua require('telescope.builtin').oldfiles() <cr>"),
  --     dashboard.button("g", " " .. " Find text",       "<cmd> lua require('telescope.builtin').live_grep() <cr>"),
  --     dashboard.button("c", " " .. " Config",          "<cmd> lua require('telescope.builtin').find_files({ cwd = '~/.config/nvim', resume = true }) <cr>"),
  --     dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
  --     dashboard.button("x", " " .. " Lazy Extras",     "<cmd> LazyExtras <cr>"),
  --     dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
  --     dashboard.button("z", MiniIcons.get('filetype', 'git') .. " LazyGit",  "<cmd> lua LazyVim.lazygit( { cwd = LazyVim.root.git() }) <cr>"),
  --     dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
  --   }
  --
  --     -- require'alpha'.setup(require'alpha.themes.startify'.config)
  --     require("alpha").setup(dashboard.config)
  --   end,
  -- },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          keys = {
            {
              icon = " ",
              key = "f",
              desc = "Find File",
              action = ":lua Snacks.dashboard.pick('files')",
            },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            {
              icon = " ",
              key = "g",
              desc = "Find Text",
              action = ":lua Snacks.dashboard.pick('live_grep')",
            },
            {
              icon = " ",
              key = "r",
              desc = "Recent Files",
              action = ":lua Snacks.dashboard.pick('oldfiles')",
            },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            {
              icon = "󰒲 ",
              key = "l",
              desc = "Lazy",
              action = ":Lazy",
              enabled = package.loaded.lazy,
            },
            {
              icon = " ",
              key = "x",
              desc = "Lazy Extras",
              action = ":LazyExtras",
              enabled = package.loaded.lazy,
            },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {

          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          {
            icon = " ",
            title = "Recent Files",
            section = "recent_files",
            indent = 2,
            padding = 1,
          },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
