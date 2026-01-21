return {
  "XXiaoA/atone.nvim",
  cmd = "Atone",
  opts = {}, -- your configuration here

  keys = {
    {
      "<leader>bu",
      "<cmd>Atone toggle<cr>",
      mode = { "n" },
      desc = "Toggle undo history",
    },
    {
      "<leader>bU",
      function()
        vim.cmd("Atone open")
        vim.cmd("Atone focus")
      end,
      mode = { "n" },
      desc = "Focus history explorer",
    },
  },
}
