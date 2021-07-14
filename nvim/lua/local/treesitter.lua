-- https://github.com/nvim-treesitter/nvim-treesitter

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "python" },  -- list of language that will be disabled
  },
  incremental_selection = {
    enable = false,
    -- keymaps = {
    --   init_selection = "gnn",
    --   node_incremental = "grn",
    --   scope_incremental = "grc",
    --   node_decremental = "grm",
    -- },
  },
  indent = {
    enable = false
  },
--   playground = {
--     enable = false,
--     disable = {},
--     updatetime = 50, -- Debounced time for highlighting nodes in the playground from source code
--     persist_queries = false -- Whether the query persists across vim sessions
--   },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  }
}
