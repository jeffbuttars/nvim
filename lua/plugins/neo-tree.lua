return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- {
      --   "3rd/image.nvim",
      --   cond = function()
      --     return not vim.g.neovide
      --   end,
      --   dependencies = {
      --     {
      --       "nvim-treesitter/nvim-treesitter",
      --       build = ":TSUpdate",
      --       config = function()
      --         require("nvim-treesitter.configs").setup({
      --           ensure_installed = { "markdown" },
      --           highlight = { enable = true },
      --         })
      --       end,
      --     },
      --   },
      --   opts = {
      --     backend = "kitty",
      --     integrations = {
      --       markdown = {
      --         enabled = true,
      --         clear_in_insert_mode = false,
      --         download_remote_images = true,
      --         only_render_image_at_cursor = false,
      --         filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
      --       },
      --       neorg = {
      --         enabled = true,
      --         clear_in_insert_mode = false,
      --         download_remote_images = true,
      --         only_render_image_at_cursor = false,
      --         filetypes = { "norg" },
      --       },
      --     },
      --     max_width = nil,
      --     max_height = nil,
      --     max_width_window_percentage = nil,
      --     max_height_window_percentage = 50,
      --     kitty_method = "normal",
      --   },
      -- },
    },
    opts = {
      window = {
        auto_expand_width = true,
        mappings = {
          -- ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
          ["P"] = { "toggle_preview", config = { use_float = true } },
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
          handler = function(file_path)
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    },
  },
}
