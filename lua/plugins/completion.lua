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
      -- keymap = {
      --   preset = "super-tab",
      -- },

      keymap = {
        ["<S-Tab>"] = {
          "select_prev",
          "fallback",
        },
        ["<Tab>"] = {
          LazyVim.cmp.map({ "snippet_forward", "ai_nes", "ai_accept" }),
          "select_next",
          "fallback",
        },
      },
    },
  },
}
