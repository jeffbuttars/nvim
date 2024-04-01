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
    opts = function(_, opts)
      -- opts.diagnostics.virtual_text = false

      opts.servers = {
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
      }

      -- local lspconfig = require("lspconfig")
      -- local configs = require("lspconfig/configs")
      --
      -- if not configs.golangcilsp then
      --   configs.golangcilsp = {
      --     default_config = {
      --       cmd = { "golangci-lint-langserver" },
      --       root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
      --       init_options = {
      --         command = {
      --           "golangci-lint",
      --           "run",
      --           "--enable-all",
      --           "--disable",
      --           "lll",
      --           "--out-format",
      --           "json",
      --           "--issues-exit-code=1",
      --         },
      --       },
      --     },
      --   }
      -- end
      --
      -- lspconfig.golangci_lint_ls.setup({
      --   filetypes = { "go", "gomod" },
      -- })
    end,
  },
}
