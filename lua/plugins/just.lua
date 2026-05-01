local existing_just_keys = { ["J"] = true, ["t"] = true, ["b"] = true, ["s"] = true, ["k"] = true }
local dynamic_ns = "➡️ "

local function get_just_targets()
  local handle = io.popen("just --list --unsorted 2>/dev/null")
  if not handle then
    return {}
  end
  local output = handle:read("*a")
  handle:close()

  if not output or output == "" then
    return {}
  end

  local targets = {}
  for line in output:gmatch("[^\r\n]+") do
    local target = line:match("^%s+(%S+)")
    if target then
      table.insert(targets, target)
    end
  end

  return targets
end

local function register_dynamic_just_keys(buf)
  if not vim.api.nvim_buf_is_valid(buf) then
    return
  end

  -- Remove existing dynamic Just keys for this buffer
  for _, map in ipairs(vim.api.nvim_get_keymap("n")) do
    if map.lhs:match("^<leader>J.") then
      if map.desc and map.desc:match("^" .. dynamic_ns) then
        vim.keymap.del("n", map.lhs, { buffer = buf })
      end
    end
  end

  local targets = get_just_targets()
  if #targets == 0 then
    -- nothing to add
    return
  end

  local used_keys = vim.deepcopy(existing_just_keys)

  -- mark existing dynamic keys as used to avoid conflicts
  for _, existing in ipairs(vim.api.nvim_get_keymap("n")) do
    if existing.lhs:match("^<leader>J.") then
      local k = existing.lhs:match("^<leader>J(.+)$")
      if k then
        used_keys[k] = true
      end
    end
  end

  for _, target in ipairs(targets) do
    local key = target:sub(1, 1)
    if used_keys[key] then
      -- If the first letter is already used, try uppercase
      key = key:upper()
    end

    if not used_keys[key] then
      used_keys[key] = true
      vim.keymap.set("n", "<leader>J" .. key, function()
        require("just").stop_current_task()
        require("just").run_task_name(target)
      end, {
        buffer = buf,
        desc = dynamic_ns .. target,
      })
    end
  end
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  group = vim.api.nvim_create_augroup("JustDynamicKeys", { clear = true }),
  callback = function(args)
    local buf = args.buf
    if not vim.api.nvim_buf_is_valid(buf) then
      return
    end

    vim.schedule(function()
      register_dynamic_just_keys(buf)
    end)
  end,
})

return {
  { "NoahTheDuke/vim-just" },
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
