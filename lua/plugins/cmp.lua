-- Swap UltiSnips in
return {
  {
    "nvim-cmp",
    -- @param opts cmp.ConfigSchema
    opts = function(_, opts)
      require("cmp_nvim_ultisnips").setup({})
      local cmp = require("cmp")
      local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

      opts.completion = {
        completeopt = "menu,preview,menuone,noselect",
        -- completeopt = { "menu", "menuone", "noinsert" },
        -- completeopt = { "menu", "preview", "menuone", "noselect" },
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-j>"] = cmp.mapping(function(fallback)
          cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
        end, {
          "i",
          "s", --[[ "c" (to enable the mapping in command mode) ]]
        }),

        ["<C-k>"] = cmp.mapping(function(fallback)
          cmp_ultisnips_mappings.jump_backwards(fallback)
        end, {
          "i",
          "s", --[[ "c" (to enable the mapping in command mode) ]]
        }),

        ["<Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,

        ["<S-Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,

        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

        -- ["<CR>"] = cmp.mapping({
        --   i = function(fallback)
        --     if cmp.visible() and cmp.get_active_entry() then
        --       cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        --     else
        --       fallback()
        --     end
        --   end,
        --   s = cmp.mapping.confirm({ select = true }),
        --   -- c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        -- }),
      })

      opts.snippet = {
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body)
        end,
      }

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }

      -- table.insert(opts.sources, 2, {
      --   name = "ultisnips",
      --   keyword_length = 1,
      --   max_item_count = 5,
      --   group_index = 1,
      --   -- priority = 90,
      -- })

      -- Just override with our own table
      opts.sources = cmp.config.sources({
        {
          group_index = 1,
          name = "codeium",
          priority = 100,
          keyword_length = 0,
        },
        {
          group_index = 1,
          keyword_length = 1,
          max_item_count = 5,
          name = "ultisnips",
          priority = 90,
        },
        {
          group_index = 1,
          keyword_length = 1,
          name = "nvim_lsp",
          priority = 85,
        },
        -- {
        --   group_index = 1,
        --   name = "luasnip",
        -- },
        {
          group_index = 1,
          name = "path",
          max_item_count = 3,
        },
        {
          group_index = 2,
          name = "buffer",
          max_item_count = 5,
        },
        -- {
        --   group_index = 2,
        --   name = "spell",
        --   keyword_length = 3,
        --   max_item_count = 5,
        --   option = {
        --     keep_all_entries = false,
        --     -- enable_in_context = function()
        --     -- 	return true
        --     -- end,
        --     enable_in_context = function()
        --       return require("cmp.config.context").in_treesitter_capture("spell")
        --     end,
        --   },
        -- },
        -- {
        --   group_index = 1,
        --   name = "html-css",
        --   keyword_length = 2,
        --   max_item_count = 5,
        --   option = {
        --     file_extensions = { "css", "sass", "less" },
        --     enable_on = { "html", "htmldjango" },
        --     style_sheets = {
        --       -- example of remote styles, only css no js for now
        --       "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
        --     },
        --   },
        -- },
      })

      -- vim.print("SOURCES:", opts.sources)
      -- vim.print("completion:", opts.completion)
    end,

    dependencies = {
      { "quangnguyen30192/cmp-nvim-ultisnips", dependencies = { "SirVer/ultisnips" } },
      {
        "SirVer/ultisnips",
        config = function()
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

          vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/UltiSnips" }
        end,
      },
      { "honza/vim-snippets" },
      {
        "Exafunction/codeium.nvim",
        cmd = "Codeium",
        build = ":Codeium Auth",
        opts = {},
      },
    },
  },
}
