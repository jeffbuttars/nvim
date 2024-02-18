-- telescope-config.lua
local M = {}

package.path = package.path
  .. ";"
  .. vim.fn.expand("$HOME")
  .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

-- We cache the results of "git rev-parse"
-- Process creation is expensive in Windows, so this reduces latency
local is_inside_work_tree = {}

-- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#live-grep-from-project-git-root-with-fallback
-- Live grep from project git root with fallback
M.project_files = function()
  local opts = {} -- define here if you want to define something
  local builtin = require("telescope.builtin")

  local cwd = vim.fn.getcwd()
  if is_inside_work_tree[cwd] == nil then
    vim.fn.system("git rev-parse --is-inside-work-tree")
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  if is_inside_work_tree[cwd] then
    builtin.git_files(opts)
  else
    builtin.find_files(opts)
  end
end

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
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
  end

  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
    }
  end

  require("telescope.builtin").find_files(opts)
end

return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = {
        sh = { "shellcheck" },
        python = { "ruff" },
        javascript = { "standardjs" },
      }
    end,
  },
  -- {
  --   -- Disable the floating command line input,
  --   -- Use the bottom line
  --   "folke/noice.nvim",
  --   enabled = false,
  --   opts = function(_, opts)
  --     opts.cmdline = { view = "cmdline" }
  --     opts.presets.bottom_search = true -- use a classic bottom cmdline for search
  --     opts.presets.command_palette = true -- position the cmdline and popupmenu together
  --   end,
  -- },
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
    end,
    -- keys = {
    --   {
    --     "<leader><space>",
    --     function()
    --       M.find_files_from_project_git_root()
    --     end,
    --     desc = "Find Files",
    --   },
    --   {
    --     "<C-p>",
    --     require("telescope.builtin").git_files,
    --     desc = "Find Files in Git repo",
    --   },
    --   -- {
    --   --   "<C-p>",
    --   --   "<cmd>Telescope git_files<cr>",
    --   --   desc = "Find Git Files",
    --   -- },
    -- },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "3rd/image.nvim",
        event = "VeryLazy",
        dependencies = {
          {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
              require("nvim-treesitter.configs").setup({
                ensure_installed = { "markdown" },
                highlight = { enable = true },
              })
            end,
          },
        },
        opts = {
          backend = "kitty",
          integrations = {
            markdown = {
              enabled = true,
              clear_in_insert_mode = false,
              download_remote_images = true,
              only_render_image_at_cursor = false,
              filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
            },
            neorg = {
              enabled = true,
              clear_in_insert_mode = false,
              download_remote_images = true,
              only_render_image_at_cursor = false,
              filetypes = { "norg" },
            },
          },
          max_width = nil,
          max_height = nil,
          max_width_window_percentage = nil,
          max_height_window_percentage = 50,
          kitty_method = "normal",
        },
      },
    },
    opts = {
      window = {
        auto_expand_width = true,
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
          ["e"] = {
            function()
              vim.api.nvim_exec("Neotree focus filesystem left", true)
            end,
            desc = "Focus File System",
          },
          ["b"] = {
            function()
              vim.api.nvim_exec("Neotree focus buffers left", true)
            end,
            desc = "Focus Buffers List",
          },
          ["g"] = {
            function()
              vim.api.nvim_exec("Neotree focus git_status left", true)
            end,
            desc = "Focus Git Status",
          },
        },
      },
      filesystem = {
        window = {
          mappings = {
            ["o"] = { command = "system_open", desc = "Open W/System" },
          },
        },

        commands = {
          system_open = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            -- macOs: open file in default application in the background.
            vim.fn.jobstart({ "xdg-open", "-g", path }, { detach = true })
            -- Linux: open file in default application
            vim.fn.jobstart({ "xdg-open", path }, { detach = true })
          end,
        },
      },

      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.wo.number = true
            vim.wo.relativenumber = true
          end,
        },
        {
          event = "file_opened",
          handler = function()
            require("neo-tree").close_all()
          end,
        },
      },
    },
  },
}
