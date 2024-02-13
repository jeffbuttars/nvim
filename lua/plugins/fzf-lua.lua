return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- build = "./install --bin",
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({ "fzf-lua" })
    end,
    opts = function(_, opts)
      require("fzf-lua").setup_fzfvim_cmds()
    end,
    keys = {
      {
        "<leader><space>",
        function()
          require("fzf-lua").files()
        end,
        desc = "Find Files from CWD",
        silent = true,
      },
      {
        "<C-p>",
        function()
          require("fzf-lua").git_files()
        end,
        desc = "Find Files in Git repo",
        silent = true,
      },
      {
        "<leader>,",
        function()
          require("fzf-lua").buffers()
        end,
        desc = "Select Buffer",
      },
      {
        "<leader>/",
        function()
          require("fzf-lua").grep({ multiprocess = true })
        end,
        desc = "Grep (root dir)",
      },
      {
        "<leader>:",
        function()
          require("fzf-lua").command_history()
        end,
        desc = "Search Command History",
      },
      -- -- find
      {
        "<leader>fb",
        function()
          require("fzf-lua").buffers({ sort_mru = true, sort_lastused = true })
        end,
        desc = "Buffers",
      },
      {
        "<leader>fc",
        function()
          require("fzf-lua").files({ cwd = "~/.config/nvim" })
        end,
        desc = "Find Config File",
      },
      -- { "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
      {
        "<leader>ff",
        function()
          require("fzf-lua").files()
        end,
        desc = "Find Files (cwd)",
      },
      {
        "<leader>fg",
        function()
          require("fzf-lua").git_files()
        end,
        desc = "Find Files (git-files)",
      },
      {
        "<leader>fr",
        function()
          require("fzf-lua").oldfiles()
        end,
        desc = "Recent Files",
      },
      {
        "<leader>fR",
        function()
          require("fzf-lua").oldfiles({ cwd = vim.loop.cwd() })
        end,
        desc = "Recent Files (cwd)",
      },
      -- -- git
      {
        "<leader>gc",
        function()
          require("fzf-lua").git_commits()
        end,
        desc = "commits",
      },
      {
        "<leader>gs",
        function()
          require("fzf-lua").git_status()
        end,
        desc = "status",
      },
      -- -- search
      {
        '<leader>s"',
        function()
          require("fzf-lua").registers()
        end,
        desc = "Registers",
      },
      {
        "<leader>sa",
        function()
          require("fzf-lua").autocmds()
        end,
        desc = "Auto Commands",
      },
      {
        "<leader>sb",
        function()
          require("fzf-lua").grep_curbuf()
        end,
        desc = "Buffer",
      },
      {
        "<leader>sc",
        function()
          require("fzf-lua").command_history()
        end,
        desc = "Command History",
      },
      {
        "<leader>sC",
        function()
          require("fzf-lua").commands()
        end,
        desc = "Commands",
      },
      {
        "<leader>sd",
        function()
          require("fzf-lua").diagnostics_document()
        end,
        desc = "Document diagnostics",
      },
      {
        "<leader>sD",
        function()
          require("fzf-lua").diagnostics_workspace()
        end,
        desc = "Workspace diagnostics",
      },
      {
        "<leader>sg",
        function()
          require("fzf-lua").grep({ multiprocess = true })
        end,
        desc = "Grep (cwd)",
      },
      {
        "<leader>sG",
        function()
          require("fzf-lua").grep({ cwd = "~/", multiprocess = true })
        end,
        desc = "Grep (~/)",
      },
      {
        "<leader>sh",
        function()
          require("fzf-lua").help_tags()
        end,
        desc = "Help Pages",
      },
      {
        "<leader>sH",
        function()
          require("fzf-lua").highlights()
        end,
        desc = "Search Highlight Groups",
      },
      {
        "<leader>sk",
        function()
          require("fzf-lua").keymaps()
        end,
        desc = "Key Maps",
      },
      {
        "<leader>sM",
        function()
          require("fzf-lua").man_pages()
        end,
        desc = "Man Pages",
      },
      {
        "<leader>sm",
        function()
          require("fzf-lua").marks()
        end,
        desc = "Jump to Mark",
      },
      -- { "<leader>so", function()
      --     require("fzf-lua").options()
      --   end, desc = "Options" },
      {
        "<leader>sR",
        function()
          require("fzf-lua").resume()
        end,
        desc = "Resume",
      },
      {
        "<leader>sw",
        function()
          require("fzf-lua").grep_cword()
        end,
        desc = "Word @ Cursor",
      },
      -- {
      --   "<leader>sW",
      --   Util.telescope("grep_string", { cwd = false, word_match = "-w" }),
      --   desc = "Word (cwd)",
      -- },
      {
        "<leader>sw",
        function()
          require("fzf-lua").grep_visual()
        end,
        mode = "v",
        desc = "Visual Selection",
      },
      -- {
      --   "<leader>sW",
      --   Util.telescope("grep_string", { cwd = false }),
      --   mode = "v",
      --   desc = "Selection (cwd)",
      -- },
      {
        "<leader>uC",
        function()
          require("fzf-lua").colorschemes()
        end,
        desc = "Colorscheme with preview",
      },
      {
        "<leader>ss",
        function()
          require("fzf-lua").lsp_document_symbols({
            symbols = require("lazyvim.config").get_kind_filter(),
          })
        end,
        desc = "Goto Symbol",
      },
      {
        "<leader>sS",
        function()
          require("telescope.builtin").lsp_workspace_symbols({
            symbols = require("lazyvim.config").get_kind_filter(),
          })
        end,
        desc = "Goto Symbol (Workspace)",
      },
    },
  },
}
