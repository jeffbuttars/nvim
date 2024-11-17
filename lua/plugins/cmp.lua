-- Swap UltiSnips in
return {
  {
    "nvim-cmp",
    -- @param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

      -- https://github.com/hrsh7th/cmp-cmdline
      -- `/` cmdline setup.
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- `:` cmdline setup.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })

      opts.completion = {
        completeopt = "menu,preview,menuone,noselect",
        -- completeopt = "menu,preview,menuone,noselect,noinsert",
      }
      opts.preselect = cmp.PreselectMode.None

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

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- vim.print("TAB VISIBLE")
            cmp.select_next_item()
          else
            -- vim.print("TAB NOT VISIBLE, FAlling back")
            fallback()
          end
        end, { "i", "s", "c" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s", "c" }),

        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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

      -- Update sources with our old ass snippet stuff
      table.insert(opts.sources, 1, {
        -- keyword_length = 2,
        name = "ultisnips",
        group_index = 1,
        max_item_count = 3,
        priority = 80,
      })

      -- table.insert(opts.sources, 1, {
      --   name = "typos_lsp",
      --   group_index = 2,
      -- })

      -- Just override with our own table
      -- opts.sources = cmp.config.sources({
      --   {
      --     -- keyword_length = 1,
      --     name = "nvim_lsp",
      --     priority = 100,
      --   },
      --   { name = "nvim_lsp_signature_help" },
      -- }, {
      --   -- {
      --   --   name = "luasnip",
      --   -- },
      --   {
      --     name = "buffer",
      --     max_item_count = 5,
      --   },
      --   {
      --     name = "typos_lsp",
      --     -- keyword_length = 2,
      --   },
      --   {
      --     name = "path",
      --     max_item_count = 3,
      --   },
      --   { name = "cmp_yanky" },
      --   { name = "color_names" },
      --   {
      --     name = "spell",
      --     keyword_length = 3,
      --     max_item_count = 5,
      --     option = {
      --       keep_all_entries = false,
      --       -- enable_in_context = function()
      --       -- 	return true
      --       -- end,
      --       enable_in_context = function()
      --         return require("cmp.config.context").in_treesitter_capture("spell")
      --       end,
      --     },
      --   },
      -- })
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

      -- vim.print("SOURCES:", opts.sources)
      -- vim.print("completion:", opts.completion)
    end,

    dependencies = {
      {
        "quangnguyen30192/cmp-nvim-ultisnips",
        "hrsh7th/cmp-cmdline",
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
  },
}
