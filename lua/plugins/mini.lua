return {
  {
    "echasnovski/mini.indentscope",
    version = false,

    -- MiniIndentscopeSymbol xxx guifg=#4c4f69
    opts = function(_, opts)
      -- vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#acb0b0", bg = nil })
      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", vim.api.nvim_get_hl(0, { name = "Comment" }))
      -- symbol = "∶",
      -- symbol = "┊",
      opts.draw = {
        -- delay = 500,
        animation = require("mini.indentscope").gen_animation.none(),
      }
    end,
  },
}
