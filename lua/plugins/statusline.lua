local icons = LazyVim.config.icons

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections = opts.sections or {}
    opts.sections.lualine_x = opts.sections.lualine_x or {}

    opts.sections.lualine_c = {
      LazyVim.lualine.root_dir(),
      {
        "diagnostics",
        symbols = {
          error = icons.diagnostics.Error,
          warn = icons.diagnostics.Warn,
          info = icons.diagnostics.Info,
          hint = icons.diagnostics.Hint,
        },
      },
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      { LazyVim.lualine.pretty_path({ length = 0 }) },
    }

    table.insert(opts.sections.lualine_x, 1, {
      function()
        return require("sidekick.nes").enabled and "NES" or ""
      end,
      color = function()
        return require("sidekick.nes").enabled and "Title"
          or { cterm = "strikethrough", gui = "strikethrough" }
      end,
      cond = function()
        local status = require("sidekick.status")
        return status.get() ~= nil
      end,
      separator = "",
      -- enabled = " ",
      --           sleep = " ",
      --           disabled = "",
      --           warning = " ",
      --           unknown = " "icon = "",
      -- icon = function()
      --   return require("sidekick.nes").enabled and "" or ""
      -- end,
      --   return require("sidekick.nes").enabled and "" or "❌"
      --   -- return require("sidekick.nes").enabled and { fg = "green" } or { fg = "orange" }
      -- end,
    })
  end,
}
