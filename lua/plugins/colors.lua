return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-latte",
    },
  },
  { "roobert/tailwindcss-colorizer-cmp.nvim", config = true, lazy = true },

  {
    "folke/lsp-colors.nvim",
  },
  {
    "brenoprata10/nvim-highlight-colors",
    opts = function(_, opts)
      -- require("nvim-highlight-colors").setup()
      opts.render = "virtual"
      opts.enable_tailwind = true
    end,
  },
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   config = function(_, opts)
  --     require("colorizer").setup()
  --     return opts
  --   end,
  -- },
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
