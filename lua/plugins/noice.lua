return {
  {
    -- Disable the floating command line input,
    -- Use the bottom line
    "folke/noice.nvim",
    enabled = true,
    opts = {
      -- cmdline = {
      --   opts = {
      --     -- Position command line into center of screen
      --     position = "50%",
      --   },
      -- },
      presets = {
        bottom_search = false,
        -- command_palette = true,
        -- long_message_to_split = true,
        -- inc_rename = true,
      },
      messages = {
        enabled = false,
      },
      routes = {
        {
          filter = {
            event = "notify",
            find = "No information available",
          },
          opts = { skip = true },
        },
        {
          view = "mini",
          filter = {
            event = "msg_show",
            kind = { "", "echo", "echomsg" },
          },
        },
        {
          view = "mini",
          filter = {
            event = "notify",
          },
        },
      },

      -- views = {
      --   cmdline_popup = {
      --     position = {
      --       row = "50%",
      --       col = "50%",
      --     },
      --     --   --   size = {
      --     --   --     width = 60,
      --     --   --     height = "auto",
      --     --   --   },
      --   },
      --   popupmenu = {
      --     relative = "editor",
      --     position = {
      --       row = "50%",
      --       col = "50%",
      --       --       "55%",
      --       --       -- row = 8,
      --       --       -- col = "50%",
      --     },
      --     --     -- size = {
      --     --     --   width = 60,
      --     --     --   height = 10,
      --     --     -- },
      --     --     -- border = {
      --     --     --   style = "rounded",
      --     --     --   padding = { 0, 1 },
      --     --     -- },
      --     --     -- win_options = {
      --     --     --   winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      --     --     -- },
      --   },
      -- },
    },
  },
}
