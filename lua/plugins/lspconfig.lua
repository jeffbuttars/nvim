return {
  "neovim/nvim-lspconfig",

  opts = {
    -- diagnostics = { virtual_text = false, float = { border = "rounded" } },
    -- diagnostics = { virtual_text = false },
    diagnostics = {
      virtual_text = false,
      -- virtual_text = {
      --   spacing = 0,
      --   source = "if_many",
      --   prefix = "icons",
      -- },
    },
    inlay_hints = { enabled = false },
  },

  -- opts = function(_, opts)
  -- local servers = { "pyright", "basedpyright", "ruff", "ruff_lsp", ruff, lsp }
  -- local servers = {
  --   "jedi-language-server",
  --   "ruff",
  --   "ruff_lsp",
  --   opts.servers.ruff,
  --   opts.servers.lsp,
  --   "postgres_lsp",
  -- }
  -- for _, server in ipairs(servers) do
  --   opts.servers[server] = opts.servers[server] or {}
  --   opts.servers[server].enabled = server == "lsp" or server == "ruff"
  -- end

  -- opts.diagnostics = { virtual_text = false, float = { border = "rounded" } }
  -- opts.inlay_hints = { enabled = false }
  -- end,
}
