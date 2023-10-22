-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.g.python3_host_prog = "~/.venv/bin/python3"

opts = function()
  local plugin = require("lazy.core.config").plugins["conform.nvim"]
  if plugin.config ~= M.setup then
    Util.error({
      "Don't set `plugin.config` for `conform.nvim`.\n",
      "This will break **LazyVim** formatting.\n",
      "Please refer to the docs at https://www.lazyvim.org/plugins/formatting",
    }, { title = "LazyVim" })
  end
  ---@class ConformOpts
  local opts = {
    ---@type table<string, conform.FormatterUnit[]>
    formatters_by_ft = {
      python = { "ruff_fix", "black" },
      htmldjango = { "djlint" },
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
      -- Use the "*" filetype to run formatters on all filetypes.
      ["*"] = { "codespell" },
      -- Use the "_" filetype to run formatters on filetypes that don't
      -- have other formatters configured.
      ["_"] = { "trim_whitespace" },
    },
  }
  return opts
end
