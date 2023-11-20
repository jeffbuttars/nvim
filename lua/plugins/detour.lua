return {
  {
    "carbon-steel/detour.nvim",
    config = function()
      -- A keymap for selecting a terminal buffer to open in a popup
      local wk = require("which-key")
      wk.register({
        ["<leader>bd"] = {
          function()
            require("detour").Detour() -- Open a detour popup
          end,
          "Detour",
        },
        -- ["<leader>bt"] = {
        --   function()
        --     require("detour").Detour() -- Open a detour popup
        --
        --     -- Switch to a blank buffer to prevent any accidental changes.
        --     -- vim.cmd.new()
        --     -- vim.bo.bufhidden = "delete"
        --
        --     require("neo-tree.command").execute({ source = "git_status", toggle = true })
        --   end,
        --   "Buffer Tree",
        -- },

        -- ["<leader>gd"] = {
        --   function()
        --     local gs = package.loaded.gitsigns
        --     require("detour").Detour() -- Open a detour popup
        --
        --     -- Switch to a blank buffer to prevent any accidental changes.
        --     -- vim.cmd.new()
        --     vim.bo.bufhidden = "delete"
        --
        --     gs.diffthis("~")
        --   end,
        --   " Diffthis",
        -- },
      })
    end,
  },
}
