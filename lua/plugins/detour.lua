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

      wk.add({
        "<leader>wt",
        function()
          local popup_id = require("detour").Detour() -- open a detour popup
          if not popup_id then
            return
          end

          vim.cmd.terminal() -- open a terminal buffer
          vim.bo.bufhidden = "delete" -- close the terminal when window closes
          vim.wo[popup_id].signcolumn = "no" -- In Neovim 0.10, the signcolumn can push the TUI a bit out of window

          -- It's common for people to have `<Esc>` mapped to `<C-\><C-n>` for terminals.
          -- This can get in the way when interacting with TUIs.
          -- This maps the escape key back to itself (for this buffer) to fix this problem.
          vim.keymap.set("t", "<Esc>", "<Esc>", { buffer = true })

          vim.cmd.startinsert() -- go into insert mode

          vim.api.nvim_create_autocmd({ "TermClose" }, {
            buffer = vim.api.nvim_get_current_buf(),
            callback = function()
              -- This automated keypress skips for you the "[Process exited 0]" message
              -- that the embedded terminal shows.
              vim.api.nvim_feedkeys("i", "n", false)
            end,
          })
        end,
        desc = "Terminal Detour",
        -- icon = MiniIcons.get("os", "windows"),
      })
    end,
  },
}
