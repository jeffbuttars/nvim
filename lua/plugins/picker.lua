local Snacks = require("snacks")
local wk = require("which-key")
wk.add({ mode = "n", { "<leader>fo", "<cmd>Oil --float<cr><esc>", desc = "Oil" } })

return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        -- win = {
        --   width = 0,
        -- },
        sources = {
          explorer = {
            -- your explorer picker configuration comes here
            -- or leave it empty to use the default settings
            -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#explorer
            jump = { close = true },
            auto_close = true,
            -- layout = { preset = "vscode", preview = "main", width = 0 },
            -- layout = { preset = "sidebar", preview = "main", width = 0 },
            -- layout = { preset = "dropdown", preview = "main", width = 0 },
            -- layout = { preset = "vertical", preview = "main", width = 0 },
            layout = {
              preset = "sidebar",
              preview = "main",
              layout = { width = vim.o.columns / 4 },
            },
          },
        },
      },
    },

 -- stylua: ignore
  keys = {
    {
      "<leader><space>",
      function()
        if Snacks.git.get_root() then
          Snacks.picker.git_files({untracked = true})
          return
        end

        Snacks.picker.files({cwd = true})
      end,
      desc = "Find in Git repo or CWD",
      mode = {"n", "i"},
    },
  }
,
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      default_file_explorer = false,
      columns = {
        "icon",
        "permissions",
        "size",
        -- "mtime",
      },
      -- -- Window-local options to use for oil buffers
      win_options = {
        --   wrap = false,
        -- signcolumn = "yes",
        cursorcolumn = true,
        --   foldcolumn = "0",
        --   spell = false,
        --   list = false,
        --   conceallevel = 3,
        --   concealcursor = "nvic",
      },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  },
}

-- {
--   "nvim-neo-tree/neo-tree.nvim",
--   branch = "v3.x",
--   requires = {
--     "nvim-lua/plenary.nvim",
--     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
--     "MunifTanjim/nui.nvim",
--     "3rd/image.nvim",
--   },
--   -- dependencies = {
--   -- {
--   --   "3rd/image.nvim",
--   --   cond = function()
--   --     return not vim.g.neovide
--   --   end,
--   --   dependencies = {
--   --     {
--   --       "nvim-treesitter/nvim-treesitter",
--   --       build = ":TSUpdate",
--   --       config = function()
--   --         require("nvim-treesitter.configs").setup({
--   --           ensure_installed = { "markdown" },
--   --           highlight = { enable = true },
--   --         })
--   --       end,
--   --     },
--   --   },
--   --   opts = {
--   --     backend = "kitty",
--   --     integrations = {
--   --       markdown = {
--   --         enabled = true,
--   --         clear_in_insert_mode = false,
--   --         download_remote_images = true,
--   --         only_render_image_at_cursor = false,
--   --         filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
--   --       },
--   --       neorg = {
--   --         enabled = true,
--   --         clear_in_insert_mode = false,
--   --         download_remote_images = true,
--   --         only_render_image_at_cursor = false,
--   --         filetypes = { "norg" },
--   --       },
--   --     },
--   --     max_width = nil,
--   --     max_height = nil,
--   --     max_width_window_percentage = nil,
--   --     max_height_window_percentage = 50,
--   --     kitty_method = "normal",
--   --   },
--   -- },
--   -- },
--   opts = {
--     window = {
--       auto_expand_width = true,
--       mappings = {
--         ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
--         -- ["P"] = { "toggle_preview", config = { use_float = true } },
--         ["e"] = {
--           function()
--             vim.api.nvim_exec("Neotree focus filesystem left", true)
--           end,
--           desc = "Focus File System",
--         },
--         ["b"] = {
--           function()
--             vim.api.nvim_exec("Neotree focus buffers left", true)
--           end,
--           desc = "Focus Buffers List",
--         },
--         ["g"] = {
--           function()
--             vim.api.nvim_exec("Neotree focus git_status left", true)
--           end,
--           desc = "Focus Git Status",
--         },
--       },
--     },
--     filesystem = {
--       window = {
--         mappings = {
--           ["o"] = { command = "system_open", desc = "Open W/System" },
--         },
--       },
--
--       commands = {
--         system_open = function(state)
--           local node = state.tree:get_node()
--           local path = node:get_id()
--           -- macOs: open file in default application in the background.
--           vim.fn.jobstart({ "xdg-open", "-g", path }, { detach = true })
--           -- Linux: open file in default application
--           vim.fn.jobstart({ "xdg-open", path }, { detach = true })
--         end,
--       },
--     },
--
--     event_handlers = {
--       {
--         event = "neo_tree_buffer_enter",
--         handler = function()
--           vim.wo.number = true
--           vim.wo.relativenumber = true
--         end,
--       },
--       {
--         event = "file_opened",
--         handler = function(file_path)
--           require("neo-tree.command").execute({ action = "close" })
--         end,
--       },
--     },
--   },
-- },
-- }

-- Below for fzf-lua config
--
-- local Snacks = require("snacks")
-- local function is_git_repo()
--   vim.fn.system("git rev-parse --is-inside-work-tree")
--   return vim.v.shell_error == 0
-- end
--
-- return {
--   {
--     "ibhagwan/fzf-lua",
--     init = function()
--       -- overidde catppuccin theming if it's in use
--       local palette = require("catppuccin.palettes").get_palette()
--
--       if not palette then
--         return
--       end
--       -- latte
--       -- {
--       --   base = "#1e1e2e",
--       --   blue = "#89b4fa",
--       --   crust = "#11111b",
--       --   flamingo = "#f2cdcd",
--       --   green = "#a6e3a1",
--       --   lavender = "#b4befe",
--       --   mantle = "#181825",
--       --   maroon = "#eba0ac",
--       --   mauve = "#cba6f7",
--       --   overlay0 = "#6c7086",
--       --   overlay1 = "#7f849c",
--       --   overlay2 = "#9399b2",
--       --   peach = "#fab387",
--       --   pink = "#f5c2e7",
--       --   red = "#f38ba8",
--       --   rosewater = "#f5e0dc",
--       --   sapphire = "#74c7ec",
--       --   sky = "#89dceb",
--       --   subtext0 = "#a6adc8",
--       --   subtext1 = "#bac2de",
--       --   surface0 = "#313244",
--       --   surface1 = "#45475a",
--       --   surface2 = "#585b70",
--       --   teal = "#94e2d5",
--       --   text = "#cdd6f4",
--       --   yellow = "#f9e2af"
--       -- }
--
--       vim.api.nvim_set_hl(0, "FzfLuaCursorLine", { bg = palette.text, fg = palette.base })
--     end,
--     -- init = function()
--     --       -- require("lspconfig").typos_lsp.setup({})
--     --
--     --       -- disable/remap the LazyVim lsp/telescope key maps
--     --       -- https://www.lazyvim.org/plugins/lsp
--     --       -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/keymaps.lua
--     --       -- { "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, desc = "Goto Definition", has = "definition" },
--     --       -- { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
--     --       -- { "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, desc = "Goto Implementation" },
--     --       -- { "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, desc = "Goto T[y]pe Definition" },
--     --
--     --       local keys = require("lazyvim.plugins.lsp.keymaps").get()
--     --       keys[#keys + 1] = {
--     --         "gd",
--     --         function()
--     --           require("fzf-lua").lsp_definitions({ reuse_win = true, jump_to_single_result = true })
--     --           -- vim.lsp.buf.definition()
--     --         end,
--     --         desc = "Goto Definition",
--     --         has = "definition",
--     --       }
--     --       keys[#keys + 1] = {
--     --         "gI",
--     --         function()
--     --           require("fzf-lua").lsp_implementations({ reuse_win = true, jump_to_single_result = true })
--     --         end,
--     --         desc = "GoTo Implementation",
--     --       }
--     --       keys[#keys + 1] = {
--     --         "gy",
--     --         function()
--     --           require("fzf-lua").lsp_typedefs({ reuse_win = true, jump_to_single_result = true })
--     --         end,
--     --         desc = "Goto T[y]pe Definition",
--     --       }
--     --       keys[#keys + 1] = {
--     --         "gr",
--     --         function()
--     --           require("fzf-lua").lsp_references({ jump_to_single_result = true })
--     --         end,
--     --         desc = "References",
--     --       }
--     -- end,
--     --     opts = function(_, opts)
--     --       -- local actions = require("fzf-lua.actions")
--     --       require("fzf-lua").setup_fzfvim_cmds()
--     --     end,
--     keys = {
--       --       {
--       --         "<leader><space>",
--       --         function()
--       --           require("fzf-lua").files()
--       --         end,
--       --         desc = "Find Files from CWD",
--       --         silent = true,
--       --       },
--       {
--         "<C-p>",
--         function()
--           if is_git_repo() then
--             require("fzf-lua").git_files({ cwd = Snacks.git.get_root(), desc = "Git Files" })
--           end
--
--           require("fzf-lua").files({ desc = "Files" })
--         end,
--         desc = "Find Files in Git repo",
--         silent = true,
--       },
--       --       {
--       --         "<leader>,",
--       --         function()
--       --           require("fzf-lua").buffers({ sort_mru = true, sort_lastused = true })
--       --         end,
--       --         desc = "Select Buffer",
--       --       },
--       --       {
--       --         "<leader>/",
--       --         function()
--       --           require("fzf-lua").grep({ multiprocess = true })
--       --         end,
--       --         desc = "Grep (root dir)",
--       --       },
--       --       {
--       --         "<leader>:",
--       --         function()
--       --           require("fzf-lua").command_history()
--       --         end,
--       --         desc = "Search Command History",
--       --       },
--       --       -- -- find
--       --       {
--       --         "<leader>fb",
--       --         function()
--       --           require("fzf-lua").buffers({ sort_mru = true, sort_lastused = true })
--       --         end,
--       --         desc = "Buffers",
--       --       },
--       --       {
--       --         "<leader>fc",
--       --         function()
--       --           require("fzf-lua").files({ cwd = "~/.config/nvim" })
--       --         end,
--       --         desc = "Find Config File",
--       --       },
--       --       -- { "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
--       --       {
--       --         "<leader>ff",
--       --         function()
--       --           require("fzf-lua").files()
--       --         end,
--       --         desc = "Find Files (cwd)",
--       --       },
--       --       {
--       --         "<leader>fg",
--       --         function()
--       --           require("fzf-lua").git_files()
--       --         end,
--       --         desc = "Find Files (git-files)",
--       --       },
--       --       {
--       --         "<leader>fr",
--       --         function()
--       --           require("fzf-lua").oldfiles()
--       --         end,
--       --         desc = "Recent Files",
--       --       },
--       --       {
--       --         "<leader>fR",
--       --         function()
--       --           require("fzf-lua").oldfiles({ cwd = vim.loop.cwd() })
--       --         end,
--       --         desc = "Recent Files (cwd)",
--       --       },
--       --       -- -- git
--       --       {
--       --         "<leader>gc",
--       --         function()
--       --           require("fzf-lua").git_commits()
--       --         end,
--       --         desc = "commits",
--       --       },
--       --       {
--       --         "<leader>gs",
--       --         function()
--       --           require("fzf-lua").git_status()
--       --         end,
--       --         desc = "status",
--       --       },
--       --       -- -- search
--       --       {
--       --         '<leader>s"',
--       --         function()
--       --           require("fzf-lua").registers()
--       --         end,
--       --         desc = "Registers",
--       --       },
--       --       {
--       --         "<leader>sa",
--       --         function()
--       --           require("fzf-lua").autocmds()
--       --         end,
--       --         desc = "Auto Commands",
--       --       },
--       --       {
--       --         "<leader>sb",
--       --         function()
--       --           require("fzf-lua").grep_curbuf()
--       --         end,
--       --         desc = "Buffer",
--       --       },
--       --       {
--       --         "<leader>sc",
--       --         function()
--       --           require("fzf-lua").command_history()
--       --         end,
--       --         desc = "Command History",
--       --       },
--       --       {
--       --         "<leader>sC",
--       --         function()
--       --           require("fzf-lua").commands()
--       --         end,
--       --         desc = "Commands",
--       --       },
--       --       {
--       --         "<leader>sd",
--       --         function()
--       --           require("fzf-lua").diagnostics_document()
--       --         end,
--       --         desc = "Document diagnostics",
--       --       },
--       --       {
--       --         "<leader>sD",
--       --         function()
--       --           require("fzf-lua").diagnostics_workspace()
--       --         end,
--       --         desc = "Workspace diagnostics",
--       --       },
--       --       {
--       --         "<leader>sg",
--       --         function()
--       --           require("fzf-lua").live_grep({ multiprocess = true })
--       --         end,
--       --         desc = "Grep (cwd)",
--       --       },
--       --       {
--       --         "<leader>sG",
--       --         function()
--       --           require("fzf-lua").live_grep({ cwd = "~/", multiprocess = true })
--       --         end,
--       --         desc = "Grep (~/)",
--       --       },
--       --       {
--       --         "<leader>sh",
--       --         function()
--       --           require("fzf-lua").help_tags()
--       --         end,
--       --         desc = "Help Pages",
--       --       },
--       --       {
--       --         "<leader>sH",
--       --         function()
--       --           require("fzf-lua").highlights()
--       --         end,
--       --         desc = "Search Highlight Groups",
--       --       },
--       --       {
--       --         "<leader>sk",
--       --         function()
--       --           require("fzf-lua").keymaps()
--       --         end,
--       --         desc = "Key Maps",
--       --       },
--       --       {
--       --         "<leader>sM",
--       --         function()
--       --           require("fzf-lua").man_pages()
--       --         end,
--       --         desc = "Man Pages",
--       --       },
--       --       {
--       --         "<leader>sm",
--       --         function()
--       --           require("fzf-lua").marks()
--       --         end,
--       --         desc = "Jump to Mark",
--       --       },
--       --       -- { "<leader>so", function()
--       --       --     require("fzf-lua").options()
--       --       --   end, desc = "Options" },
--       --       {
--       --         "<leader>sR",
--       --         function()
--       --           -- require("fzf-lua").resume()
--       --           require("fzf-lua").live_grep({ multiprocess = true, resume = true })
--       --         end,
--       --         desc = "Resume",
--       --       },
--       --       {
--       --         "<leader>sw",
--       --         function()
--       --           require("fzf-lua").grep_cword()
--       --         end,
--       --         desc = "Word @ Cursor",
--       --       },
--       --       -- {
--       --       --   "<leader>sW",
--       --       --   Util.telescope("grep_string", { cwd = false, word_match = "-w" }),
--       --       --   desc = "Word (cwd)",
--       --       -- },
--       --       {
--       --         "<leader>sw",
--       --         function()
--       --           require("fzf-lua").grep_visual()
--       --         end,
--       --         mode = "v",
--       --         desc = "Visual Selection",
--       --       },
--       --       -- {
--       --       --   "<leader>sW",
--       --       --   Util.telescope("grep_string", { cwd = false }),
--       --       --   mode = "v",
--       --       --   desc = "Selection (cwd)",
--       --       -- },
--       --       {
--       --         "<leader>uC",
--       --         function()
--       --           require("fzf-lua").colorschemes()
--       --         end,
--       --         desc = "Colorscheme with preview",
--       --       },
--       --       {
--       --         "<leader>ss",
--       --         function()
--       --           require("fzf-lua").lsp_document_symbols({
--       --             symbols = require("lazyvim.config").get_kind_filter(),
--       --           })
--       --         end,
--       --         desc = "Goto Symbol",
--       --       },
--       --       {
--       --         "<leader>sS",
--       --         function()
--       --           require("telescope.builtin").lsp_workspace_symbols({
--       --             symbols = require("lazyvim.config").get_kind_filter(),
--       --           })
--       --         end,
--       --         desc = "Goto Symbol (Workspace)",
--       --       },
--     },
--   },
-- }

-- -- telescope-config.lua
-- local M = {}
-- local Snacks = require("snacks")
--
-- -- package.path = package.path
-- --   .. ";"
-- --   .. vim.fn.expand("$HOME")
-- --   .. "/.luarocks/share/lua/5.1/?/init.lua;"
-- -- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
--
-- -- We cache the results of "git rev-parse"
-- -- Process creation is expensive in Windows, so this reduces latency
-- -- local is_inside_work_tree = {}
--
-- -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#live-grep-from-project-git-root-with-fallback
-- -- Live grep from project git root with fallback
-- -- M.project_files = function()
-- --   local opts = {} -- define here if you want to define something
-- --   local builtin = require("telescope.builtin")
-- --
-- --   local cwd = vim.fn.getcwd()
-- --   if is_inside_work_tree[cwd] == nil then
-- --     vim.fn.system("git rev-parse --is-inside-work-tree")
-- --     is_inside_work_tree[cwd] = vim.v.shell_error == 0
-- --   end
-- --
-- --   if is_inside_work_tree[cwd] then
-- --     builtin.git_files(opts)
-- --   else
-- --     builtin.find_files(opts)
-- --   end
-- -- end
--
-- -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#find-files-from-project-git-root-with-fallback
-- -- Find files from project git root with fallback
-- -- This function is basically find_files() combined with git_files().
-- -- The appeal of this function over the default find_files() is that you can find files that are not tracked by git.
-- -- Also, find_files() only finds files in the current directory but this function finds files regardless of your current directory as long as you're in the project directory.
-- M.find_files_from_project_git_root = function()
--   -- local opts = require("telescope.themes").get_ivy({ hidden = true })
--   -- local opts = require("telescope.themes").get_cursor({ hidden = true })
--   local opts = { hidden = true }
--
--   local function is_git_repo()
--     vim.fn.system("git rev-parse --is-inside-work-tree")
--     return vim.v.shell_error == 0
--   end
--
--   -- local function get_git_root()
--   --   -- Look for .git folder or file. Will be a file if in worktree
--   --   local dot_git_path = vim.fn.finddir(".git", ".;")
--   --   local dot_git_path_f = vim.fn.findfile(".git", ".;")
--   --
--   --   -- prefer the shorter(closest?) path
--   --   if #dot_git_path_f < #dot_git_path then
--   --     return vim.fn.fnamemodify(dot_git_path_f, ":h")
--   --   end
--   --
--   --   return vim.fn.fnamemodify(dot_git_path, ":h")
--   -- end
--
--   if is_git_repo() then
--     -- opts.cwd = get_git_root()
--     opts.cwd = Snacks.git.get_root()
--
--     require("telescope.builtin").git_files(opts)
--     return
--   end
--
--   local ff_fn = LazyVim.pick("files", { root = false })
--   ff_fn(opts)
-- end

-- {
--   "nvim-telescope/telescope.nvim",
--   opts = function(_, opts)
--     require("telescope").setup({
--       pickers = {
--         find_files = {
--           theme = "ivy",
--           layout_config = {
--             height = 0.7,
--           },
--         },
--         git_files = {
--           theme = "ivy",
--           layout_config = {
--             height = 0.7,
--           },
--         },
--       },
--     })
--
--     opts.defaults.mappings.i = {
--       ["<C-j>"] = require("telescope.actions").move_selection_next,
--       ["<C-k>"] = require("telescope.actions").move_selection_previous,
--     }
--     opts.defaults.mappings.n = {
--       ["<C-j>"] = require("telescope.actions").move_selection_next,
--       ["<C-k>"] = require("telescope.actions").move_selection_previous,
--     }
--     -- opts.defaults.mappings.n = {
--     --   ["<C-p>"] = require("telescope.builtin").git_files,
--     -- }
--
--     opts.defaults.layout_strategy = "horizontal"
--     opts.defaults.layout_config = {
--       horizontal = {
--         prompt_position = "top",
--       },
--     }
--     opts.defaults.sorting_strategy = "ascending"
--   end,
--   keys = {
--     {
--       "<C-p>",
--       function()
--         M.find_files_from_project_git_root()
--       end,
--       -- require("telescope.builtin").git_files,
--       desc = "Find Files in Git repo",
--     },
--     {
--       "<leader>fh",
--       require("telescope.builtin").help_tags,
--       desc = "Find Help",
--     },
--   },
--   -- keys = {
--   --   { "<leader>sg", false },
--   --   { "<leader>sG", false },
--   --   { "<leader<space>", false },
--   --   { "<leader<C-p>", false },
--   --   { "<leader>,", false },
--   --   { "<leader>/", false },
--   --   { "<leader>:", false },
--   --   { "<leader><space>", false },
--   --   -- find
--   --   { "<leader>fb", false },
--   --   { "<leader>fc", false },
--   --   { "<leader>ff", false },
--   --   { "<leader>fF", false },
--   --   { "<leader>fg", false },
--   --   { "<leader>fr", false },
--   --   { "<leader>fR", false },
--   --   -- git
--   --   { "<leader>gc", false },
--   --   { "<leader>gs", false },
--   --   -- search
--   --   { '<leader>s"', false },
--   --   { "<leader>sa", false },
--   --   { "<leader>sb", false },
--   --   { "<leader>sc", false },
--   --   { "<leader>sC", false },
--   --   { "<leader>sd", false },
--   --   { "<leader>sD", false },
--   --   { "<leader>sg", false },
--   --   { "<leader>sG", false },
--   --   { "<leader>sh", false },
--   --   { "<leader>sH", false },
--   --   { "<leader>sk", false },
--   --   { "<leader>sM", false },
--   --   { "<leader>sm", false },
--   --   { "<leader>so", false },
--   --   { "<leader>sR", false },
--   --   { "<leader>sw", false },
--   --   { "<leader>sW", false },
--   --   { "<leader>sw", false },
--   --   { "<leader>sW", false },
--   --   { "<leader>uC", false },
--   --   { "<leader>ss", false },
--   --   { "<leader>sS", false },
--   --   --   {
--   --   --     "<leader><space>",
--   --   --     function()
--   --   --       M.find_files_from_project_git_root()
--   --   --     end,
--   --   --     desc = "Find Files",
--   --   --   },
--   -- },
-- },
