local wk = require("which-key")
local MiniIcons = require("mini.icons")

return {
  {
    "carbon-steel/detour.nvim",
    config = function()
      -- A keymap for selecting a terminal buffer to open in a popup
      wk.add({
        "<leader>wD",
        require("detour").Detour,
        desc = "Detour Window",
        icon = MiniIcons.get("os", "windows"),
      })
    end,
  },
}
