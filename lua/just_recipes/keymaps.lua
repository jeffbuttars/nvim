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

return M
