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
        enabled = true,
        diff = {
          inline = "words",
          -- inline = "chars",
        },
        debounce = 10,
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
  -- {
  --   "ThePrimeagen/99",
  --   config = function()
  --     local _99 = require("99")
  --
  --     -- For logging that is to a file if you wish to trace through requests
  --     -- for reporting bugs, i would not rely on this, but instead the provided
  --     -- logging mechanisms within 99.  This is for more debugging purposes
  --     local cwd = vim.uv.cwd()
  --     local basename = vim.fs.basename(cwd)
  --     _99.setup({
  --       logger = {
  --         level = _99.DEBUG,
  --         path = "/tmp/" .. basename .. ".99.debug",
  --         print_on_error = true,
  --       },
  --
  --       --- A new feature that is centered around tags
  --       completion = {
  --         --- Defaults to .cursor/rules
  --         -- I am going to disable these until i understand the
  --         -- problem better.  Inside of cursor rules there is also
  --         -- application rules, which means i need to apply these
  --         -- differently
  --         -- cursor_rules = "<custom path to cursor rules>"
  --
  --         --- A list of folders where you have your own SKILL.md
  --         --- Expected format:
  --         --- /path/to/dir/<skill_name>/SKILL.md
  --         ---
  --         --- Example:
  --         --- Input Path:
  --         --- "scratch/custom_rules/"
  --         ---
  --         --- Output Rules:
  --         --- {path = "scratch/custom_rules/vim/SKILL.md", name = "vim"},
  --         --- ... the other rules in that dir ...
  --         ---
  --         custom_rules = {
  --           "scratch/custom_rules/",
  --         },
  --
  --         --- What autocomplete do you use.  We currently only
  --         --- support cmp right now
  --         source = "cmp",
  --       },
  --
  --       --- WARNING: if you change cwd then this is likely broken
  --       --- ill likely fix this in a later change
  --       ---
  --       --- md_files is a list of files to look for and auto add based on the location
  --       --- of the originating request.  That means if you are at /foo/bar/baz.lua
  --       --- the system will automagically look for:
  --       --- /foo/bar/AGENT.md
  --       --- /foo/AGENT.md
  --       --- assuming that /foo is project root (based on cwd)
  --       md_files = {
  --         "AGENT.md",
  --         "CLAUDE.md",
  --       },
  --     })
  --
  --     -- Create your own short cuts for the different types of actions
  --     vim.keymap.set("n", "<leader>9f", function()
  --       _99.fill_in_function()
  --     end, { desc = "99 Fill In Function" })
  --     -- take extra note that i have visual selection only in v mode
  --     -- technically whatever your last visual selection is, will be used
  --     -- so i have this set to visual mode so i dont screw up and use an
  --     -- old visual selection
  --     --
  --     -- likely ill add a mode check and assert on required visual mode
  --     -- so just prepare for it now
  --     vim.keymap.set("v", "<leader>9v", function()
  --       _99.visual()
  --     end, { desc = "99 visual" })
  --
  --     --- if you have a request you dont want to make any changes, just cancel it
  --     vim.keymap.set("v", "<leader>9s", function()
  --       _99.stop_all_requests()
  --     end, { desc = "99 STOP!" })
  --
  --     -- --- Example: Using rules + actions for custom behaviors
  --     -- --- Create a rule file like ~/.rules/debug.md that defines custom behavior.
  --     -- --- For instance, a "debug" rule could automatically add printf statements
  --     -- --- throughout a function to help debug its execution flow.
  --     -- vim.keymap.set("n", "<leader>9fd", function()
  --     --   _99.fill_in_function()
  --     -- end)
  --   end,
  --
  --   function()
  --   -- implement a random function
  --   end
  -- },
}
