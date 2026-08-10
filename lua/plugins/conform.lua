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
        javascript = { "prettier", "trim_whitespace" },
        typescript = { "prettier", "trim_whitespace" },
        svelte = { "prettier", "trim_whitespace" },
        -- go = { "golangci-lint", "golines", "gofumpt" },
        -- AIDEV-NOTE: typos moved to nvim-lint (report-only); as a conform formatter it rewrote
        -- identifiers/strings file-locally, silently breaking cross-file references.
      },
    },
  },
}
