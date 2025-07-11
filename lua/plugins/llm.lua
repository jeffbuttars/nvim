-- local fmt = string.format

-- local constants = {
--   LLM_ROLE = "llm",
--   USER_ROLE = "user",
--   SYSTEM_ROLE = "system",
-- }

return {
  {
    "coder/claudecode.nvim",
    config = true,
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },

      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file to AI Ctx",
        ft = { "NvimTree", "neo-tree" },
      },
      { "<leader>ao", "<cmd>ClaudeCodeOpen<cr>", desc = "Open Claude" },
      { "<leader>ax", "<cmd>ClaudeCodeClose<cr>", desc = "Close Claude" },

      -- diff management
      { "<leader>aa", "<cmd>claudecodediffaccept<cr>", desc = "accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
    opts = {
      -- Terminal options
      terminal = {
        split_side = "right",
        split_width_percentage = 0.5,
        provider = "snacks", -- or "native"
      },
      -- Diff options
      diff_opts = {
        auto_close_on_accept = true,
        vertical_split = true,
        open_in_current_tab = false,
      },
    },
  },

  -- {
  --   "greggh/claude-code.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim", -- Required for git operations
  --   },
  --   config = function()
  --     require("claude-code").setup()
  --   end,
  --   -- opts = {
  --   --   -- Terminal window settings
  --   --   window = {
  --   --     split_ratio = 0.3, -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
  --   --     position = "botright", -- Position of the window: "botright", "topleft", "vertical", "rightbelow vsplit", etc.
  --   --     enter_insert = true, -- Whether to enter insert mode when opening Claude Code
  --   --     hide_numbers = true, -- Hide line numbers in the terminal window
  --   --     hide_signcolumn = true, -- Hide the sign column in the terminal window
  --   --   },
  --   --   -- File refresh settings
  --   --   refresh = {
  --   --     enable = true, -- Enable file change detection
  --   --     updatetime = 100, -- updatetime when Claude Code is active (milliseconds)
  --   --     timer_interval = 1000, -- How often to check for file changes (milliseconds)
  --   --     show_notifications = true, -- Show notification when files are reloaded
  --   --   },
  --   --   -- Git project settings
  --   --   git = {
  --   --     use_git_root = true, -- Set CWD to git root when opening Claude Code (if in git project)
  --   --   },
  --   --   -- Command settings
  --   --   command = "claude", -- Command used to launch Claude Code
  --   --   -- Command variants
  --   --   command_variants = {
  --   --     -- Conversation management
  --   --     continue = "--continue", -- Resume the most recent conversation
  --   --     resume = "--resume", -- Display an interactive conversation picker
  --   --
  --   --     -- Output options
  --   --     verbose = "--verbose", -- Enable verbose logging with full turn-by-turn output
  --   --   },
  --   --   -- Keymaps
  --   --   keymaps = {
  --   --     toggle = {
  --   --       normal = "<C-,>", -- Normal mode keymap for toggling Claude Code, false to disable
  --   --       terminal = "<C-,>", -- Terminal mode keymap for toggling Claude Code, false to disable
  --   --       variants = {
  --   --         continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
  --   --         verbose = "<leader>cV", -- Normal mode keymap for Claude Code with verbose flag
  --   --       },
  --   --     },
  --   --     window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
  --   --     scrolling = true, -- Enable scrolling keymaps (<C-f/b>) for page up/down
  --   --   },
  --   -- },
  -- },
  -- {
  --   "Davidyz/VectorCode",
  --   version = "*", -- optional, depending on whether you're on nightly or release
  --   build = "pipx upgrade vectorcode", -- optional but recommended if you set `version = "*"`
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   -- cmd = "VectorCode", -- if you're lazy-loading VectorCode
  -- },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   tabline = {
  --     lualine_y = {
  --       require("vectorcode.integrations").lualine({ show_job_count = false }),
  --     },
  --   },
  -- },
  -- {
  --   -- https://codecompanion.olimorris.dev/installation
  --   "olimorris/codecompanion.nvim",
  --   config = true,
  --   dependencies = {
  --     "j-hui/fidget.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     -- "Davidyz/VectorCode",
  --   },
  --   opts = {
  --     adapters = {
  --       anthropic = function()
  --         return require("codecompanion.adapters").extend("anthropic", {
  --           schema = {
  --             model = {
  --               default = "claude-3-7-sonnet-latest",
  --             },
  --           },
  --         })
  --       end,
  --       gemini = function()
  --         return require("codecompanion.adapters").extend("gemini", {
  --           schema = {
  --             model = {
  --               default = "gemini-2.5-pro-exp-03-25",
  --             },
  --           },
  --         })
  --       end,
  --     },
  --     -- https://codecompanion.olimorris.dev/configuration/introduction.html
  --     strategies = {
  --       chat = {
  --         -- adapter = "openai",
  --         -- adapter = "gemini",
  --         adapter = "anthropic",
  --         -- model = "gemini-2.5-pro-exp-03-25",
  --         -- tools = {
  --         --   vectorcode = {
  --         --     -- https://github.com/olimorris/dotfiles/blob/ac72e83757564a41fd36809dd72ac1b62031c5db/.config/nvim/lua/plugins/coding.lua#L256
  --         --     description = "Run VectorCode to retrieve the project context.",
  --         --     callback = function()
  --         --       return require("vectorcode.integrations").codecompanion.chat.make_tool()
  --         --     end,
  --         --   },
  --         -- },
  --         -- slash_commands = {
  --         --   -- add the vectorcode command here.
  --         --   codebase = require("vectorcode.integrations").codecompanion.chat.make_slash_command(),
  --         -- },
  --       },
  --       inline = {
  --         -- adapter = "openai",
  --         -- adapter = "gemini",
  --         adapter = "anthropic",
  --       },
  --       cmd = {
  --         -- adapter = "openai",
  --         -- adapter = "gemini",
  --         adapter = "anthropic",
  --       },
  --     },
  --     prompt_library = {
  --
  --       ["Generate a pull request message"] = {
  --         strategy = "chat",
  --         description = "Generate a pull request message",
  --         opts = {
  --           index = 11,
  --           is_default = true,
  --           is_slash_cmd = true,
  --           short_name = "pr",
  --           auto_submit = true,
  --         },
  --         prompts = {
  --           {
  --             role = constants.USER_ROLE,
  --             content = function()
  --               return fmt(
  --                 [[You are an expert at following the conventional pull request specification for GitHub. Given the git diff listed below, please generate a pull request message for me that fixes issue #%s:
  --
  -- ```diff
  -- %s
  -- ```
  -- ]],
  --
  --                 vim.fn.system("git rev-parse --abbrev-ref HEAD | grep -Po '^\\d+'"),
  --                 vim.fn.system("git diff --no-ext-diff $(git mainormaster)")
  --               )
  --             end,
  --             opts = {
  --               contains_code = true,
  --             },
  --           },
  --         },
  --       },
  --     },
  --   },
  --   init = function()
  --     -- Setup up the AI keymap group, you can use the `keys` attr to set them in the group
  --     local wk = require("which-key")
  --
  --     wk.add({
  --       { "<leader>a", group = "AI ", mode = { "n", "v" } },
  --       {
  --         "<leader>ac",
  --         function()
  --           require("codecompanion").toggle()
  --         end,
  --         mode = { "n", "v" },
  --         desc = "Chat",
  --       },
  --       {
  --         "<leader>aa",
  --         function()
  --           require("codecompanion").actions()
  --         end,
  --         mode = { "n", "v" },
  --         desc = "Actions",
  --       },
  --     })
  --
  --     require("plugins.codecompanion.fidget-spinner"):init()
  --   end,
  -- },
  -- {
  --   "augmentcode/augment.vim",
  --   init = function()
  --     vim.g.augment_workspace_folders = { "~/Dev/AwareView/main", "~/.config/nvim" }
  --     -- vim.g.augment_disable_tab_mapping = true
  --   end,
  -- },
}
