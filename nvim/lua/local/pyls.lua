require'lspconfig'.pyls.setup{
  configurationSources = { "flake8", "black", "mypy", "isort"};
  plugins = {
    flake8 = { enabled = true };
    pyflakes = { enabled = false };
    pycodestyle = { enabled = false };
  }
}
