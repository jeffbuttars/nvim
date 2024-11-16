return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = {
        sh = { "shellcheck" },
        python = { "ruff" },
        javascript = { "standardjs" },
        -- go = { "golangcilint" },
        ["*"] = { "typos", "codespell" },
      }

      -- local golangcilint = require("lint").linters.golangcilint
      -- golangcilint.args = {
      --   "run",
      --   "--out-format",
      --   "json",
      --   "--enable",
      --   "revive",
      --   function()
      --     return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
      --   end,
      -- }
    end,
  },
}
