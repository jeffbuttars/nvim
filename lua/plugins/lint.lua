return {
  {
    "mfussenegger/nvim-lint",
    init = function()
      -- vim.print("LINTING")
      local golangcilint = require("lint").linters.golangcilint
      -- vim.print("LINTING", golangcilint.args)
      -- table.insert(golangcilint.args, #golangcilint.args, "--disable=govet.fieldalignment")
      table.insert(golangcilint.args, #golangcilint.args, "--config ~/.golangci.yml")
      -- vim.print("LINTING INIT:", golangcilint.args)
    end,

    -- opts = function(_, opts)
    --   opts.linters_by_ft = {
    --     sh = { "shellcheck" },
    --     python = { "ruff" },
    --     javascript = { "standardjs" },
    --     -- go = { "golangcilint" },
    --     ["*"] = { "typos", "codespell" },
    --   }
    -- end,
  },
}
