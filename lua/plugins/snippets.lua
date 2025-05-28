local gen_loader = require("mini.snippets").gen_loader

-- # Highlight groups ~
--
-- * `MiniSnippetsCurrent` - current tabstop.
-- * `MiniSnippetsCurrentReplace` - current tabstop, placeholder is to be replaced.
-- * `MiniSnippetsFinal` - special `$0` tabstop.
-- * `MiniSnippetsUnvisited` - not yet visited tabstop(s).
-- * `MiniSnippetsVisited` - visited tabstop(s).
-- vim.cmd([["hi clear MiniSnippetsUnvisited"]])
vim.api.nvim_set_hl(0, "MiniSnippetsUnvisited", {})
vim.api.nvim_set_hl(0, "MiniSnippetsCurrent", {})

return {
  "echasnovski/mini.snippets",
  opts = {
    snippets = {
      -- Load custom file with global snippets first (adjust for Windows)
      gen_loader.from_file("~/.config/nvim/snippets/global.lua"),

      -- Load snippets based on current language by reading files from
      -- "snippets/" subdirectories from 'runtimepath' directories.
      gen_loader.from_lang(),
    },
  },
}
