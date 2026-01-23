local nes = require("sidekick.nes")

local nes_toggle_maybe_update = function()
  nes.toggle()

  if nes.enabled then
    nes.update()
  end
end

return {
  {
    "folke/sidekick.nvim",

    opts = {
      -- add any options here
      nes = {
        enabled = false,
        diff = {
          inline = "words",
        },
        debounce = 10,
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
          nes_toggle_maybe_update()
          vim.print("Sidekick NES " .. (nes.enabled and "Enabled" or "Disabled"))
        end,
        mode = { "n" },
        expr = true,
        desc = "NES toggle",
      },
      -- {
      --   "<leader>au",
      --   function()
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
      --   end,
      --   mode = { "n" },
      --   expr = true,
      --   desc = "NES Update",
      -- },
      -- {
      --   "<leader>aN",
      --   function()
      --     require("sidekick.nes").disable()
      --     vim.print("Sidekick NES Disabled")
      --   end,
      --   mode = { "n" },
      --   expr = true,
      --   desc = "NES Disable",
      -- },
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

  {
    "Exafunction/windsurf.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("codeium").setup({
        -- enable_cmp_source = true,
        virtual_text = {
          enabled = false,
          -- idle_delay = 5000,
          -- "", '󰘦',
          -- key_bindings = {
          --   accept = "<ctrl-y>",
          --   next = "<Tab>",
          --   prev = "<S-Tab>",
          --   clear = "<esc>",
          -- },
        },
      })
    end,
  },

  -- {
  --   -- disable the auto complete in favor of Supermaven
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   build = ":Copilot auth",
  --   event = "BufReadPost",
  --   opts = {
  --     suggestion = {
  --       enabled = true,
  --       auto_trigger = true,
  --     },
  --   },
  -- },
}
