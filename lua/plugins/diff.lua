M = {}

function M.find_window_by_filetype(filetype)
  for i = 1, vim.fn.winnr("$") do
    local winid = vim.fn.win_getid(i)
    local bufnr = vim.api.nvim_win_get_buf(winid)
    if vim.bo[bufnr].filetype == filetype then
      return winid, bufnr
    end
  end
  return nil, nil
end

function M.focus_window(winid)
  if winid and vim.api.nvim_win_is_valid(winid) then
    vim.api.nvim_set_current_win(winid)
    return true
  end
  return false
end

function M.focus_explorer()
  local winid = M.find_window_by_filetype("codediff-explorer")
  return M.focus_window(winid)
end

return {
  -- {
  --   "sindrets/diffview.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   cmd = {
  --     "DiffviewClose",
  --     "DiffviewFileHistory",
  --     "DiffviewFocusFiles",
  --     "DiffviewLog",
  --     "DiffviewOpen",
  --     "DiffviewRefresh",
  --     "DiffviewToggleFiles",
  --   },
  --   keys = {
  --     { "<leader>D", mode = "n", desc = "Diffview" },
  --     { "<leader>Dc", "<cmd>DiffviewClose<cr>", mode = "n", desc = "Diffview Close" },
  --     { "<leader>Df", "<cmd>DiffviewFocusFiles<cr>", mode = "n", desc = "Diffview Focus Files" },
  --     { "<leader>Dh", "<cmd>DiffviewFileHistory<cr>", mode = "n", desc = "Diffview File History" },

  --     { "<leader>Dm", "<cmd>DiffviewOpen main<cr>", mode = "n", desc = "Diffview Open <main>" },
  --     { "<leader>Do", "<cmd>DiffviewOpen<cr>", mode = "n", desc = "Diffview Open" },
  --     { "<leader>Dr", "<cmd>DiffviewRefresh<cr>", mode = "n", desc = "Diffview Refresh" },
  --     { "<leader>Dt", "<cmd>DiffviewToggleFiles<cr>", mode = "n", desc = "Diffview Toggle Files" },
  --   },
  -- },
  {
    "esmuellert/codediff.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = "CodeDiff",
    keys = {
      { "<leader>D", desc = "diff" },
      { "<leader>De", M.focus_explorer, mode = { "n" }, desc = "Diff Explorer focus" },
      { "<leader>DD", "<cmd>CodeDiff<cr>", mode = { "n" }, desc = "CodeDiff Explorer" },
      { "<leader>Df", "<cmd>CodeDiff file HEAD<cr>", mode = { "n" }, desc = "Diff file to HEAD" },
      { "<leader>Dh", "<cmd>CodeDiff history<cr>", mode = { "n" }, desc = "History of Diffs" },
      {
        "<leader>Dm",
        "<cmd>CodeDiff main<cr>",
        mode = { "n" },
        desc = "CodeDiff Explorer to main",
      },
      {
        "<leader>DU",
        "<cmd>CodeDiff upstream/main<cr>",
        mode = { "n" },
        desc = "CodeDiff Explorer to upstream/main",
      },
    },

    opts = {
      explorer = {
        view_mode = "tree",
        width = 60,
      },
      -- Highlight configuration
      -- highlights = {
      --   -- Line-level: accepts highlight group names or hex colors (e.g., "#2ea043")
      --   line_insert = "DiffAdd", -- Line-level insertions
      --   line_delete = "DiffDelete", -- Line-level deletions
      --
      --   -- Character-level: accepts highlight group names or hex colors
      --   -- If specified, these override char_brightness calculation
      --   char_insert = nil, -- Character-level insertions (nil = auto-derive)
      --   char_delete = nil, -- Character-level deletions (nil = auto-derive)
      --
      --   -- Brightness multiplier (only used when char_insert/char_delete are nil)
      --   -- nil = auto-detect based on background (1.4 for dark, 0.92 for light)
      --   char_brightness = nil, -- Auto-adjust based on your colorscheme
      --
      --   -- Conflict sign highlights (for merge conflict views)
      --   -- Accepts highlight group names or hex colors (e.g., "#f0883e")
      --   -- nil = use default fallback chain
      --   conflict_sign = nil, -- Unresolved: DiagnosticSignWarn -> #f0883e
      --   conflict_sign_resolved = nil, -- Resolved: Comment -> #6e7681
      --   conflict_sign_accepted = nil, -- Accepted: GitSignsAdd -> DiagnosticSignOk -> #3fb950
      --   conflict_sign_rejected = nil, -- Rejected: GitSignsDelete -> DiagnosticSignError -> #f85149
      -- },
    },
  },
}
