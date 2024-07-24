return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local MiniIcons = require("mini.icons")
    local dashboard = require("alpha.themes.dashboard")

  -- stylua: ignore
    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file",       "<cmd> lua require('fzf-lua').files() <cr>"),
      -- dashboard.button("n", " " .. " New file",        "<cmd> ene <BAR> startinsert <cr>"),
      dashboard.button("r", " " .. " Recent files",    "<cmd> lua require('fzf-lua').oldfiles() <cr>"),
      dashboard.button("g", " " .. " Find text",       "<cmd> lua require('fzf-lua').live_grep() <cr>"),
      dashboard.button("c", " " .. " Config",          "<cmd> lua require('fzf-lua').files({ cwd = '~/.config/nvim', resume = true }) <cr>"),
      dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
      dashboard.button("x", " " .. " Lazy Extras",     "<cmd> LazyExtras <cr>"),
      dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
      dashboard.button("z", MiniIcons.get('filetype', 'git') .. " LazyGit",  "<cmd> lua LazyVim.lazygit( { cwd = LazyVim.root.git() }) <cr>"),
      dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
    }

    -- require'alpha'.setup(require'alpha.themes.startify'.config)
    require("alpha").setup(dashboard.config)
  end,
}
