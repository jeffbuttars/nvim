return {
  { "NoahTheDuke/vim-just" },
  {
    "al1-ce/just.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- async jobs
      "j-hui/fidget.nvim", -- task progress (optional)
    },
    config = true,

    opts = {
      fidget_message_limit = 32, -- limit for length of fidget progress message
      open_qf_on_error = true, -- opens quickfix when task fails
      open_qf_on_run = true, -- opens quickfix when running `run` task (`:JustRun`)
      open_qf_on_any = true, -- opens quickfix when running any task (overrides other open_qf options)
      autoscroll_qf = true, -- automatically scroll quickfix window on output
      register_commands = true, -- if set to true then commands (:Just*) will be registered
      notify = vim.notify, -- what to use to show messages/errors
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
        "<leader>Jt",
        function()
          require("just").run_task_name("test")
        end,
        mode = { "n" },
        desc = "test",
      },
      {
        "<leader>Jb",
        function()
          require("just").run_task_name("build")
        end,
        mode = { "n" },
        desc = "build",
      },
      {
        "<leader>Jd",
        function()
          require("just").run_task_name("default")
        end,
        mode = { "n" },
        desc = "devserve",
      },
      {
        "<leader>Js",
        function()
          require("just").run_task_name("serve")
        end,
        mode = { "n" },
        desc = "serve",
      },
      {
        "<leader>Jc",
        function()
          require("just").stop_current_task()
        end,
        mode = { "n" },
        desc = "cancel current task",
      },
    },
  },
}
