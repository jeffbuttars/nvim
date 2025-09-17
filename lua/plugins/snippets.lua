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
  opts = function(_, opts)
    local gen_loader = require("mini.snippets").gen_loader

    opts.snippets = opts.snippets or {}

    vim.list_extend(opts.snippets or {}, {
      -- Load custom file with global snippets first (adjust for Windows)
      gen_loader.from_file("~/.config/nvim/snippets/global.lua"),

      -- Load snippets based on current language by reading files from
      -- "snippets/" subdirectories from 'runtimepath' directories.
      gen_loader.from_lang(),
    })

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
