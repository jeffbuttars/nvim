-- local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
local blink_cmp = require("blink.cmp")

return {
  "saghen/blink.cmp",
  --
  opts = {
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },

    keymap = {
      preset = "enter",
      ["<S-Tab>"] = {
        "select_prev",
        "fallback",
      },
      ["<Tab>"] = {
        -- function(cmp)
        -- {
        --   accept = <function 1>,
        --   cancel = <function 2>,
        --   get_lsp_capabilities = <function 3>,
        --   hide = <function 4>,
        --   hide_documentation = <function 5>,
        --   reload = <function 6>,
        --   scroll_documentation_down = <function 7>,
        --   scroll_documentation_up = <function 8>,
        --   select_and_accept = <function 9>,
        --   select_next = <function 10>,
        --   select_prev = <function 11>,
        --   setup = <function 12>,
        --   show = <function 13>,
        --   show_documentation = <function 14>,
        --   snippet_active = <function 15>,
        --   snippet_backward = <function 16>,
        --   snippet_forward = <function 17>
        -- }
        -- vim.print("TABBBBB cmp", cmp)
        -- vim.print("TABBBBB blink_cmp", blink_cmp)
        -- return cmp.select_next()
        -- if cmp.snippet_active() then
        --   return cmp.accept()
        -- end

        -- return

        -- if blink_cmp.is_visible() then
        --   return cmp.select_next()
        -- else
        --   return cmp.fallback()
        -- end
        -- end,
        "select_next",
        "fallback",
      },
    },

    completion = {
      list = {
        selection = "manual",
      },
      auto_complete = true,
      auto_complete_delay = 50,
      max_items = 5,
      menu = {
        draw = {
          columns = {
            { "kind_icon", "kind" },
            { "label", "label_description", gap = 1 },
          },
        },
      },
    },
    sources = {
      compat = { "ultisnips" },
      providers = {
        ultisnips = {
          kind = "Snippet",
          name = "ultisnips",
          module = "blink.compat.source",
          group_index = 1,
          max_item_count = 3,
          priority = 80,
        },
      },
    },
  },

  dependencies = {
    {
      "quangnguyen30192/cmp-nvim-ultisnips",
      -- "hrsh7th/cmp-cmdline",
      dependencies = { "SirVer/ultisnips" },
      requires = { "nvim-treesitter/nvim-treesitter" },
    },
    {
      "SirVer/ultisnips",
      lazy = false,
      priority = 1000,
      init = function()
        -- UltiSnips
        -- This must be loaded at startup and not in after

        -- Make sure it picks up our snippet file first, so our overwrites take effect.
        vim.g.UltiSnipsDontReverseSearchPath = true

        -- vim.api.nvim_exec([[let g:UltiSnipsExpandTrigger = '<C-j>']], true)
        -- vim.api.nvim_exec([[let g:UltiSnipsJumpForwardTrigger = '<C-j>']], true)

        vim.g.UltiSnipsExpandTrigger = "<c-j>"
        vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
        vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
        -- vim.g.UltiSnipsListSnippets = '<c-q>'
        -- vim.g.UltiSnipsListSnippets                <c-tab>

        -- vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/UltiSnips" }
      end,
    },
    { "honza/vim-snippets" },
  },
}
