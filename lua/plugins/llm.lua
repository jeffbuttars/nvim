return {
  -- GPT
  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
    lazy = "VeryLazy",
    cmd = { "ChatGPT", "ChatGPTRun", "ChatGPTEditWithInstruction", "ChatGPTActAs" },

    init = function()
      -- Setup up some keymaps
      local wk = require("which-key")

      wk.add({
        { "<leader>a", group = "AI" },
        {
          mode = { "n", "v" },
          { "<leader>aC", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
          { "<leader>az", "<cmd>ChatGPTActAs<CR>", desc = "ChatGPTActAs", mode = { "n" } },
          { "<leader>ae", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
          { "<leader>ag", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
          { "<leader>at", "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
          { "<leader>aa", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
          { "<leader>ad", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
          { "<leader>af", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
          { "<leader>ak", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
          {
            "<leader>al",
            "<cmd>ChatGPTRun code_readability_analysis<CR>",
            desc = "Code Readability Analysis",
          },
          { "<leader>ao", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
          { "<leader>ar", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
          { "<leader>as", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
          { "<leader>ax", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
        },
      })
      --   , {
      --   ["<leader>a"] = {
      --     name = "AI",
      --     mode = { "n", "v" },
      --     c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
      --     z = { "<cmd>ChatGPTActAs<CR>", "ChatGPTActAs", mode = { "n" } },
      --     e = {
      --       "<cmd>ChatGPTEditWithInstruction<CR>",
      --       "Edit with instruction",
      --       mode = { "n", "v" },
      --     },
      --     g = {
      --       "<cmd>ChatGPTRun grammar_correction<CR>",
      --       "Grammar Correction",
      --       mode = { "n", "v" },
      --     },
      --     t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
      --     k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
      --     d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
      --     a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
      --     o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
      --     s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
      --     f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
      --     x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
      --     r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
      --     l = {
      --       "<cmd>ChatGPTRun code_readability_analysis<CR>",
      --       "Code Readability Analysis",
      --       mode = { "n", "v" },
      --     },
      --   },
      -- }
    end,
    opts = {
      api_key_cmd = nil,
      yank_register = "+",
      edit_with_instructions = {
        diff = false,
        keymaps = {
          close = "<C-c>",
          accept = "<C-y>",
          toggle_diff = "<C-d>",
          toggle_settings = "<C-o>",
          cycle_windows = "<Tab>",
          use_output_as_input = "<C-i>",
        },
      },
      chat = {
        welcome_message = "WELCOME_MESSAGE",
        loading_text = "Loading, please wait ...",
        question_sign = "",
        answer_sign = "ﮧ",
        max_line_length = 120,
        sessions_window = {
          border = {
            style = "rounded",
            text = {
              top = " Sessions ",
            },
          },
          win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
        },
        keymaps = {
          close = { "<C-c>" },
          yank_last = "<C-S-y>",
          yank_last_code = "<C-y>",
          scroll_up = "<C-u>",
          scroll_down = "<C-d>",
          new_session = "<C-n>",
          cycle_windows = "<Tab>",
          cycle_modes = "<C-f>",
          select_session = "<Space>",
          rename_session = "r",
          delete_session = "d",
          draft_message = "<C-d>",
          toggle_settings = "<C-o>",
          toggle_message_role = "<C-r>",
          toggle_system_role_open = "<C-s>",
          stop_generating = "<C-x>",
        },
      },
      popup_layout = {
        default = "center",
        center = {
          width = "80%",
          height = "80%",
        },
        right = {
          width = "30%",
          width_settings_open = "50%",
        },
      },
      popup_window = {
        border = {
          highlight = "FloatBorder",
          style = "rounded",
          text = {
            top = " ChatGPT ",
          },
        },
        win_options = {
          wrap = true,
          linebreak = true,
          foldcolumn = "1",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
        buf_options = {
          filetype = "markdown",
        },
      },
      system_window = {
        border = {
          highlight = "FloatBorder",
          style = "rounded",
          text = {
            top = " SYSTEM ",
          },
        },
        win_options = {
          wrap = true,
          linebreak = true,
          foldcolumn = "2",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
      },
      popup_input = {
        prompt = "  ",
        border = {
          highlight = "FloatBorder",
          style = "rounded",
          text = {
            top_align = "center",
            top = " Prompt ",
          },
        },
        win_options = {
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
        submit = "<C-Enter>",
        submit_n = "<Enter>",
        max_visible_lines = 20,
      },
      settings_window = {
        border = {
          style = "rounded",
          text = {
            top = " Settings ",
          },
        },
        win_options = {
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
      },
      openai_params = {
        -- -- model = "gpt-3.5-turbo", max_tokens = 300,
        -- -- model = "gpt-4-32k",  -- 32.768 max tokens
        -- model = "gpt-4",
        -- model = "gpt-4-1106-preview",
        -- model = "gpt-3.5-turbo",
        -- model = "gpt-4",
        -- model = "gpt-4-turbo",
        model = "gpt-4o",
        max_tokens = 2048,
        -- max_tokens = 400,
        frequency_penalty = 0,
        presence_penalty = 0,
        temperature = 0,
        top_p = 1,
        n = 1,
      },
      openai_edit_params = {
        -- model = "code-davinci-edit-001",
        model = "gpt-3.5-turbo",
        temperature = 0,
        top_p = 1,
        n = 1,
      },
      -- actions_paths = { "~./config/nvim/lua/plugins/chatgpt_actions.json" },
      show_quickfixes_cmd = "Trouble quickfix",
      predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv",
    },
  },
  {
    "Exafunction/codeium.nvim",
    --   opts = {
    --     enable_cmp_source = true,
    --     virtual_text = {
    --       enabled = true,
    --       manual = true,
    --     },
    --     enable_chat = true,
    --   },
    init = function()
      -- Setup up some keymaps
      require("which-key").add({
        mode = { "n", "v" },
        {
          "<leader>ac",
          "<cmd>Codeium Chat<CR>",
          desc = "Codeium Chat",
          icon = "",
        },
      })

      require("which-key").add({
        mode = { "n", "i" },
        {
          "\\av",
          function()
            if vim.fn.pumvisible() == 1 then
              vim.api.nvim_input("<C-e>")
            end
            require("codeium.virtual_text").cycle_or_complete()
          end,
          desc = "Codeium Virtual Text",
          icon = "",
        },
      })
    end,
  },
}
