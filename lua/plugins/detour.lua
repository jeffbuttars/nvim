return {
  {
    "carbon-steel/detour.nvim",
    lazy = true,
    config = function()
      -- A keymap for selecting a terminal buffer to open in a popup
      local wk = require("which-key")
      wk.add({
        "<leader>bd",
        function()
          require("detour").Detour() -- Open a detour popup
        end,
        desc = "Detour",
      })
    end,
  },
}
