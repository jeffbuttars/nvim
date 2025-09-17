-- local gen_loader = require("mini.snippets").gen_loader

-- # Highlight groups ~
--
-- * `MiniSnippetsCurrent` - current tabstop.
-- * `MiniSnippetsCurrentReplace` - current tabstop, placeholder is to be replaced.
-- * `MiniSnippetsFinal` - special `$0` tabstop.
-- * `MiniSnippetsUnvisited` - not yet visited tabstop(s).
-- * `MiniSnippetsVisited` - visited tabstop(s).
-- vim.cmd([["hi clear MiniSnippetsUnvisited"]])

-- vim.api.nvim_set_hl(0, "MiniSnippetsUnvisited", {})
vim.api.nvim_set_hl(0, "MiniSnippetsVisited", {})

-- vim.api.nvim_set_hl(0, "MiniSnippetsFinal", {})
vim.api.nvim_set_hl(0, "MiniSnippetsCurrent", {})
vim.api.nvim_set_hl(0, "MiniSnippetsCurrentReplace", {})

return {
  "nvim-mini/mini.snippets",
  event = "InsertEnter", -- don't depend on other plugins to load...
  dependencies = "rafamadriz/friendly-snippets",

  -- opts = {
  --   snippets = {
  --     -- Load custom file with global snippets first (adjust for Windows)
  --     gen_loader.from_file("~/.config/nvim/snippets/global.lua"),
  --
  --     -- Load snippets based on current language by reading files from
  --     -- "snippets/" subdirectories from 'runtimepath' directories.
  --     gen_loader.from_lang(),
  --   },
  --
  --   -- Use the native snippet expansion
  --   -- expand = {
  --   --   insert = function(snippet, _)
  --   --     vim.snippet.expand(snippet.body)
  --   --   end,
  --   -- },
  -- },
  opts = function()
    ---@diagnostic disable-next-line: duplicate-set-field
    LazyVim.cmp.actions.snippet_stop = function() end -- by design, <esc> should not stop the session!
    ---@diagnostic disable-next-line: duplicate-set-field
    LazyVim.cmp.actions.snippet_forward = function()
      return jump("next")
    end

    local mini_snippets = require("mini.snippets")
    return {
      snippets = { mini_snippets.gen_loader.from_lang(),
        mini_snippets.gen_loader.from_file("~/.config/nvim/snippets/global.lua"),
        mini_snippets.gen_loader.from_lang(),
      },

      -- Following the behavior of vim.snippets,
      -- the intended usage of <esc> is to be able to temporarily exit into normal mode for quick edits.
      --
      -- If you'd rather stop the snippet on <esc>, activate the line below in your own config:
      -- mappings = { stop = "<esc>" }, -- <c-c> by default, see :h MiniSnippets-session

    -- opts.snippets = {
    --   -- Load custom file with global snippets first (adjust for Windows)
    --   gen_loader.from_file("~/.config/nvim/snippets/global.lua"),
    --
    --   -- Load snippets based on current language by reading files from
    --   -- "snippets/" subdirectories from 'runtimepath' directories.
    --   gen_loader.from_lang(),
    -- },
    -- Use the native snippet expansion
    -- expand = {
    --   insert = function(snippet, _)
    --     vim.snippet.expand(snippet.body)
    --   end,
    -- },

      -- expand = {
      --   select = function(snippets, insert)
      --     -- Close completion window on snippet select - vim.ui.select
      --     -- Needed to remove virtual text for fzf-lua and telescope, but not for mini.pick...
      --     local select = expand_select_override or MiniSnippets.default_select
      --     select(snippets, insert)
      --   end,
      -- },
  end,

  init = function()
    local MiniSnippets = require("mini.snippets")

    -- # Stop session immediately after jumping to final tabstop ~
    --- Utilize a dedicated |MiniSnippets-events|: >lua
    local fin_stop = function(args)
      if args.data.tabstop_to == "0" then
        MiniSnippets.session.stop()
      end
    end

    local au_opts = { pattern = "MiniSnippetsSessionJump", callback = fin_stop }
    vim.api.nvim_create_autocmd("User", au_opts)

    --- # Stop all sessions on Normal mode exit ~
    --- Use |ModeChanged| and |MiniSnippets-events| events: >lua
    ---
    local make_stop = function()
      local sau_opts = { pattern = "*:n", once = true }
      sau_opts.callback = function()
        while MiniSnippets.session.get() do
          MiniSnippets.session.stop()
        end
      end
      vim.api.nvim_create_autocmd("ModeChanged", sau_opts)
    end

    local opts = { pattern = "MiniSnippetsSessionStart", callback = make_stop }
    vim.api.nvim_create_autocmd("User", opts)

    -- Make jump mappings or skip to use built-in <Tab>/<S-Tab> in Neovim>=0.11
    -- local jump_next = function()
    --   if vim.snippet.active({ direction = 1 }) then
    --     return vim.snippet.jump(1)
    --   end
    -- end
    -- local jump_prev = function()
    --   if vim.snippet.active({ direction = -1 }) then
    --     vim.snippet.jump(-1)
    --   end
    -- end
    --
    -- vim.keymap.set({ "i", "s" }, "<C-l>", jump_next)
    -- vim.keymap.set({ "i", "s" }, "<C-h>", jump_prev)
  end,
}
