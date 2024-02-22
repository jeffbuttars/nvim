return {
  {
    "neovim/nvim-lspconfig",
    -- init = function()
    --   --   require("lspconfig").typos_lsp.setup({})
    --   --
    --   local keys = require("lazyvim.plugins.lsp.keymaps").get()
    --   keys[#keys + 1] = {
    --     "K",
    --     function()
    --       local result = vim.lsp.buf.hover()
    --       vim.print("HOVER Result:" .. result)
    --     end,
    --     desc = "Hover",
    --   }
    -- end,
    opts = {
      diagnostics = {
        virtual_text = false,
      },

      servers = {
        typos_lsp = {},
        pyright = false,
        pylsp = {
          settings = {
            formatCommand = { "black" },
            pylsp = {
              plugins = {
                jedi_completion = {
                  enabled = true,
                  fuzzy = true,
                },
                pylsp_mypy = {
                  enabled = true,
                },
                ruff = {
                  enabled = true,
                  config = "~/pyproject.toml",
                  -- extendSelect = {"I"},
                },
                black = {
                  enabled = true,
                  lineLength = 99,
                  -- preview = true
                },
                isort = {
                  enabled = true,
                  profile = "black",
                },
                autopep8 = {
                  enabled = false,
                },
                pyflakes = {
                  enabled = false,
                },
                pycodestyle = {
                  enabled = false,
                  ignore = { "W391" },
                  maxLineLength = 100,
                },
                rope_autoimport = {
                  enabled = false,
                },
                yapf = {
                  enabled = false,
                },
                mccabe = {
                  enabled = false,
                },
              },
            },
          },
        },
      },
    },
  },
}
