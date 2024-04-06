return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = { virtual_text = false },

      -- servers = {
      --   typos_lsp = {},
      --   -- pylsp = {
      --   --   settings = {
      --   --     formatCommand = { "black" },
      --   --     pylsp = {
      --   --       plugins = {
      --   --         jedi_completion = {
      --   --           enabled = true,
      --   --           fuzzy = true,
      --   --         },
      --   --         pylsp_mypy = {
      --   --           enabled = true,
      --   --         },
      --   --         -- ruff = {
      --   --         --   enabled = true,
      --   --         --   config = "~/pyproject.toml",
      --   --         --   -- extendSelect = {"I"},
      --   --         -- },
      --   --         black = {
      --   --           enabled = true,
      --   --           lineLength = 99,
      --   --           -- preview = true
      --   --         },
      --   --         isort = {
      --   --           enabled = true,
      --   --           profile = "black",
      --   --         },
      --   --         autopep8 = {
      --   --           enabled = false,
      --   --         },
      --   --         pyflakes = {
      --   --           enabled = false,
      --   --         },
      --   --         pycodestyle = {
      --   --           enabled = false,
      --   --           ignore = { "W391" },
      --   --           maxLineLength = 100,
      --   --         },
      --   --         rope_autoimport = {
      --   --           enabled = false,
      --   --         },
      --   --         yapf = {
      --   --           enabled = false,
      --   --         },
      --   --         mccabe = {
      --   --           enabled = false,
      --   --         },
      --   --       },
      --   --     },
      --   --   },
      --   -- },
      -- },
    },
  },
}
