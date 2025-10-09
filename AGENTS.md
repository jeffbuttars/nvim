# NeoVim Config - Agent Guidelines

## Build/Lint/Test Commands
- **Format**: `stylua .` (formats all Lua files)
- **Test**: Restart NeoVim or `:source <file>` to test configuration changes
- **No traditional tests**: This is a config repo; verify by loading in NeoVim

## Code Style
- **Language**: Lua
- **Indent**: 2 spaces (configured in stylua.toml)
- **Line length**: 100 characters max
- **Comments**: NO comments unless explicitly requested (per system instructions)
- **Formatting**: Use stylua for consistency

## Architecture Patterns
- **Plugin files**: One plugin per file in `lua/plugins/`, each returns a table with plugin spec(s)
- **No nested directories**: Keep plugins flat in `lua/plugins/`, NOT in subdirectories
- **Config files**: Core settings in `lua/config/` (options.lua, keymaps.lua, autocmds.lua, lazy.lua)
- **Filetype settings**: Place in `after/ftplugin/{filetype}.lua`
- **Autocmds**: Add to `ButtarsCustomAutocmds` group in `lua/config/autocmds.lua`

## Key Constraints
- **Disabled keymaps**: Many default LazyVim keymaps are deleted; check `keymaps.lua` before adding conflicting maps
- **Auto-save**: Aggressive auto-saving is enabled; swapfiles are disabled
- **Python host**: Uses `uv` or `~/.venv/bin/python` for Python integration
