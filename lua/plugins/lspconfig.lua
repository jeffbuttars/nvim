-- require("lspconfig").jedi_language_server.setup({})

return {
  {
    -- https://www.lazyvim.org/extras/lang/python
    "neovim/nvim-lspconfig",

    -- init = function()
    --   require'lspconfig'.gopls.setup{}
    -- end,
    -- keys = {
    --   {
    --     "K",
    --     function()
    --       res = vim.lsp.buf.hover()
    --       vim.print("HOMVER RES:", res)
    --       return res
    --     end,
    --     desc = "Hover",
    --     mode = {"n"},
    --   },
    -- },

    opts = function(_, opts)
      -- local servers = { "pyright", "basedpyright", "ruff", "ruff_lsp", ruff, lsp }
      local servers =
        { "jedi-language-server", "ruff", "ruff_lsp", opts.servers.ruff, opts.servers.lsp }
      for _, server in ipairs(servers) do
        opts.servers[server] = opts.servers[server] or {}
        opts.servers[server].enabled = server == lsp or server == ruff
      end

      opts.diagnostics = { virtual_text = false, float = { border = "rounded" } }
      opts.inlay_hints = { enabled = false }
    end,

    --  opts = {
    --    diagnostics = { virtual_text = false, float = { border = "rounded" } },
    --    inlay_hints = { enabled = false },

    --    -- servers = {
    --    --   typos_lsp = {},
    --    --   -- pylsp = {
    --    --   --   settings = {
    --    --   --     formatCommand = { "black" },
    --    --   --     pylsp = {
    --    --   --       plugins = {
    --    --   --         jedi_completion = {
    --    --   --           enabled = true,
    --    --   --           fuzzy = true,
    --    --   --         },
    --    --   --         pylsp_mypy = {
    --    --   --           enabled = true,
    --    --   --         },
    --    --   --         -- ruff = {
    --    --   --         --   enabled = true,
    --    --   --         --   config = "~/pyproject.toml",
    --    --   --         --   -- extendSelect = {"I"},
    --    --   --         -- },
    --    --   --         black = {
    --    --   --           enabled = true,
    --    --   --           lineLength = 99,
    --    --   --           -- preview = true
    --    --   --         },
    --    --   --         isort = {
    --    --   --           enabled = true,
    --    --   --           profile = "black",
    --    --   --         },
    --    --   --         autopep8 = {
    --    --   --           enabled = false,
    --    --   --         },
    --    --   --         pyflakes = {
    --    --   --           enabled = false,
    --    --   --         },
    --    --   --         pycodestyle = {
    --    --   --           enabled = false,
    --    --   --           ignore = { "W391" },
    --    --   --           maxLineLength = 100,
    --    --   --         },
    --    --   --         rope_autoimport = {
    --    --   --           enabled = false,
    --    --   --         },
    --    --   --         yapf = {
    --    --   --           enabled = false,
    --    --   --         },
    --    --   --         mccabe = {
    --    --   --           enabled = false,
    --    --   --         },
    --    --   --       },
    --    --   --     },
    --    --   --   },
    --    --   -- },
    --    -- },
    --  },
  },
}
