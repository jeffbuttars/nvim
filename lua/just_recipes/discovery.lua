local M = {}

-- Parse `just --list --unsorted` output into a list of recipe names.
-- Takes the first whitespace-indented token per line; skips the heading line
-- (no leading whitespace) and group-header lines like `[group]`.
function M.parse_list(output)
  local names = {}
  if not output or output == "" then
    return names
  end
  for line in output:gmatch("[^\r\n]+") do
    local name = line:match("^%s+(%S+)")
    if name and not name:match("^%[") then
      table.insert(names, name)
    end
  end
  return names
end

local uv = vim.uv or vim.loop

M.justfile_names = { justfile = true, Justfile = true, [".justfile"] = true }

M.prune_dirs = {
  [".git"] = true,
  node_modules = true,
  target = true,
  [".venv"] = true,
  dist = true,
  build = true,
  [".direnv"] = true,
}

-- Breadth-first walk under `root` for justfiles. Returns a list of
-- { dir = <relpath>, path = <abspath> }. opts.max_depth defaults to 2
-- (root itself is depth 0 and intentionally excluded — the cwd justfile is
-- handled by just.nvim's existing keys). opts.prune defaults to M.prune_dirs.
function M.find_justfiles(root, opts)
  opts = opts or {}
  local max_depth = opts.max_depth or 2
  local prune = opts.prune or M.prune_dirs
  local results = {}
  local queue = { { abs = root, rel = "", depth = 0 } }

  while #queue > 0 do
    local node = table.remove(queue, 1)
    local handle = uv.fs_scandir(node.abs)
    if handle then
      while true do
        local name, typ = uv.fs_scandir_next(handle)
        if not name then
          break
        end
        local child_abs = node.abs .. "/" .. name
        if typ == "directory" and not prune[name] and node.depth < max_depth then
          local child_rel = node.rel == "" and name or (node.rel .. "/" .. name)
          table.insert(queue, { abs = child_abs, rel = child_rel, depth = node.depth + 1 })
        elseif typ == "file" and M.justfile_names[name] and node.depth >= 1 then
          table.insert(results, { dir = node.rel, path = child_abs })
        end
      end
    end
  end

  return results
end

return M
