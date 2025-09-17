return {
  "neovim/nvim-lspconfig",
  --
  opts = {
    -- diagnostics = { virtual_text = false, float = { border = "rounded" } },
    -- diagnostics = { virtual_text = false },
    diagnostics = {
      -- virtual_text = false,
      float = { border = "rounded" },
      --       -- virtual_text = {
      --       --   spacing = 0,
      --       --   source = "if_many",
      --       --   prefix = "icons",
      --       -- },
    },
    inlay_hints = { enabled = false },
  },
}
