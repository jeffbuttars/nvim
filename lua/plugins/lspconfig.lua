local diag_float_win = nil

return {
  "neovim/nvim-lspconfig",
  --
  opts = {
    -- diagnostics = { virtual_text = false, float = { border = "rounded" } },
    -- diagnostics = { virtual_text = false },
    diagnostics = {
      -- virtual_text = false,
      float = { border = "rounded", source = "always" },
      -- virtual_text = {
      --   spacing = 0,
      --   source = "if_many",
      --   prefix = "icons",
      -- },
    },
    inlay_hints = { enabled = false },
  },

  -- init = function()
  --   vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  --     callback = function()
  --       local diags = vim.diagnostic.get(0)
  --       if #diags == 0 then
  --         return
  --       end
  --
  --       -- Close previous float if it exists
  --       if diag_float_win ~= nil and vim.api.nvim_win_is_valid(diag_float_win) then
  --         vim.api.nvim_win_close(diag_float_win, true)
  --       end
  --
  --       -- Open new float
  --       local opts = {
  --         border = "rounded",
  --         focus = false,
  --       }
  --
  --       float_win = vim.diagnostic.open_float(opts)
  --     end,
  --     pattern = "*",
  --   })
  -- end,
}
