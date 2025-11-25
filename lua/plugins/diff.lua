return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = {
      "DiffviewClose",
      "DiffviewFileHistory",
      "DiffviewFocusFiles",
      "DiffviewLog",
      "DiffviewOpen",
      "DiffviewRefresh",
      "DiffviewToggleFiles",
    },
    keys = {
      { "<leader>D", mode = "n", desc = "Diffview" },
      { "<leader>Dc", "<cmd>DiffviewClose<cr>", mode = "n", desc = "Diffview Close" },
      { "<leader>Df", "<cmd>DiffviewFocusFiles<cr>", mode = "n", desc = "Diffview Focus Files" },
      { "<leader>Dh", "<cmd>DiffviewFileHistory<cr>", mode = "n", desc = "Diffview File History" },
      { "<leader>Dl", "<cmd>DiffviewLog<cr>", mode = "n", desc = "Diffview Log" },
      { "<leader>Dm", "<cmd>DiffviewOpen main<cr>", mode = "n", desc = "Diffview Open <main>" },
      { "<leader>Do", "<cmd>DiffviewOpen<cr>", mode = "n", desc = "Diffview Open" },
      { "<leader>Dr", "<cmd>DiffviewRefresh<cr>", mode = "n", desc = "Diffview Refresh" },
      { "<leader>Dt", "<cmd>DiffviewToggleFiles<cr>", mode = "n", desc = "Diffview Toggle Files" },
    },
  },
  {
    "esmuellert/vscode-diff.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    keys = {
      { "<leader>DD", "<cmd>CodeDiff<cr>", mode = { "n" }, desc = "CodeDiff" },
      { "<leader>DM", "<cmd>CodeDiff main<cr>", mode = { "n" }, desc = "CodeDiff main" },
      {
        "<leader>DU",
        "<cmd>CodeDiff upstream/main<cr>",
        mode = { "n" },
        desc = "CodeDiff upstream/main",
      },
    },
  },
}
