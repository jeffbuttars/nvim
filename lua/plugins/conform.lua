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
        -- ["htmldjango"] = { "djlint" },
        -- Use a sub-list to run only the first available formatter
        -- javascript = { "standardjs", "prettierd", "prettier", stop_after_first = true },
        javascript = { "prettier" },
        typescript = { "prettier" },
        svelte = { "prettier" },
        -- css = { "stylelint", stop_after_first = true },
        -- bash = { "shfmt", "beautysh" },
        -- sh = { "shfmt", "beautysh" },
        -- json = { "jq", "prettier", stop_after_first = true},
        -- yaml = { "yamlfix", stop_after_first = true },
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
