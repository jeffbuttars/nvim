return {
  {
    "https://codeberg.org/pr0x/DoubleTap.git",
    -- This tells lazy.nvim it's a local plugin, not from GitHub
    name = "DoubleTap",
    dir = "~/Dev/DoubleTap/",
    enabled = true,

    opts = {
      --   debug = true,
      -- Enable stepping over a rhs if the cursor is in front of it and a single rhs is typed
      walkout = false,
      jump_out = {
        enabled = false,
        key_spec = {
          { key = ")" },
          { key = "}" },
          { key = "]" },
        },
      },
      jump_in = {
        enabled = true,
        key_spec = {
          { key = "(", lhs = "(", rhs = ")" },
          { key = "{", lhs = "{", rhs = "}", openblock = true },
          { key = "[", lhs = "[", rhs = "]" },
        },
      },
      jump_in_or_out = {
        enabled = false,
        key_spec = {
          { key = "'", lhs = "'", rhs = "'", out_condition = { "string", "string.documentation" } },
          { key = '"', lhs = '"', rhs = '"', out_condition = { "string", "string.documentation" } },
          { key = "`", lhs = "`", rhs = "`", out_condition = { "string", "string.documentation" } },
        },
      },
      finish_line = {
        enabled = true,
        key_spec = {
          { key = ",", rhs = ",", cursor_to_end = true },
          { key = ";", rhs = ";", cursor_to_end = true },
        },
      },

      -- Enclosing/Surrounding character mappings, visually select then double tap the
      -- character to enclose the selections
      -- Add the `enabled = false` key to disable a mapping
      visual_surrounds = {
        enabled = true,
        key_spec = {
          { key = "(", lhs = "(", rhs = ")", finish_at = "l" },
          { key = ")", lhs = "(", rhs = ")", finish_at = "r" },
          { key = "{", lhs = "{", rhs = "}", finish_at = "l" },
          { key = "}", lhs = "{", rhs = "}", finish_at = "r" },
          { key = "[", lhs = "[", rhs = "]", finish_at = "l" },
          { key = "]", lhs = "[", rhs = "]", finish_at = "r" },
          { key = '"', lhs = '"', rhs = '"' },
          { key = "'", lhs = "'", rhs = "'" },
          { key = "`", lhs = "`", rhs = "`" },
        },
      },
    },
  },
}
