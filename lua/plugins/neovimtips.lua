return {
  "saxon1964/neovim-tips",
  version = "*", -- Only update on tagged releases
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- OPTIONAL: Choose your preferred markdown renderer (or omit for raw markdown)
    "MeanderingProgrammer/render-markdown.nvim", -- Clean rendering
    -- OR: "OXY2DEV/markview.nvim", -- Rich rendering with advanced features
  },
  opts = {
    -- OPTIONAL: Location of user defined tips (default value shown below)
    -- user_file = vim.fn.stdpath("config") .. "/neovim_tips/user_tips.md",
    --
    -- OPTIONAL: Prefix for user tips to avoid conflicts (default: "[User] ")
    -- user_tip_prefix = "[User] ",
    --
    -- OPTIONAL: Show warnings when user tips conflict with builtin (default: true)
    warn_on_conflicts = true,
    --
    -- OPTIONAL: Daily tip mode (default: 1)
    -- 0 = off, 1 = once per day, 2 = every startup
    daily_tip = 2,

    -- OPTIONAL: Bookmark symbol (default: "🌟 ")
    -- bookmark_symbol = "🌟 ",
  },
  keys = {
    -- The plugin does not provide default key mappings, only commands
    { "<leader>N", ":NeovimTips", desc = "Neovim tips", mode = { "n" } },
    { "<leader>No", ":NeovimTips<CR>", desc = "Open Tips", mode = { "n" } },
    { "<leader>Ne", ":NeovimTipsEdit<CR>", desc = "Edit your Neovim tips", mode = { "n" } },
    { "<leader>Na", ":NeovimTipsAdd<CR>", desc = "Add your Neovim tip", mode = { "n" } },
    { "<leader>Nh", ":help neovim-tips<CR>", desc = "Neovim tips help", mode = { "n" } },
    { "<leader>Nr", ":NeovimTipsRandom<CR>", desc = "Show random tip", mode = { "n" } },
    { "<leader>Np", ":NeovimTipsPdf<CR>", desc = "Open Neovim tips PDF", mode = { "n" } },
  },
}
