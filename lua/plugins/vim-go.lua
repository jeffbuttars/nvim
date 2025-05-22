return {
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
        "<leader>GI",
        "<cmd>GoToggleInlay<cr>",
        { noremap = true, desc = "Toggle Inlay" }
      )
    end,
  },
}
