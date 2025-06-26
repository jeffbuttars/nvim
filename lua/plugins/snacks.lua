local Snacks = require("snacks")
-- Setup tagfunc to work with lsp for ctags style tag based navigation with goto definition
vim.opt.tagfunc = Snacks.picker.lsp_defenitions
-- vim.o.tagfunc = "v:lua.vim.lsp.tagfunc"
-- vim.cmd("set tagfunc=v:lua.vim.lsp.tagfunc")

return {
  {
    "folke/snacks.nvim",
    opts = {
      -- indent = {
      --   enabled = false,
      -- },
      animate = {
        enabled = true,
        -- ---@class snacks.animate.Config
        -- ---@field easing? snacks.animate.easing|snacks.animate.easing.Fn
        -- {
        --   ---@type snacks.animate.Duration|number
        --   duration = 20, -- ms per step
        --   easing = "linear",
        --   fps = 60, -- frames per second. Global setting for all animations
        -- }
      },
      image = {
        enabled = true,
      },
      zen = {
        width = 120,
      },
    },
  },
}
