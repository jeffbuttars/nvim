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

return M
