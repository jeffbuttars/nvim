return {
  "mfussenegger/nvim-lint",
  opts = {
    linters = {
      golangcilint = {
        cmd = "golangci-lint",
        append_fname = false,
        stream = "stdout",
        args = {
          "run",
          "--output.json.path=stdout",
          -- "--output.text.path=stderr",
          "--issues-exit-code=0",
          "--show-stats=false",
          -- '--output.text.print-issued-lines=false',
          -- '--output.text.print-linter-name=false',
          function()
            return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
          end,
        },
      },
    },
  },
  -- init = function()
  --   --   -- vim.print("LINTING")
  --   local lint = require("lint")
  --   vim.print("PREV LINTING", lint.linters.golangcilint.args)
  --   lint.linters.golangcilint.args = {
  --     "run",
  --     "--output.json.path=stdout",
  --     "--output.text.path=stderr",
  --     "--issues-exit-code=0",
  --     "--show-stats=false",
  --     -- '--output.text.print-issued-lines=false',
  --     -- '--output.text.print-linter-name=false',
  --     function()
  --       return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
  --     end,
  --   }
  --
  --   vim.print("LINTING", lint.linters.golangcilint.args)
  --   -- table.insert(golangcilint.args, #golangcilint.args, "--disable=govet.fieldalignment")
  --   -- table.insert(golangcilint.args, #golangcilint.args, "--config ~/.golangci.yml")
  --   --   -- vim.print("LINTING INIT:", golangcilint.args)
  -- end,

  -- opts = function(_, opts)
  --   opts.linters.golangcilint = {
  --       cmd = "golangci-lint",
  --       append_fname = false,
  --       stream = "stdout",
  --       args = {
  --         "run",
  --         "--output.json.path=stdout",
  --         "--output.text.path=stderr",
  --         "--issues-exit-code=0",
  --         "--show-stats=false",
  --         -- '--output.text.print-issued-lines=false',
  --         -- '--output.text.print-linter-name=false',
  --         function()
  --           return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
  --         end,
  --       },
  --   }
  --   end

  --   opts.linters_by_ft = {
  -- --     sh = { "shellcheck" },
  -- --     python = { "ruff" },
  -- --     javascript = { "standardjs" },
  --     go = { "golangcilint" },
  -- --     ["*"] = { "typos", "codespell" },
  --   }
  -- end,
}
-- args = {
--     'run',
--     '--output.json.path=stdout',
--     '--issues-exit-code=0',
--     '--show-stats=false',
--     '--output.text.print-issued-lines=false',
--     '--output.text.print-linter-name=false',
--     function()
--       return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
--     end
-- },
