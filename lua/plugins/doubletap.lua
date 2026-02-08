return {
  {
<<<<<<< HEAD
    "https://codeberg.org/pr0x/DoubleTap",

    -- This tells lazy.nvim it's a local plugin, not from GitHub
    -- name = "DoubleTap",
    -- dir = "~/Dev/DoubleTap/",
    enabled = true,

    -- opts = {
    --   debug = true,
    -- },
  },
=======
    "tjdevries/vlog.nvim",
  },
  {
    "DoubleTap.nvim",
    -- This tells lazy.nvim it's a local plugin, not from GitHub
    -- dir = vim.fn.stdpath("config") .. "/rplugin/go/custom",
    name = "DoubleTap.nvim",
    dir = "~/Dev/DoubleTap.nvim/",

    deps = { "tjdevries/vlog.nvim" },

    opts = {
      debug = true,
    },
  },
  --
  -- Don't lazy load - we want it available immediately
  -- lazy = false,
  --
  --   -- config = function()
  --   --   vim.print("hycmd config func")
  --   --   -- require("hycmd").setup({ binary_path = "/home/jeff/Dev/hycmd/hycmd" })
  --   --   require("hycmd").setup({})
  --   -- end,
  --
  --   --   -- Path to your compiled Go binary
  --   --   local plugin_path = vim.fn.expand("~/Dev/Hycmd/Hycmd")
  --   --
  --   --   -- Check if already loaded
  --   --   if vim.g.loaded_hycmd_plugin then
  --   --     return
  --   --   end
  --   --   vim.g.loaded_hycmd_plugin = 1
  --   --
  --   --   -- Register the remote host
  --   --   vim.fn["remote#host#Register"]("custom", "x", function(host)
  --   --     return vim.fn.jobstart({ plugin_path }, { rpc = true })
  --   --   end)
  --   --
  --   --   -- Register plugin commands and functions
  --   --   -- vim.fn["remote#host#RegisterPlugin"]("custom", plugin_path, {
  --   --   --   {
  --   --   --     type = "command",
  --   --   --     name = "Hello",
  --   --   --     sync = 1,
  --   --   --     opts = { nargs = "*" },
  --   --   --   },
  --   --   --   {
  --   --   --     type = "function",
  --   --   --     name = "AddNumbers",
  --   --   --     sync = 1,
  --   --   --     opts = {},
  --   --   --   },
  --   --   -- })
  --   --
  --   --   -- Optional: Create Lua wrappers for easier calling
  --   --   -- vim.api.nvim_create_user_command("Hello", function(opts)
  --   --   --   -- The command is already registered via RPC above
  --   --   --   -- This is just for better integration if needed
  --   --   --   vim.cmd("Hello " .. table.concat(opts.fargs, " "))
  --   --   -- end, { nargs = "*" })
  --   --
  --   --   -- Lua function wrapper for calling from Lua code
  --   --   -- _G.add_numbers = function(a, b)
  --   --   --   return vim.fn.AddNumbers(a, b)
  --   --   -- end
  --   -- end,
>>>>>>> ed2df379f6c5a0e89c4e6c7a269a644644ac6223
}
