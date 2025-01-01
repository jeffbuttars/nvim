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
      -- "djlint",
      "markdown-toc",
      "markdownlint-cli2",
      "prettier",
      "ruff",
    },
  },
}
