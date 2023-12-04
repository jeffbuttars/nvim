local util = require("conform.util")

return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = { "ruff_fix", "black" },
        ["htmldjango"] = { "djlint" },
        html = { "htmlbeautifier" },
        -- For some reason this version creates an empty file
        -- python = { "ruff_fix", "fuff_format", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "standardjs", "prettierd", "prettier" } },
        css = { "stylelint" },
        bash = { { "shfmt", "beautysh" } },
        sh = { { "shfmt", "beautysh" } },
        json = { "jq" },
        yaml = { "yamlfix" },
        c = { "clang_format" },
        go = { { "gofumpt", "gofmt" } },
        -- Use the "*" filetype to run formatters on all filetypes.
        ["*"] = { "trim_whitespace", "typos", "codespell" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = { "trim_whitespace" },
      },
    },
  },
}
