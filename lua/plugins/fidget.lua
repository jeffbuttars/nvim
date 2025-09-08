return {
  {
    "j-hui/fidget.nvim",
    -- tag = "v1.6.1", -- Make sure to update this to something recent!
    opts = {
      progress = {
        -- options
        display = {
          render_limit = 16,
          done_ttl = 5,
        },
      },
      notification = {
        window = {
          align = "top",
        },
      },
    },

    init = function()
      local wk = require("which-key")

      wk.add({
        {
          "<leader>ut",
          require("fidget.notification").suppress,
          mode = { "n", "c" },
          desc = "Fidget Suppress Toggle",
        },
      })
    end,
  },
}
