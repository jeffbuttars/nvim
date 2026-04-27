vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- Enable inline completion if the client supports it
    if
      client
      and client:supports_method("textDocument/inlineCompletion")
      and vim.lsp.inline_completion.is_enabled()
    then
      local bufnr = args.buf
      -- vim.lsp.inline_completion.enable(true, { bufnr = bufnr })

      -- Map to apply the current suggestion
      vim.keymap.set("i", "<C-I>", function()
        if not vim.lsp.inline_completion.get() then
          return "<C-I>"
        end
      end, { expr = true, buffer = bufnr, desc = "Accept inline completion" })

      -- -- Map to cycle to the next suggestion
      -- vim.keymap.set("i", "<S-Tab>", function()
      --   vim.lsp.inline_completion.select({ count = 1 })
      -- end, { buffer = bufnr, desc = "Next inline completion" })
      --
      -- -- Map to cycle to the previous suggestion
      -- vim.keymap.set("i", "<C-Tab>", function()
      --   vim.lsp.inline_completion.select({ count = -1 })
      -- end, { buffer = bufnr, desc = "Previous inline completion" })
    end
  end,
})

return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "moyiz/blink-emoji.nvim",
      -- "Exafunction/windsurf.nvim",
    },
    opts = {
      fuzzy = {
        implementation = "prefer_rust", -- "prefer_lua" or "prefer_rust" or "lua"
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "emoji" },
        -- default = { "lsp", "codeium", "path", "snippets", "buffer", "sshconfig", "emoji" },
        providers = {
          -- codeium = { name = "Codeium", module = "codeium.blink", async = true },

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
        -- menu = {
        --   auto_show = function()
        --     -- Only show the completion menu when there are no inline suggestions to avoid confusion
        --     return not vim.lsp.inline_completion.get()
        --   end,
        -- },
      },

      -- experimental signature help support
      signature = { enabled = true },
      -- keymap = {
      --   preset = "enter",
      -- },

      keymap = {
        ["<C-space>"] = { "hide", "show", "show_documentation" },
        ["<S-Tab>"] = {
          "select_prev",
          "fallback",
        },
        ["<Tab>"] = {
          -- LazyVim.cmp.map({ "snippet_forward", "ai_nes" }),
          -- LazyVim.cmp.map({ "snippet_forward", "ai_nes", "ai_accept" }),
          LazyVim.cmp.map({ "snippet_forward" }),
          "select_next",
          "fallback",
        },
      },
    },
  },
}
