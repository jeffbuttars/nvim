vim.g.color_light = "catppuccin-latte"
vim.g.color_dark = "catppuccin-macchiato"

return {
  {
    "xero/evangelion.nvim",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd("colorscheme evangelion")
    -- end,
  },
  { "rose-pine/neovim", name = "rose-pine" },
  -- { "danwlker/primeppuccin", priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = vim.g.color_light,
      -- colorscheme = "evangelion",
    },
  },
  { "roobert/tailwindcss-colorizer-cmp.nvim", config = true, lazy = true, enabled = false },

  {
    "folke/lsp-colors.nvim",
    -- local colors = require("catppuccin.palettes").get_palette()
    -- local colors = require("catppuccin.palettes").get_palette(vim.o.background)
    -- require("lsp-colors").setup({ mode = "virtual", colors = colors })
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
}
