return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        -- "*" runs on all filetypes, in addition to any filetype-specific linters.
        ["*"] = { "typos" },
      },
    },
  },
  -- {
  --   "mfussenegger/nvim-lint",
  --   event = { "BufWritePost", "BufReadPost", "InsertLeave" },
  --   config = function()
  --     require("lint").linters_by_ft = {
  --       go = { "golangcilint" }, -- Configure golangcilint for Go files
  --     }
  --   end,
  -- },
}
