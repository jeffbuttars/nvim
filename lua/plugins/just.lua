local keymaps = require("just_recipes.keymaps")
local discovery = require("just_recipes.discovery")

-- Re-register subdir submenus on buffer enter; invalidate the discovery cache
-- when any justfile is written so new/removed recipes are picked up.
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  group = vim.api.nvim_create_augroup("JustDynamicKeys", { clear = true }),
  callback = function(args)
    local buf = args.buf
    if not vim.api.nvim_buf_is_valid(buf) then
      return
    end
    local name = vim.api.nvim_buf_get_name(buf)
    if args.event == "BufWritePost" and name:match("[Jj]ustfile$") then
      discovery.invalidate()
    end
    -- Only normal file buffers get subdir keys; skip terminals, qf, prompts, etc.
    if vim.bo[buf].buftype ~= "" then
      return
    end
    vim.schedule(function()
      keymaps.register_submenus(buf)
    end)
  end,
})

return {
  -- { "NoahTheDuke/vim-just" },
  {
    "al1-ce/just.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "j-hui/fidget.nvim",
    },
    config = true,

    opts = {
      fidget_message_limit = 32,
      open_qf_on_error = true,
      open_qf_on_run = true,
      open_qf_on_any = true,
      autoscroll_qf = true,
      register_commands = true,
      notify = vim.notify,
    },

    keys = {
      {
        "<leader>J",
        mode = { "n" },
        desc = "Just",
      },
      {
        "<leader>JJ",
        function()
          require("just").run_task_select()
        end,
        mode = { "n" },
        desc = "choose a task",
      },
      {
        "<leader>Jp",
        function()
          require("just_recipes.keymaps").open_picker()
        end,
        mode = { "n" },
        desc = "pick any recipe (local + subdirs)",
      },
      {
        "<leader>Jt",
        function()
          require("just").stop_current_task()
          require("just").run_task_name("test")
        end,
        mode = { "n" },
        desc = "test",
      },
      {
        "<leader>Jb",
        function()
          require("just").stop_current_task()
          require("just").run_task_name("build")
        end,
        mode = { "n" },
        desc = "build",
      },
      {
        "<leader>Js",
        function()
          require("just").stop_current_task()
          require("just").run_task_name("serve")
        end,
        mode = { "n" },
        desc = "serve",
      },
      {
        "<leader>Jk",
        function()
          require("just").stop_current_task()
        end,
        mode = { "n" },
        desc = "kill current task",
      },
    },
  },
}
