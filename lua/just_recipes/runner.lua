local M = {}

-- Run `recipe` from `dir` (relative to cwd, or "." for the cwd justfile).
-- For subdir recipes we window-local `lcd` into the dir, then call just.nvim's
-- run_task_name. just.nvim's runner captures cwd synchronously when it builds
-- the async job, so restoring cwd immediately afterward is safe — the job keeps
-- the subdir cwd while the window's cwd is left as it was.
function M.run_recipe(dir, recipe)
  local just = require("just")
  just.stop_current_task()

  if dir == "." or dir == "" then
    just.run_task_name(recipe)
    return
  end

  local original = vim.fn.getcwd()
  local target = vim.fn.fnamemodify(original .. "/" .. dir, ":p")
  vim.cmd.lcd(vim.fn.fnameescape(target))
  local ok, err = pcall(just.run_task_name, recipe)
  vim.cmd.lcd(vim.fn.fnameescape(original))
  if not ok then
    vim.notify("just_recipes: " .. tostring(err), vim.log.levels.ERROR)
  end
end

return M
