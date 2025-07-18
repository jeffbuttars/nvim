vim.g.color_light = "catppuccin-latte"
vim.g.color_dark = "catppuccin-mocha"
-- vim.g.color_light = "everforest"
-- vim.g.color_dark = "everforest"

return {
  { "roobert/tailwindcss-colorizer-cmp.nvim", config = true, lazy = true, enabled = false },

  { "folke/lsp-colors.nvim" },

  { "rose-pine/neovim", name = "rose-pine" },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = vim.g.color_light,
      colorscheme = vim.g.color_dark,
      -- colorscheme = "evangelion",
    },
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinNew" },
  },
  {
    "alexxGmZ/e-ink.nvim",
    -- priority = 1000,
    -- config = function ()
    --  require("e-ink").setup()
    --  vim.cmd.colorscheme "e-ink"

    -- choose light mode or dark mode
    -- -- vim.opt.background = "dark"
    -- -- vim.opt.background = "light"
    -- --
    -- -- or do
    -- -- :set background=dark
    -- -- :set background=light
    --  end
    --  }
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
}
