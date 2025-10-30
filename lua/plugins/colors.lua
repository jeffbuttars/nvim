vim.g.color_light = "catppuccin-latte"
vim.g.color_dark = "catppuccin-mocha"

return {
  { "roobert/tailwindcss-colorizer-cmp.nvim", config = true, lazy = true, enabled = false },

  { "folke/lsp-colors.nvim" },

  { "rose-pine/neovim", name = "rose-pine" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  { "rebelot/kanagawa.nvim" },
  { "EdenEast/nightfox.nvim" },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
  { "shaunsingh/nord.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = vim.g.color_light,
      colorscheme = vim.g.color_dark,
    },
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinNew" },
  },
  {
    "alexxGmZ/e-ink.nvim",
  },
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_background = "hard"
      -- vim.g.everforest_background = "soft"
      -- vim.g.everforest_background = "medium"

      -- choose light mode or dark mode
      -- -- vim.opt.background = "dark"
      -- -- vim.opt.background = "light"
    end,
  },
  {
    "vertexE/synth.nvim",
  },
}
