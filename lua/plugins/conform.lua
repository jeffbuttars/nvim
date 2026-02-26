return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters = {
        yamlfix = {
          env = {
            YAMLFIX_SEQUENCE_STYLE = "block_style",
            YAMLFIX_LINE_LENGTH = "100",
            YAMLFIX_SECTION_WHITELINES = "1",
            YAMLFIX_WHITELINES = "1",
          },
        },
      },
      formatters_by_ft = {
        -- python = { "ruff_fix", "black", "isort" },
        -- ["htmldjango"] = { "djlint" },
        -- For some reason this version creates an empty file
        -- python = { "ruff_fix", "fuff_format", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { "standardjs", "prettierd", "prettier", stop_after_first = true },
        -- css = { "stylelint" },
        -- bash = { "shfmt", "beautysh" },
        -- sh = { "shfmt", "beautysh" },
        -- json = { "jq" },
        -- yaml = { "yamlfix" },
        -- c = { "clang_format" },
        go = { "golines", "goimports", "gofumpt", "gofmt", "pruner" },
        -- Use the "*" filetype to run formatters on all filetypes.
        ["*"] = { "trim_whitespace", "typos" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        _ = { "trim_whitespace", "typos" },
      },
    },
  },
}
