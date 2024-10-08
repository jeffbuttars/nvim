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
  { "danwlker/primeppuccin", priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-latte",
      -- colorscheme = "evangelion",
    },
  },
  { "roobert/tailwindcss-colorizer-cmp.nvim", config = true, lazy = true, enabled = false },

  {
    "folke/lsp-colors.nvim",
  },
  -- {
  --   "brenoprata10/nvim-highlight-colors",
  --   opts = function(_, opts)
  --     -- require("nvim-highlight-colors").setup()
  --     opts.render = "virtual"
  --     opts.enable_tailwind = true
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
  -- {
  --   "nvim-zh/colorful-winsep.nvim",
  --   config = true,
  --   event = { "WinNew" },
  -- },
}
