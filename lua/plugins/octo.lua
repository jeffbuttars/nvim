-- GH Cli required: https://cli.github.com/
return {
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ibhagwan/fzf-lua",
      -- OR "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = function(_, opts)
      opts.picker = "fzf-lua"
      opts.picker_config = { use_emojis = true }

      local wk = require("which-key")
      wk.register({
        ["<leader>gO"] = {
          name = "Octo - GitHub",
          mode = { "n" },
          ["i"] = {
            name = "Issue",
            b = { "<cmd>Octo issue browser<CR>", "Browser", mode = { "n" } },
            c = { "<cmd>Octo issue create<CR>", "Create", mode = { "n" } },
            x = { "<cmd>Octo issue close<CR>", "Close", mode = { "n" } },
            e = { "<cmd>Octo issue edit<CR>", "Edit", mode = { "n" } },
            l = { "<cmd>Octo issue list<CR>", "List", mode = { "n" } },
            R = { "<cmd>Octo issue reload<CR>", "Reload", mode = { "n" } },
            o = { "<cmd>Octo issue reopeon<CR>", "Re Open", mode = { "n" } },
            s = { "<cmd>Octo issue search<CR>", "Search", mode = { "n" } },
            u = { "<cmd>Octo issue url<CR>", "URL", mode = { "n" } },
          },
          ["p"] = {
            name = "PR",
            b = { "<cmd>Octo pr browser<CR>", "Browser", mode = { "n" } },
            c = { "<cmd>Octo pr create<CR>", "Create", mode = { "n" } },
            x = { "<cmd>Octo pr close<CR>", "Close", mode = { "n" } },
            C = { "<cmd>Octo pr checkout<CR>", "Checkout", mode = { "n" } },
            ["lc"] = { "<cmd>Octo pr commits<CR>", "List Commits", mode = { "n" } },
            ["ll"] = { "<cmd>Octo pr list<CR>", "List", mode = { "n" } },
            ["ld"] = { "<cmd>Octo pr changes<CR>", "List Changes / Diffs", mode = { "n" } },
            ["lC"] = { "<cmd>Octo pr checks<CR>", "List Checks", mode = { "n" } },
            d = { "<cmd>Octo pr diff<CR>", "Diff", mode = { "n" } },
            D = { "<cmd>Octo pr draft<CR>", "Draft", mode = { "n" } },
            e = { "<cmd>Octo pr edit<CR>", "Edit", mode = { "n" } },
            m = { "<cmd>Octo pr merge<CR>", "Merge [commit|rebase|squash|delete]", mode = { "n" } },
            r = { "<cmd>Octo pr reader<CR>", "Ready", mode = { "n" } },
            R = { "<cmd>Octo pr reload<CR>", "Reload", mode = { "n" } },
            o = { "<cmd>Octo pr reopeon<CR>", "Re Open", mode = { "n" } },
            s = { "<cmd>Octo pr search<CR>", "Search", mode = { "n" } },
            u = { "<cmd>Octo pr url<CR>", "URL", mode = { "n" } },
          },
          ["r"] = {
            name = "Repo",
            b = { "<cmd>Octo repo browser<CR>", "Browser", mode = { "n" } },
            f = { "<cmd>Octo repo fork<CR>", "Fork", mode = { "n" } },
            l = { "<cmd>Octo repo list<CR>", "List", mode = { "n" } },
            u = { "<cmd>Octo repo url<CR>", "URL", mode = { "n" } },
            v = { "<cmd>Octo repo view<CR>", "View", mode = { "n" } },
          },
          ["g"] = {
            name = "Gist",
            l = { "<cmd>Octo gist list<CR>", "List", mode = { "n" } },
          },
          s = { "<cmd>Octo search<CR>", "Search", mode = { "n" } },
        },
      })
    end,
  },
}
