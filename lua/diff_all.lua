-- Resolve every diff hunk in one direction at once, in a CodeDiff view or in plain 'diff' windows
-- (git difftool/mergetool, :diffsplit). Keymaps live in lua/config/keymaps.lua.
local M = {}

-- AIDEV-NOTE: the CodeDiff probe is gated on `package.loaded` - a bare `require` of a codediff
-- submodule makes lazy.nvim load the whole plugin (verified), which a difftool session never needs.
-- Returns nil + reason when the pair is ambiguous.
local function diff_pair()
  if package.loaded["codediff"] then
    local ok, accessors = pcall(require, "codediff.ui.lifecycle.accessors")
    local orig_buf, mod_buf
    if ok then
      orig_buf, mod_buf = accessors.get_buffers(vim.api.nvim_get_current_tabpage())
    end
    local cur = vim.api.nvim_get_current_buf()
    if orig_buf and (cur == orig_buf or cur == mod_buf) then
      return { current = cur, other = cur == orig_buf and mod_buf or orig_buf, codediff = true }
    end
  end

  if not vim.wo.diff then
    return nil, "Cursor not in a diff buffer"
  end

  local cur_win = vim.api.nvim_get_current_win()
  local other_win
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    if win ~= cur_win and vim.wo[win].diff then
      if other_win then
        return nil, "More than two windows are in diff mode"
      end
      other_win = win
    end
  end
  if not other_win then
    return nil, "No other window is in diff mode"
  end

  return {
    current = vim.api.nvim_get_current_buf(),
    other = vim.api.nvim_win_get_buf(other_win),
    codediff = false,
  }
end

-- AIDEV-NOTE: "put/get ALL hunks one direction" == make target buffer identical to
-- source. Whole-buffer copy beats looping the plugin's private per-hunk diff_get/put.
-- direction "put" = current->other, "get" = other->current.
-- AIDEV-NOTE: also why plain diff mode can't just use `:%diffput`/`:%diffget` - a ranged
-- diffput/diffget never reaches a hunk that is a pure insertion past the buffer's last line
-- (verified: trailing hunk silently skipped). Safe to copy wholesale since diffopt has no iwhite.
function M.all(direction)
  local pair, reason = diff_pair()
  if not pair then
    vim.notify(reason, vim.log.levels.WARN)
    return
  end
  local source, target = pair.current, pair.other
  if direction == "get" then
    source, target = target, source
  end
  if not vim.bo[target].modifiable then
    vim.notify("Target buffer is not modifiable", vim.log.levels.WARN)
    return
  end
  local lines = vim.api.nvim_buf_get_lines(source, 0, -1, false)
  vim.api.nvim_buf_set_lines(target, 0, -1, false, lines)
  if pair.codediff then
    require("codediff.ui.refresh").buffer_changed(target)
  end
end

return M
