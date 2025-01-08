local wk = require("which-key")
wk.add({ mode = "n", { "<leader>fo", "<cmd>Oil --float<cr><esc>", desc = "Oil" } })

return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      default_file_explorer = false,
      columns = {
        "icon",
        "permissions",
        "size",
        -- "mtime",
      },
      -- -- Window-local options to use for oil buffers
      win_options = {
        --   wrap = false,
        -- signcolumn = "yes",
        cursorcolumn = true,
        --   foldcolumn = "0",
        --   spell = false,
        --   list = false,
        --   conceallevel = 3,
        --   concealcursor = "nvic",
      },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  },
}
