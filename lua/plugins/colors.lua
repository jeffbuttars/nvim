vim.g.color_light = "catppuccin-latte"
vim.g.color_dark = "catppuccin-mocha"
-- vim.g.color_light = "everforest"
vim.g.color_dark = "everforest"

return {
  { "roobert/tailwindcss-colorizer-cmp.nvim", config = true, lazy = true, enabled = false },

  {
    "folke/lsp-colors.nvim",
    -- local colors = require("catppuccin.palettes").get_palette()
    -- local colors = require("catppuccin.palettes").get_palette(vim.o.background)
    -- require("lsp-colors").setup({ mode = "virtual", colors = colors })
  },

  -- theme stuff
  -- {
  --   "f-person/auto-dark-mode.nvim",
  --   opts = {
  --     set_dark_mode = function()
  --       vim.api.nvim_set_option_value("background", "dark", {})
  --       vim.cmd("colorscheme " .. vim.g.color_dark)
  --       vim.api.nvim_set_option_value("colorscheme", vim.g.color_dark, {})
  --     end,
  --     set_light_mode = function()
  --       vim.api.nvim_set_option_value("background", "light", {})
  --       vim.cmd("colorscheme " .. vim.g.color_light)
  --     end,
  --   },
  -- },
  {
    "xero/evangelion.nvim",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd("colorscheme evangelion")
    -- end,
  },
  { "rose-pine/neovim", name = "rose-pine" },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = vim.g.color_light,
      colorscheme = vim.g.color_dark,
      -- colorscheme = "evangelion",
    },
  },
  -- {
  --   "brenoprata10/nvim-highlight-colors",
  --   opts = function(_, opts)
  --     -- require("nvim-highlight-colors").setup()
  --     opts.render = "virtual"
  --     opts.enable_tailwind = true
  --   end,
  -- },
  -- {
  --   "rasulomaroff/reactive.nvim",
  --   opts = {
  --     load = { "catppuccin-latte-cursor", "latte" },
  --     builtin = {
  --       cursorline = true,
  --       cursor = true,
  --       modemsg = true,
  --     },
  --   },
  -- },
  -- {
  --   "nvim-zh/colorful-winsep.nvim",
  --   config = true,
  --   event = { "WinNew" },
  -- },
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
      vim.g.everforest_background = "soft"
      vim.g.everforest_background = "medium"

      -- choose light mode or dark mode
      -- -- vim.opt.background = "dark"
      -- -- vim.opt.background = "light"
    end,
  },
}
