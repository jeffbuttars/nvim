return {
  {
    "ravsii/tree-sitter-d2",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    build = "make nvim-install",
  },
  {
    "terrastruct/d2-vim",
    ft = { "d2" },
    --   init = function()
    --     -- Enable/disable auto ASCII render on save (default: 1)
    --     vim.g.d2_ascii_autorender = 1
    --
    --     -- Customize the ASCII render command (default: "d2")
    --     vim.g.d2_ascii_command = "d2"
    --
    --     -- Set preview window width for vertical split (default: half screen)
    --     vim.g.d2_ascii_preview_width = vim.api.nvim_win_get_width(0) / 2
    --
    --     -- Set ASCII mode: "extended" (Unicode) or "standard" (basic ASCII)
    --     vim.g.d2_ascii_mode = "extended"
    --   end,
  },
}
