return {
  {
    -- https://github.com/s1n7ax/nvim-window-picker
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        hint = "statusline-winbar",
      })
    end,
  },
}
