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
        javascript = { "prettier" },
        typescript = { "prettier" },
        svelte = { "prettier" },
        -- go = { "golangci-lint", "golines", "gofumpt" },
        -- Use the "*" filetype to run formatters on all filetypes.
        ["*"] = { "trim_whitespace", "typos" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        _ = { "trim_whitespace", "typos" },
      },
    },
  },
}
