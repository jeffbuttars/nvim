return {
  {
    -- don't mix dap-ui with debugmaster
    "rcarriga/nvim-dap-ui",
    enabled = false,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      -- Configure your debug adapters here
      -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
    end,
  },
  {
    "miroshQa/debugmaster.nvim",
    config = function()
      local dm = require("debugmaster")
      -- https://github.com/miroshQa/debugmaster.nvim
      -- make sure you don't have any other keymaps that starts with "<leader>d" to avoid delay
      vim.keymap.set({ "n", "v" }, "<leader>dm", dm.mode.toggle, { nowait = true, desc = "Debug Master" })
      -- vim.keymap.set("t", "<C-/>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
    end,
  },
}
