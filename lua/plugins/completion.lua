return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "moyiz/blink-emoji.nvim",
      {
        "bydlw98/blink-cmp-sshconfig",
        build = "make",
      },

      "Exafunction/windsurf.nvim",
    },
    opts = {
      fuzzy = {
        implementation = "prefer_rust", -- "prefer_lua" or "prefer_rust" or "lua"
      },
      sources = {
        default = { "lsp", "codeium", "path", "snippets", "buffer", "sshconfig", "emoji" },
        providers = {
          codeium = { name = "Codeium", module = "codeium.blink", async = true },

          sshconfig = {
            name = "SshConfig",
            module = "blink-cmp-sshconfig",
          },

          emoji = {
            module = "blink-emoji",
            name = "Emoji",
            score_offset = 15, -- Tune by preference
            opts = {
              insert = true, -- Insert emoji (default) or complete its name
              ---@type string|table|fun():table
              trigger = function()
                return { ":" }
              end,
            },
            -- should_show_items = function()
            --   return vim.tbl_contains(
            --     -- Enable emoji completion only for git commits and markdown.
            --     -- By default, enabled for all file-types.
            --     { "gitcommit", "markdown" },
            --     vim.o.filetype
            --   )
            -- end,
          },
        },
      },

      completion = {
        list = {
          -- Don't select by default and only use an explicitly selected choice
          selection = { preselect = false, auto_insert = false },
        },
      },

      -- experimental signature help support
      signature = { enabled = true },

      keymap = {

        ["<S-Tab>"] = {
          "select_prev",
          "fallback",
        },
        ["<Tab>"] = {
          "snippet_forward",
          function() -- sidekick next edit suggestion
            return require("sidekick").nes_jump_or_apply()
          end,
          function() -- if you are using Neovim's native inline completions
            return vim.lsp.inline_completion.get()
          end,
          "select_next",
          "fallback",
        },
        -- ["<enter>"] = {
        --   function(cmp)
        --     -- If the window is open, but nothing has been selected, do nothing
        --     -- If the window is open, but a selection has been made, accept the completion
        --     if require("blink.cmp").is_visible() then
        --       local menu = require("blink.cmp.completion.windows.menu")
        --       if menu.selected_item_idx ~= nil then
        --         cmp.accept()
        --         return true
        --       end
        --     end
        --   end,
        --   "fallback",
        -- },
      },
    },
  },
}
