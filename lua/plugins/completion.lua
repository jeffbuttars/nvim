local blink_cmp = require("blink.cmp")

local function t(keys)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, true, true), "m", true)
end

local function can_execute(arg)
  return vim.fn[arg]() == 1
end

-- The <Plug> mappings are defined in autoload/cmp_nvim_ultisnips.vim.

local actions = {
  expand = {
    condition = { can_execute, "UltiSnips#CanExpandSnippet" },
    command = { t, "<Plug>(cmpu-expand)" },
  },
  jump_forwards = {
    condition = { can_execute, "UltiSnips#CanJumpForwards" },
    command = { t, "<Plug>(cmpu-jump-forwards)" },
  },
  jump_backwards = {
    condition = { can_execute, "UltiSnips#CanJumpBackwards" },
    command = { t, "<Plug>(cmpu-jump-backwards)" },
  },
  select_next_item = {
    condition = { blink_cmp.is_visible },
    command = { blink_cmp.select_next },
  },
  select_prev_item = {
    condition = { blink_cmp.visible },
    command = { blink_cmp.select_prev },
  },
}

local us_mappings = {}

function us_mappings.compose(action_keys)
  return function(fallback)
    for _, action_key in ipairs(action_keys) do
      local action = actions[action_key]

      if not action then
        error(
          string.format(
            "[cmp_nvim_ultisnips.mappings] Invalid key %s was passed to compose function. "
              .. "Please check your mappings.\nAllowed values: 'expand', 'jump_forwards', "
              .. "'jump_backwards', 'select_next_item', 'select_prev_item'.",
            action_key
          )
        )
      end
      -- vim.print("compose action_key:", action_key)
      -- vim.print("compose calling condition:", action.condition)
      -- vim.print("blink_cmp", blink_cmp)
      if action.condition[1](action.condition[2]) == true then
        -- vim.print("compose calling command:", action.command)
        action.command[1](action.command[2])
        return true
      end
    end

    if fallback ~= nil then
      -- vim.print("compose calling fallback:", fallback)
      fallback()
      return true
    end

    -- vim.print("compose did nothing")
    return false
  end
end

function us_mappings.expand_or_jump_forwards(fallback)
  return us_mappings.compose({ "expand", "jump_forwards", "select_next_item" })(fallback)
end

function us_mappings.jump_forwards(fallback)
  return us_mappings.compose({ "jump_forwards", "select_next_item" })(fallback)
end

function us_mappings.jump_backwards(fallback)
  return us_mappings.compose({ "jump_backwards", "select_prev_item" })(fallback)
end

return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",
      ["<enter>"] = {
        function(cmp)
          -- If the window is open, but nothing has been selected, do nothing
          -- If the window is open, but a selection has been made, accept the completion
          if blink_cmp.is_visible() then
            local menu = require("blink.cmp.completion.windows.menu")
            if menu.selected_item_idx ~= nil then
              cmp.accept()
              return true
            end
          end
        end,
        "fallback",
      },

      ["<C-j>"] = {
        function(cmp)
          -- vim.print("C-J")
          -- vim.print("C-J", cmp)
          -- local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
          local expanded = us_mappings.expand_or_jump_forwards()

          -- vim.print("c-j expanded", expanded)

          if expanded then
            -- vim.print("C-J cancel")
            cmp.cancel()
          end

          return expanded
        end,
        "fallback",
      },
      -- ["<S-Tab>"] = {
      --   "select_prev",
      --   "fallback",
      -- },
      -- ["<Tab>"] = {
      --   -- function(cmp)
      --   -- {
      --   --   accept = <function 1>,
      --   --   cancel = <function 2>,
      --   --   get_lsp_capabilities = <function 3>,
      --   --   hide = <function 4>,
      --   --   hide_documentation = <function 5>,
      --   --   reload = <function 6>,
      --   --   scroll_documentation_down = <function 7>,
      --   --   scroll_documentation_up = <function 8>,
      --   --   select_and_accept = <function 9>,
      --   --   select_next = <function 10>,
      --   --   select_prev = <function 11>,
      --   --   setup = <function 12>,
      --   --   show = <function 13>,
      --   --   show_documentation = <function 14>,
      --   --   snippet_active = <function 15>,
      --   --   snippet_backward = <function 16>,
      --   --   snippet_forward = <function 17>
      --   -- }
      --   -- vim.print("TABBBBB cmp", cmp)
      --   -- vim.print("TABBBBB blink_cmp", blink_cmp)
      --   -- return cmp.select_next()
      --   -- if cmp.snippet_active() then
      --   --   return cmp.accept()
      --   -- end
      --
      --   -- return
      --
      --   -- if blink_cmp.is_visible() then
      --   --   return cmp.select_next()
      --   -- else
      --   --   return cmp.fallback()
      --   -- end
      --   -- end,
      --   "select_next",
      --   "fallback",
      -- },
    },
    --
    completion = {
      -- ghost_text = {
      --   enabled = true,
      -- },
      list = {
        selection = { preselect = false, auto_insert = false },
      },
      --       -- auto_complete_delay = 50,
      menu = {
        border = "rounded",
        -- winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
        winhighlight = "CursorLine:BlinkCmpMenuSelection,Search:None",
        draw = {
          columns = {
            { "kind_icon", "kind" },
            { "label", "label_description", gap = 1 },
          },
        },
      },
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
          -- winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
          winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
          winhighlight = "CursorLine:BlinkCmpMenuSelection,Search:None",
        },
      },
    },
    signature = {
      enabled = true,
      window = {
        border = "rounded",
        -- winhighlight = 'Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder',
        -- winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpSignatureHelpBorder",
      },
    },

    sources = {
      compat = { "ultisnips" },
      providers = {
        ultisnips = {
          kind = "Snippet",
          name = "ultisnips",
          module = "blink.compat.source",
          score_offset = 101,
        },
      },
    },
  },
  dependencies = {
    {
      "quangnguyen30192/cmp-nvim-ultisnips",
      dependencies = { "SirVer/ultisnips" },
      requires = { "nvim-treesitter/nvim-treesitter" },
    },
    {
      "SirVer/ultisnips",
      dependencies = { "Saghen/blink.compat" },
      lazy = false,
      priority = 1000,
      init = function()
        -- UltiSnips
        -- This must be loaded at startup and not in after

        -- us_mappingsake sure it picks up our snippet file first, so our overwrites take effect.
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

-- Swap UltiSnips in
-- return {
-- {
--   "nvim-cmp",
--   -- @param opts cmp.ConfigSchema
--   opts = function(_, opts)
--     local cmp = require("cmp")
--     local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
--
--     -- https://github.com/hrsh7th/cmp-cmdline
--     -- `/` cmdline setup.
--     cmp.setup.cmdline("/", {
--       mapping = cmp.mapping.preset.cmdline(),
--       sources = {
--         { name = "buffer" },
--       },
--     })
--
--     -- `:` cmdline setup.
--     cmp.setup.cmdline(":", {
--       mapping = cmp.mapping.preset.cmdline(),
--       sources = cmp.config.sources({
--         { name = "path" },
--       }, {
--         {
--           name = "cmdline",
--           option = {
--             ignore_cmds = { "Man", "!" },
--           },
--         },
--       }),
--     })
--
--     opts.completion = {
--       completeopt = "menu,preview,menuone,noselect",
--       -- completeopt = "menu,preview,menuone,noselect,noinsert",
--     }
--     opts.preselect = cmp.PreselectMode.None
--
--     opts.mapping = vim.tbl_extend("force", opts.mapping, {
--       ["<C-j>"] = cmp.mapping(function(fallback)
--         cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
--       end, {
--         "i",
--         "s", --[[ "c" (to enable the mapping in command mode) ]]
--       }),
--
--       ["<C-k>"] = cmp.mapping(function(fallback)
--         cmp_ultisnips_mappings.jump_backwards(fallback)
--       end, {
--         "i",
--         "s", --[[ "c" (to enable the mapping in command mode) ]]
--       }),
--
--       ["<Tab>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--           -- vim.print("TAB VISIBLE")
--           cmp.select_next_item()
--         else
--           -- vim.print("TAB NOT VISIBLE, FAlling back")
--           fallback()
--         end
--       end, { "i", "s", "c" }),
--
--       ["<S-Tab>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--           cmp.select_prev_item()
--         else
--           fallback()
--         end
--       end, { "i", "s", "c" }),
--
--       ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--     })
--
--     opts.snippet = {
--       expand = function(args)
--         vim.fn["UltiSnips#Anon"](args.body)
--       end,
--     }
--
--     opts.window = {
--       completion = cmp.config.window.bordered(),
--       documentation = cmp.config.window.bordered(),
--     }
--
--     -- Update sources with our old ass snippet stuff
--     table.insert(opts.sources, 1, {
--       -- keyword_length = 2,
--       name = "ultisnips",
--       group_index = 1,
--       max_item_count = 3,
--       priority = 80,
--     })
--
--     -- table.insert(opts.sources, 1, {
--     --   name = "typos_lsp",
--     --   group_index = 2,
--     -- })
--
--     -- Just override with our own table
--     -- opts.sources = cmp.config.sources({
--     --   {
--     --     -- keyword_length = 1,
--     --     name = "nvim_lsp",
--     --     priority = 100,
--     --   },
--     --   { name = "nvim_lsp_signature_help" },
--     -- }, {
--     --   -- {
--     --   --   name = "luasnip",
--     --   -- },
--     --   {
--     --     name = "buffer",
--     --     max_item_count = 5,
--     --   },
--     --   {
--     --     name = "typos_lsp",
--     --     -- keyword_length = 2,
--     --   },
--     --   {
--     --     name = "path",
--     --     max_item_count = 3,
--     --   },
--     --   { name = "cmp_yanky" },
--     --   { name = "color_names" },
--     --   {
--     --     name = "spell",
--     --     keyword_length = 3,
--     --     max_item_count = 5,
--     --     option = {
--     --       keep_all_entries = false,
--     --       -- enable_in_context = function()
--     --       -- 	return true
--     --       -- end,
--     --       enable_in_context = function()
--     --         return require("cmp.config.context").in_treesitter_capture("spell")
--     --       end,
--     --     },
--     --   },
--     -- })
--     -- {
--     --   group_index = 1,
--     --   name = "html-css",
--     --   keyword_length = 2,
--     --   max_item_count = 5,
--     --   option = {
--     --     file_extensions = { "css", "sass", "less" },
--     --     enable_on = { "html", "htmldjango" },
--     --     style_sheets = {
--     --       -- example of remote styles, only css no js for now
--     --       "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
--     --     },
--     --   },
--     -- },
--
--     -- vim.print("SOURCES:", opts.sources)
--     -- vim.print("completion:", opts.completion)
--   end,
--
--   dependencies = {
--     {
--       "quangnguyen30192/cmp-nvim-ultisnips",
--       "hrsh7th/cmp-cmdline",
--       dependencies = { "SirVer/ultisnips" },
--       requires = { "nvim-treesitter/nvim-treesitter" },
--     },
--     {
--       "SirVer/ultisnips",
--       lazy = false,
--       priority = 1000,
--       init = function()
--         -- UltiSnips
--         -- This must be loaded at startup and not in after
--
--         -- Make sure it picks up our snippet file first, so our overwrites take effect.
--         vim.g.UltiSnipsDontReverseSearchPath = true
--
--         -- vim.api.nvim_exec([[let g:UltiSnipsExpandTrigger = '<C-j>']], true)
--         -- vim.api.nvim_exec([[let g:UltiSnipsJumpForwardTrigger = '<C-j>']], true)
--
--         vim.g.UltiSnipsExpandTrigger = "<c-j>"
--         vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
--         vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
--         -- vim.g.UltiSnipsListSnippets = '<c-q>'
--         -- vim.g.UltiSnipsListSnippets                <c-tab>
--
--         -- vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/UltiSnips" }
--       end,
--     },
--     { "honza/vim-snippets" },
--   },
-- },
-- }
