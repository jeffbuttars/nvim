local fmt = string.format

local constants = {
  LLM_ROLE = "llm",
  USER_ROLE = "user",
  SYSTEM_ROLE = "system",
}

return {
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
  {
    -- https://codecompanion.olimorris.dev/installation
    "olimorris/codecompanion.nvim",
    config = true,
    dependencies = {
      "j-hui/fidget.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- "Davidyz/VectorCode",
    },
    opts = {
      adapters = {
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            schema = {
              model = {
                default = "gemini-2.5-pro-exp-03-25",
              },
            },
          })
        end,
      },
      -- https://codecompanion.olimorris.dev/configuration/introduction.html
      strategies = {
        chat = {
          -- adapter = "openai",
          adapter = "gemini",
          -- model = "gemini-2.5-pro-exp-03-25",
          -- tools = {
          --   vectorcode = {
          --     -- https://github.com/olimorris/dotfiles/blob/ac72e83757564a41fd36809dd72ac1b62031c5db/.config/nvim/lua/plugins/coding.lua#L256
          --     description = "Run VectorCode to retrieve the project context.",
          --     callback = function()
          --       return require("vectorcode.integrations").codecompanion.chat.make_tool()
          --     end,
          --   },
          -- },
          -- slash_commands = {
          --   -- add the vectorcode command here.
          --   codebase = require("vectorcode.integrations").codecompanion.chat.make_slash_command(),
          -- },
        },
        inline = {
          -- adapter = "openai",
          adapter = "gemini",
        },
        cmd = {
          -- adapter = "openai",
          adapter = "gemini",
        },
      },
      prompt_library = {

        ["Generate a pull request message"] = {
          strategy = "chat",
          description = "Generate a pull request message",
          opts = {
            index = 11,
            is_default = true,
            is_slash_cmd = true,
            short_name = "pr",
            auto_submit = true,
          },
          prompts = {
            {
              role = constants.USER_ROLE,
              content = function()
                return fmt(
                  [[You are an expert at following the conventional pull request specification for GitHub. Given the git diff listed below, please generate a pull request message for me that fixes issue #%s:

  ```diff
  %s
  ```
  ]],

                  vim.fn.system("git rev-parse --abbrev-ref HEAD | grep -Po '^\\d+'"),
                  vim.fn.system("git diff --no-ext-diff $(git mainormaster)")
                )
              end,
              opts = {
                contains_code = true,
              },
            },
          },
        },
      },
    },
    init = function()
      -- Setup up the AI keymap group, you can use the `keys` attr to set them in the group
      local wk = require("which-key")

      wk.add({
        { "<leader>a", group = "AI ", mode = { "n", "v" } },
        {
          "<leader>ac",
          function()
            require("codecompanion").toggle()
          end,
          mode = { "n", "v" },
          desc = "Chat",
        },
        {
          "<leader>aa",
          function()
            require("codecompanion").actions()
          end,
          mode = { "n", "v" },
          desc = "Actions",
        },
      })

      require("plugins.codecompanion.fidget-spinner"):init()
    end,
  },
  -- {
  --   "Exafunction/codeium.nvim",
  --   opts = {
  --     --     enable_cmp_source = true,
  --     --     virtual_text = {
  --     --       enabled = true,
  --     --       manual = true,
  --     --     },
  --     enable_chat = true,
  --   },
  --   -- init = function()
  --   --   -- Setup up some keymaps
  --   --   require("which-key").add({
  --   --     { "<leader>a", group = "AI" },
  --   --     {
  --   --       mode = { "n", "v" },
  --   --       {
  --   --         "<leader>ac",
  --   --         "<cmd>Codeium Chat<CR>",
  --   --         desc = "Codeium Chat",
  --   --         icon = "",
  --   --       },
  --   --     },
  --   --   })
  --   --
  --   --   -- require("which-key").add({
  --   --   --   mode = { "n", "i" },
  --   --   --   {
  --   --   --     "\\
  --   --   --     "\\av",
  --   --   --     function()
  --   --   --       if vim.fn.pumvisible() == 1 then
  --   --   --         vim.api.nvim_input("<C-e>")
  --   --   --       end
  --   --   --       require("codeium.virtual_text").cycle_or_complete()
  --   --   --     end,
  --   --   --     desc = "Codeium Virtual Text",
  --   --   --     icon = "",
  --   --   --   },
  --   --   -- })
  --   -- end,
  -- },
}
