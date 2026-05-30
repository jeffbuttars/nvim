local M = {}

local function candidates(name)
  local first = name:sub(1, 1)
  local list = { first:lower(), first:upper() }
  for c = string.byte("a"), string.byte("z") do
    table.insert(list, string.char(c))
  end
  for c = string.byte("A"), string.byte("Z") do
    table.insert(list, string.char(c))
  end
  return list
end

-- Deterministically assign a single-char key to each name, avoiding the
-- `reserved` set and any already-assigned key. Mutates a copy of reserved, not
-- the caller's table. Returns a map name -> key. Names with no free slot are
-- omitted. Caller is responsible for passing names in a stable (sorted) order.
function M.allocate_letters(names, reserved)
  local used = {}
  for k in pairs(reserved or {}) do
    used[k] = true
  end
  local assigned = {}
  for _, name in ipairs(names) do
    for _, key in ipairs(candidates(name)) do
      if not used[key] then
        used[key] = true
        assigned[name] = key
        break
      end
    end
  end
  return assigned
end

-- Build a flat list of selectable items for the picker. Local recipes come
-- first as "./<recipe>", then each subdir entry's recipes as "<dir>/<recipe>".
-- Each item: { label = <string>, dir = <"." or relpath>, recipe = <name> }.
-- AIDEV-NOTE: just.nvim run_task_name fails on recipe names with "_" or capitals; such recipes bind a key but won't run.
function M.build_flat_list(local_recipes, entries)
  local items = {}
  for _, recipe in ipairs(local_recipes or {}) do
    table.insert(items, { label = "./" .. recipe, dir = ".", recipe = recipe })
  end
  for _, entry in ipairs(entries or {}) do
    for _, recipe in ipairs(entry.recipes) do
      table.insert(items, {
        label = entry.dir .. "/" .. recipe,
        dir = entry.dir,
        recipe = recipe,
      })
    end
  end
  return items
end

local discovery = require("just_recipes.discovery")
local runner = require("just_recipes.runner")

M.dynamic_ns = "➡️ "
-- Keys owned by the fixed local mappings in lua/plugins/just.lua.
M.reserved = { J = true, t = true, b = true, s = true, k = true, p = true }

-- Local (cwd) recipe names via just.nvim's own list. Best-effort; empty on
-- failure.
local function local_recipes()
  local output = vim.fn.system({ "just", "--list", "--unsorted" })
  if vim.v.shell_error ~= 0 then
    return {}
  end
  return discovery.parse_list(output)
end

-- <leader>Jp: pick any recipe (local or subdir) and run it.
function M.open_picker()
  local items = M.build_flat_list(local_recipes(), discovery.discover())
  if #items == 0 then
    vim.notify("just_recipes: no recipes found", vim.log.levels.INFO)
    return
  end
  vim.ui.select(items, {
    prompt = "Just recipe:",
    format_item = function(item)
      return item.label
    end,
  }, function(choice)
    if choice then
      runner.run_recipe(choice.dir, choice.recipe)
    end
  end)
end

-- Remove previously-registered dynamic subdir keys for this buffer. Matches on
-- the unique dynamic_ns marker in the description — note nvim_buf_get_keymap
-- returns lhs with <leader> already expanded, so lhs-pattern matching is unreliable.
local function clear_dynamic_keys(buf)
  for _, map in ipairs(vim.api.nvim_buf_get_keymap(buf, "n")) do
    if map.desc and map.desc:find(M.dynamic_ns, 1, true) then
      pcall(vim.keymap.del, "n", map.lhs, { buffer = buf })
    end
  end
end

-- Register per-directory submenus for `buf`. <leader>J<dirKey> is a which-key
-- group; <leader>J<dirKey><recipeKey> runs the recipe. Letters are allocated
-- deterministically against the reserved set so they never clobber fixed keys.
function M.register_submenus(buf)
  if not vim.api.nvim_buf_is_valid(buf) then
    return
  end
  clear_dynamic_keys(buf)

  local entries = discovery.discover()
  if #entries == 0 then
    return
  end

  local dir_names = {}
  for _, e in ipairs(entries) do
    table.insert(dir_names, e.dir)
  end
  local dir_keys = M.allocate_letters(dir_names, M.reserved)

  local ok_wk, wk = pcall(require, "which-key")

  for _, entry in ipairs(entries) do
    local dkey = dir_keys[entry.dir]
    if dkey then
      if ok_wk then
        wk.add({ { "<leader>J" .. dkey, group = M.dynamic_ns .. entry.dir, buffer = buf } })
      end
      local recipe_keys = M.allocate_letters(entry.recipes, {})
      for _, recipe in ipairs(entry.recipes) do
        local rkey = recipe_keys[recipe]
        if rkey then
          vim.keymap.set("n", "<leader>J" .. dkey .. rkey, function()
            runner.run_recipe(entry.dir, recipe)
          end, {
            buffer = buf,
            desc = M.dynamic_ns .. entry.dir .. ": " .. recipe,
          })
        end
      end
    end
  end
end

return M
