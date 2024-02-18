return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-latte",
    },
  },
  { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },

  {
    "folke/lsp-colors.nvim",
  },
  {
    "brenoprata10/nvim-highlight-colors",
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function(_, opts)
      require("colorizer").setup()
      return opts
    end,
  },
  {
    "rasulomaroff/reactive.nvim",
    opts = {
      load = { "catppuccin-latte-cursor", "latte" },
      builtin = {
        --   cursorline = true,
        --   cursor = true,
        --
        modemsg = true,
      },
    },
  },
}
