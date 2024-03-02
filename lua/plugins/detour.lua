return {
  {
    "carbon-steel/detour.nvim",
    lazy = true,
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
        -- ["<leader>gL"] = {
        --   function()
        --     local ok = require("detour").Detour() -- Open a detour popup
        --     if not ok then
        --       return
        --     end
        --
        --     vim.cmd.terminal("lazygit") -- open a terminal buffer, and run a cli command
        --     vim.bo.bufhidden = "delete" -- close the terminal when window closes
        --
        --     -- It's common for people to have `<Esc>` mapped to `<C-\><C-n>` for terminals.
        --     -- This can get in the way when interacting with TUIs.
        --     -- This maps the escape key back to itself (for this buffer) to fix this problem.
        --     vim.keymap.set("t", "<Esc>", "<Esc>", { buffer = true })
        --
        --     vim.cmd.startinsert() -- go into insert mode
        --
        --     vim.api.nvim_create_autocmd({ "TermClose" }, {
        --       buffer = vim.api.nvim_get_current_buf(),
        --       callback = function()
        --         -- This automated keypress skips for you the "[Process exited 0]" message
        --         -- that the embedded terminal shows.
        --         vim.api.nvim_feedkeys("i", "n", false)
        --       end,
        --     })
        --   end,
        --   "LazyGit in Detour",
        -- },
      })
    end,
  },
}
