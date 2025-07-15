return {
  "williamboman/mason.nvim",

  opts_extend = { "ensure_installed" },
  opts = {
    ensure_installed = {
      "codespell",
      "cueimports",
      "cuelsp",
      "golines",
      "gomodifytags",
      "golangci-lint",
      "htmlbeautifier",
      "htmlhint",
      "html-lsp",
      "jedi-language-server",
      "mypy",
      "shfmt",
      "standardjs",
      "stylua",
      "templ",
      "typos",
      "markdown-toc",
      "markdownlint-cli2",
      "prettier",
      "ruff",
    },
  },
}
