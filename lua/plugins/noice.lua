return {
  {
    --   -- Disable the floating command line input,
    --   -- Use the bottom line
    "folke/noice.nvim",
    -- enabled = false,
    opts = {
      messages = {
        enabled = false,
      },
      cmdline = {
        enabled = false,
        opts = {
          -- Position command line into center of screen
          position = "50%",
        },
      },
      --     presets = {
      --       bottom_search = false,
      --       -- command_palette = true,
      --       -- long_message_to_split = true,
      --       -- inc_rename = true,
      --     },
      routes = {
        -- https://github.com/folke/noice.nvim/blob/main/lua/noice/config/routes.lua
        {
          filter = {
            error = true,
          },
          view = "mini",
          -- opts = { skip = true },
        },
        -- {
        --   view = "mini",
        --   filter = {
        --     event = "msg_show",
        --     kind = { "", "echo", "echomsg" },
        --   },
        -- },
        -- {
        --   view = "mini",
        --   filter = {
        --     event = "notify",
        --   },
        -- },
      },
    },
  },
}
