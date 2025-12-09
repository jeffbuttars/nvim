return {
  {
    "folke/sidekick.nvim",

    opts = {
      -- add any options here
      nes = {
        diff = {
          inline = "words",
        },
        debounce = 300,
      },
      cli = {
        win = {
          layout = "right",
          split = {
            -- width = math.floor(vim.api.nvim_win_get_width(0) * 0.5),
            width = math.floor(
              tonumber(vim.api.nvim_exec2("echo &columns", { output = true }).output or 0) * 0.5
            ),
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
          require("sidekick.nes").toggle()
          require("sidekick.nes").update()

          local enabled = require("sidekick.nes").enabled
          vim.print("Sidekick NES " .. (enabled and "Enabled" or "Disabled"))
        end,
        mode = { "n" },
        expr = true,
        desc = "NES toggle",
      },
      {
        "<leader>au",
        function()
          local nes = require("sidekick.nes")
          local disabled = nes.disable()

          nes.enable()
          nes.update()

          if disabled then
            nes.disable()
          end
        end,
        mode = { "n" },
        expr = true,
        desc = "NES Update",
      },
      {
        "<leader>aN",
        function()
          require("sidekick.nes").disable()
          vim.print("Sidekick NES Disabled")
        end,
        mode = { "n" },
        expr = true,
        desc = "NES Disable",
      },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle({ filter = { installed = true } })
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "claude", focus = true })
        end,
        desc = "Sidekick Toggle Claude",
      },
      -- {
      --   "<leader>aw",
      --   function()
      --     require("sidekick.cli").toggle({ name = "claude", focus = true, layout = "float" })
      --   end,
      --   desc = "Sidekick Toggle Floating",
      -- },
      {
        "<leader>ao",
        function()
          require("sidekick.cli").toggle({ name = "opencode", focus = true })
        end,
        desc = "Sidekick Toggle OpenCode",
      },
    },
  },
  -- {
  --   -- disable the auto complete in favor of Supermaven
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   build = ":Copilot auth",
  --   event = "BufReadPost",
  --   opts = {
  --     suggestion = {
  --       enabled = false,
  --       auto_trigger = false,
  --     },
  --   },
  -- },
}
