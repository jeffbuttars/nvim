-- Swap UltiSnips in
return {
  {
    "nvim-cmp",
    -- @param opts cmp.ConfigSchema
    opts = function(_, opts)
      require("cmp_nvim_ultisnips").setup({})
      local cmp = require("cmp")
      local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

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

      table.insert(opts.sources, 2, {
        name = "ultisnips",
        keyword_length = 1,
        max_item_count = 5,
        group_index = 1,
        priority = 90,
      })

      table.insert(opts.sources, 1, {
        name = "codeium",
        keyword_length = 0,
        max_item_count = 5,
        group_index = 1,
        priority = 100,
      })
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
      },
    },
  },
}
