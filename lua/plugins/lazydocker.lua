return {
  -- lazydocker.nvim
  -- go install github.com/jesseduffield/lazydocker@latest
  {
    "mgierada/lazydocker.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    config = function()
      require("lazydocker").setup({})
    end,
    event = "BufRead",
    keys = {
      {
        "<leader>d",
        function()
          require("lazydocker").open()
        end,
        desc = "Lazydocker",
      },
    },
  },
}
