local function focus_preview_window()
  -- Get all windows
  local windows = vim.api.nvim_list_wins()

  for _, win in ipairs(windows) do
    -- Check if it's a preview window
    local win_config = vim.api.nvim_win_get_config(win)

    -- Preview windows are usually floating windows
    if win_config.relative ~= "" then
      -- Additional checks for preview windows
      local buf = vim.api.nvim_win_get_buf(win)
      local buf_name = vim.api.nvim_buf_get_name(buf)
      local buf_type = vim.api.nvim_buf_get_option(buf, "buftype")

      -- Common characteristics of preview windows
      if buf_type == "nofile" or buf_name:match("preview") then
        vim.api.nvim_set_current_win(win)
        -- vim.print("Setting win focus for", win)
        return true
      end
    end
  end
  return false
end

local function get_quoted_string_under_cursor()
  -- Get current cursor position
  local cursor = vim.api.nvim_win_get_cursor(0)
  local row = cursor[1] - 1 -- Convert to 0-indexed
  local col = cursor[2]

  -- Get the current line
  local line = vim.api.nvim_buf_get_lines(0, row, row + 1, false)[1]

  if not line then
    return {}
  end

  -- Find quote characters to look for
  local quotes = { '"', "'", "`" }

  for _, quote in ipairs(quotes) do
    -- Find the start of the quoted string (search backwards)
    local start_pos = nil
    for i = col, 1, -1 do
      if line:sub(i, i) == quote then
        start_pos = i
        break
      end
    end

    -- Find the end of the quoted string (search forwards)
    local end_pos = nil
    if start_pos then
      for i = col + 1, #line do
        if line:sub(i, i) == quote then
          end_pos = i
          break
        end
      end
    end

    -- If we found both start and end, extract the content
    if start_pos and end_pos and start_pos < end_pos then
      local content = line:sub(start_pos + 1, end_pos - 1)
      -- return content, start_pos, end_pos
      return { content }
    end
  end

  return {}
end

-- -- Usage example
-- local content = get_quoted_string_under_cursor()
-- if content then
--   print("Quoted string content: " .. content)
-- else
--   print("No quoted string found under cursor")
-- end

return {
  -- {
  --   "olexsmir/gopher.nvim",
  --   ft = "go",
  --   -- branch = "develop"
  --   -- (optional) will update plugin's deps on every update
  --   build = function()
  --     vim.cmd.GoInstallDeps()
  --   end,
  --   ---@type gopher.Config
  --   opts = {},
  -- },
  -- {
  --   "fatih/vim-go",
  --   ft = { "go" },
  --   -- tag = "v1.28",
  --   init = function()
  --     vim.keymap.set({ "v", "n" }, "<leader>G", "", { noremap = true, desc = "Go" })
  --     vim.keymap.set(
  --       { "v", "n" },
  --       "<leader>Gt",
  --       "<cmd>GoAddTags<cr>",
  --       { noremap = true, desc = "GoAddTags" }
  --     )
  --     vim.keymap.set(
  --       { "v", "n" },
  --       "<leader>Gb",
  --       "<cmd>GoBuild<cr>",
  --       { noremap = true, desc = "Go Build" }
  --     )
  --   end,
  -- },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    -- event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    opts = {
      lsp_inlay_hints = { enable = false },
      -- lsp_keymaps = false,
      -- other options
      -- tag_options = 'json=omitempty',
      tag_options = "",
    },
    init = function()
      -- local gonvim = require("go.nvim")
      -- local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   pattern = "*.go",
      --   callback = function()
      --     require("go.format").goimports()
      --   end,
      --   group = format_sync_grp,
      -- })
      vim.keymap.set({ "v", "n" }, "<leader>G", "", { noremap = true, desc = "Go" })
      vim.keymap.set(
        { "v", "n" },
        "<leader>Gt",
        "<cmd>GoAddTag<cr>",
        { noremap = true, desc = "Add Tag" }
      )
      vim.keymap.set(
        { "v", "n" },
        "<leader>GT",
        "<cmd>GoRmTag<cr>",
        { noremap = true, desc = "Remove Tag" }
      )
      vim.keymap.set(
        { "n" },
        "<leader>Gc",
        "<cmd>GoCmt<cr>",
        { noremap = true, desc = "Remove Tag" }
      )
      vim.keymap.set({ "n" }, "<leader>GC", "<cmd>GoCheat<cr>", { noremap = true, desc = "Cheat" })
      vim.keymap.set(
        { "n" },
        "<leader>Gs",
        "<cmd>GoFillStruct<cr>",
        { noremap = true, desc = "Fill Struct" }
      )
      vim.keymap.set(
        { "n" },
        "<leader>Gw",
        "<cmd>GoFillSwitch<cr>",
        { noremap = true, desc = "Fill Switch" }
      )
      vim.keymap.set({ "n" }, "<leader>Gb", "<cmd>GoBuild<cr>", { noremap = true, desc = "Build" })
      vim.keymap.set(
        { "n" },
        "<leader>Ga",
        "<cmd>GoAddTest<cr>",
        { noremap = true, desc = "Add Test for current func" }
      )
      vim.keymap.set(
        { "n" },
        "<leader>GA",
        "<cmd>GoAddAllTest<cr>",
        { noremap = true, desc = "Add Test for all funcs" }
      )
      vim.keymap.set(
        { "n" },
        "<leader>Gr",
        "<cmd>GoGenReturn<cr>",
        { noremap = true, desc = "Generate return" }
      )
      vim.keymap.set({ "n" }, "<leader>Gl", "<cmd>GoLint<cr>", { noremap = true, desc = "Lint" })
      vim.keymap.set({ "n" }, "<leader>Gd", function()
        local pkg = get_quoted_string_under_cursor()
        if #pkg == 0 then
          vim.lsp.buf.hover({ focus = true, focusable = true })
          vim.defer_fn(vim.lsp.buf.hover, 100)
        else
          require("go.godoc").run(pkg)
          vim.defer_fn(focus_preview_window, 500)
        end
      end, { noremap = true, desc = "Show go doc for api in neovim floating window" })
    end,
  },
}
