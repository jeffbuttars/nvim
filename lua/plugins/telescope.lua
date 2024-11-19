-- telescope-config.lua
local M = {}

-- package.path = package.path
--   .. ";"
--   .. vim.fn.expand("$HOME")
--   .. "/.luarocks/share/lua/5.1/?/init.lua;"
-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

-- We cache the results of "git rev-parse"
-- Process creation is expensive in Windows, so this reduces latency
-- local is_inside_work_tree = {}

-- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#live-grep-from-project-git-root-with-fallback
-- Live grep from project git root with fallback
-- M.project_files = function()
--   local opts = {} -- define here if you want to define something
--   local builtin = require("telescope.builtin")
--
--   local cwd = vim.fn.getcwd()
--   if is_inside_work_tree[cwd] == nil then
--     vim.fn.system("git rev-parse --is-inside-work-tree")
--     is_inside_work_tree[cwd] = vim.v.shell_error == 0
--   end
--
--   if is_inside_work_tree[cwd] then
--     builtin.git_files(opts)
--   else
--     builtin.find_files(opts)
--   end
-- end

-- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#find-files-from-project-git-root-with-fallback
-- Find files from project git root with fallback
-- This function is basically find_files() combined with git_files().
-- The appeal of this function over the default find_files() is that you can find files that are not tracked by git.
-- Also, find_files() only finds files in the current directory but this function finds files regardless of your current directory as long as you're in the project directory.
M.find_files_from_project_git_root = function()
  local opts = { hidden = true }

  local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
  end

  local function get_git_root()
    -- Look for .git folder or file. Will be a file if in worktree
    local dot_git_path = vim.fn.finddir(".git", ".;")
    local dot_git_path_f = vim.fn.findfile(".git", ".;")

    -- prefer the shorter(closest?) path
    if #dot_git_path_f < #dot_git_path then
      return vim.fn.fnamemodify(dot_git_path_f, ":h")
    end

    return vim.fn.fnamemodify(dot_git_path, ":h")
  end

  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
    }
    require("telescope.builtin").git_files(opts)
    return
  end

  local ff_fn = LazyVim.pick("files", { root = false })
  ff_fn(opts)
end

return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults.mappings.i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
      }
      opts.defaults.mappings.n = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
      }
      -- opts.defaults.mappings.n = {
      --   ["<C-p>"] = require("telescope.builtin").git_files,
      -- }

      opts.defaults.layout_strategy = "horizontal"
      opts.defaults.layout_config = {
        horizontal = {
          prompt_position = "top",
        },
      }
      opts.defaults.sorting_strategy = "ascending"
    end,
    keys = {
      {
        "<C-p>",
        function()
          M.find_files_from_project_git_root()
        end,
        -- require("telescope.builtin").git_files,
        desc = "Find Files in Git repo",
      },
    },
    -- keys = {
    --   { "<leader>sg", false },
    --   { "<leader>sG", false },
    --   { "<leader<space>", false },
    --   { "<leader<C-p>", false },
    --   { "<leader>,", false },
    --   { "<leader>/", false },
    --   { "<leader>:", false },
    --   { "<leader><space>", false },
    --   -- find
    --   { "<leader>fb", false },
    --   { "<leader>fc", false },
    --   { "<leader>ff", false },
    --   { "<leader>fF", false },
    --   { "<leader>fg", false },
    --   { "<leader>fr", false },
    --   { "<leader>fR", false },
    --   -- git
    --   { "<leader>gc", false },
    --   { "<leader>gs", false },
    --   -- search
    --   { '<leader>s"', false },
    --   { "<leader>sa", false },
    --   { "<leader>sb", false },
    --   { "<leader>sc", false },
    --   { "<leader>sC", false },
    --   { "<leader>sd", false },
    --   { "<leader>sD", false },
    --   { "<leader>sg", false },
    --   { "<leader>sG", false },
    --   { "<leader>sh", false },
    --   { "<leader>sH", false },
    --   { "<leader>sk", false },
    --   { "<leader>sM", false },
    --   { "<leader>sm", false },
    --   { "<leader>so", false },
    --   { "<leader>sR", false },
    --   { "<leader>sw", false },
    --   { "<leader>sW", false },
    --   { "<leader>sw", false },
    --   { "<leader>sW", false },
    --   { "<leader>uC", false },
    --   { "<leader>ss", false },
    --   { "<leader>sS", false },
    --   --   {
    --   --     "<leader><space>",
    --   --     function()
    --   --       M.find_files_from_project_git_root()
    --   --     end,
    --   --     desc = "Find Files",
    --   --   },
    -- },
  },
}
