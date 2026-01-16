vim.g.color_light = "catppuccin-latte"
-- vim.g.color_dark = "catppuccin-mocha"
vim.g.color_dark = "thorn"

return {
  { "roobert/tailwindcss-colorizer-cmp.nvim", config = true, lazy = true, enabled = false },

  { "folke/lsp-colors.nvim" },

  { "rose-pine/neovim", name = "rose-pine" },
  {
    "jpwol/thorn.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- background = "warm",
      background = "cold",

      -- 'light' or 'dark' - theme defaults to vim.o.background if unset
      -- theme = "dark"
      -- theme = "light"
    },
  },
  {
    "folke/tokyonight.nvim",
    -- lazy = false,
    -- priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  { "rebelot/kanagawa.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "marko-cerovac/material.nvim" },
  { "craftzdog/solarized-osaka.nvim" },
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
  {
    "navarasu/onedark.nvim",
  },
  {
    "projekt0n/github-nvim-theme",
  },
  {

    "nvim-mini/mini.hipatterns",
    opts = {
      -- Table with highlighters (see |MiniHipatterns.config| for more details).
      -- Nothing is defined by default. Add manually for visible effect.
      highlighters = {
        hyprcolorhex = {
          pattern = "()rgba?%(%x%x%x%x%x%x%x?%x?%)()",
          group = function(_, _, data)
            local match = data.full_match
            -- Extract the first 6 hex values, ignore any beyond that (alpha channel)
            local hex = match:match(".*%((%x%x%x%x%x%x).*%)")

            return require("mini.hipatterns").compute_hex_color_group("#" .. hex)
          end,
        },
      },
    },
  },
}
