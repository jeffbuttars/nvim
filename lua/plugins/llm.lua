local nes = require("sidekick.nes")

local nes_toggle_maybe_update = function()
  nes.toggle()

  if nes.enabled then
    nes.update()
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    -- vim.keymap.set("i", "<c-j>", function()
    --   if not vim.lsp.inline_completion.get() then
    --     return "<c-j>"
    --   end
    -- end, { expr = true, desc = "Accept the current inline completion" })
    --
    vim.keymap.set("i", "<C-n>", function()
      vim.lsp.inline_completion.select({ count = 1 })
    end, { expr = true, desc = "Next Suggestion" })

    vim.keymap.set("i", "<C-p>", function()
      vim.lsp.inline_completion.select({ count = -1 })
    end, { expr = true, desc = "Previous Suggestion" })
  end,
})

return {
  {
    "folke/sidekick.nvim",
    opts = {
      -- add any options here
      nes = {
        enabled = true,
        diff = {
          -- inline = "words",
          show = "always",
          inline = "chars",
        },
        -- debounce = 10,
      },
      cli = {
        win = {
          -- layout = "float",
          layout = "right",
          split = {
            width = 0.5,
          },
          float = {
            width = 0.9,
            height = 0.9,
          },
        },
      },
    },
    keys = {
      {
        "<leader>an",
        function()
          nes_toggle_maybe_update()
          vim.print("Sidekick NES " .. (nes.enabled and "Enabled" or "Disabled"))
        end,
        mode = { "n" },
        expr = true,
        desc = "NES toggle",
      },
      {
        "<leader>au",
        function()
          nes.update()
          --     local enabled = nes.enabled
          --     local timer = vim.loop.new_timer()
          --
          --     nes.enable(true)
          --     nes.setup()
          --     nes.update()
          --
          --     if not enabled then
          --       timer:start(
          --         5000,
          --         0,
          --         vim.schedule_wrap(function()
          --           vim.print("Sidekick NES Disabling")
          --           nes.disable()
          --         end)
          --       )
          --     end
        end,
        mode = { "n" },
        expr = true,
        desc = "NES Update",
      },
      --
      --     -- {
      --     --   "<leader>aN",
      --     --   function()
      --     --     require("sidekick.nes").disable()
      --     --     vim.print("Sidekick NES Disabled")
      --     --   end,
      --     --   mode = { "n" },
      --     --   expr = true,
      --     --   desc = "NES Disable",
      --     -- },
      --     -- {
      --     --   "<c-tab>",
      --     --   function()
      --     --     require("sidekick.cli").nes_jump_or_apply()
      --     --   end,
      --     --   desc = "NES Jump or apply",
      --     -- },
      --     -- {
      --     --   "<leader>aa",
      --     --   function()
      --     --     require("sidekick.cli").toggle({ filter = { installed = true } })
      --     --   end,
      --     --   desc = "Sidekick Toggle CLI",
      --     -- },
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "claude", focus = true })
        end,
        desc = "Sidekick Toggle Claude",
      },
      {
        "<leader>aR",
        function()
          require("sidekick.cli").send({ name = "claude", msg = "/pr-review-diff" })
        end,
        desc = "Sidekick PR Review",
      },
      {
        "<leader>aS",
        function()
          require("sidekick.cli").send({ name = "claude", msg = "/pr-sum-desc" })
        end,
        desc = "Sidekick PR Summary",
      },
      --     -- {
      --     --   "<leader>aw",
      --     --   function()
      --     --     require("sidekick.cli").toggle({ name = "claude", focus = true, layout = "float" })
      --     --   end,
      --     --   desc = "Sidekick Toggle Floating",
      --     -- },
      --     {
      --       "<leader>ao",
      --       function()
      --         require("sidekick.cli").toggle({ name = "opencode", focus = true })
      --       end,
      --       desc = "Sidekick Toggle OpenCode",
      --     },
    },
  },
  -- {
  --   "coder/claudecode.nvim",
  --   dependencies = { "folke/snacks.nvim" },
  --   config = true,
  --   opts = {
  --     terminal = {
  --       split_side = "right",
  --       split_width_percentage = 0.5,
  --     },
  --   },
  --
  --   -- `cmd` lets lazy.nvim create command stubs that load the plugin on first use,
  --   -- so `:ClaudeCode` and friends work on a fresh start. Without it, a keys-only
  --   -- spec defers loading until a <leader>a* mapping is pressed and the commands
  --   -- would not exist yet.
  --   cmd = {
  --     "ClaudeCode",
  --     "ClaudeCodeFocus",
  --     "ClaudeCodeSelectModel",
  --     "ClaudeCodeAdd",
  --     "ClaudeCodeSend",
  --     "ClaudeCodeTreeAdd",
  --     "ClaudeCodeStatus",
  --     "ClaudeCodeStart",
  --     "ClaudeCodeStop",
  --     "ClaudeCodeOpen",
  --     "ClaudeCodeClose",
  --     "ClaudeCodeDiffAccept",
  --     "ClaudeCodeDiffDeny",
  --     "ClaudeCodeCloseAllDiffs",
  --   },
  --   keys = {
  --     -- { "<leader>a", nil, desc = "AI/Claude Code" },
  --     { "<leader>aCc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
  --     { "<leader>aCf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
  --     { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
  --     { "<leader>aCr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
  --     { "<leader>aCC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
  --     { "<leader>aCm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
  --     { "<leader>aCb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
  --     { "<leader>aCs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
  --     {
  --       "<leader>aCs",
  --       "<cmd>ClaudeCodeTreeAdd<cr>",
  --       desc = "Add file",
  --       ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_picker_list" },
  --     },
  --     -- Diff management
  --     { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
  --     { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  --   },
  -- },
  -- {
  --   -- disable the auto complete in favor of Supermaven
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   build = ":Copilot auth",
  --   event = "BufReadPost",
  --   opts = {
  --     suggestion = {
  --       enabled = false,
  --       auto_trigger = true,
  --     },
  --     panel = {
  --       enabled = true,
  --     },
  --   },
  -- },
}
