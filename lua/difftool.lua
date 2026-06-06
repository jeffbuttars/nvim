-- AIDEV-NOTE: Dispatcher for the difftool module. require('difftool') resolves here first
-- because the config dir precedes the bundled nvim.difftool pack on the runtimepath. Picks which
-- implementation to load, toggled by a single global:
--   vim.g.difftool_use_bundled = true  -> Neovim's bundled copy (upstream, UNPATCHED: crashes on
--                                         nil relpath, see difftool_vendored.lua).
--   unset / false (default)            -> difftool_vendored.lua (bundled copy + relpath nil-guard).
-- Set the global in your config before first use (e.g. in lua/config/options.lua near the
-- `packadd nvim.difftool`). To flip it live: `:lua vim.g.difftool_use_bundled = true` then
-- `:lua package.loaded.difftool = nil` and re-run :DiffTool.
if vim.g.difftool_use_bundled then
  local cfg = vim.fn.stdpath("config")
  for _, path in ipairs(vim.api.nvim_get_runtime_file("lua/difftool.lua", true)) do
    if not vim.startswith(path, cfg) then
      return dofile(path)
    end
  end
  vim.notify(
    "difftool: bundled copy not found (is `packadd nvim.difftool` run?); using vendored",
    vim.log.levels.WARN
  )
end

return require("difftool_vendored")
