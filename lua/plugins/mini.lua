return {
  {
    "echasnovski/mini.indentscope",
    version = false,

    -- MiniIndentscopeSymbol xxx guifg=#4c4f69
    opts = function(_, opts)
      -- vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#acb0b0", bg = nil })
      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", vim.api.nvim_get_hl(0, { name = "Comment" }))
      -- symbol = "∶",
      -- symbol = "┊",
      opts.draw = {
        -- delay = 500,
        animation = require("mini.indentscope").gen_animation.none(),
      }
    end,
  },
  {
    "echasnovski/mini.statusline",
    version = false,
    opts = function(_, opts)
      return opts
    end,
  },
  {
    "echasnovski/mini-git",
    version = false,
    main = "mini.git",

    opts = function(_, opts)
      return opts
    end,
  },
  {
    "echasnovski/mini.diff",
    version = false,

    opts = function(_, opts)
      -- opts.view = {
      --   style = vim.go.number and "sign",
      -- }

      return opts
    end,
  },
  {
    "echasnovski/mini.icons",
    opts = {
      -- style = "ascii",
    },
    lazy = true,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        -- needed since it will be false when loading and mini will fail
        package.loaded["nvim-web-devicons"] = {}
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {
      modes = { insert = true, command = false, terminal = false },
      -- skip autopair when next character is one of these
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- skip autopair when the cursor is inside these treesitter nodes
      skip_ts = { "string" },
      -- skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = true,
      -- better deal with markdown code blocks
      markdown = true,
    },
    config = function(_, opts)
      LazyVim.mini.pairs(opts)
    end,
  },
}
