# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a customized NeoVim configuration built on LazyVim. It uses lazy.nvim for plugin management and includes extensive customizations for Go development, LLM integration (Claude Code), aggressive auto-saving, and dynamic UI behavior.

## Code Architecture

### Core Structure

- **init.lua**: Bootstrap entry point - loads lazy.nvim and conditional neovide config
- **lua/config/**: Core configuration directory
  - `lazy.lua`: Plugin manager initialization and plugin imports from `lua/plugins/`
  - `options.lua`: Global NeoVim settings (Python host, updatetime, clipboard, diffopt, etc.)
  - `keymaps.lua`: Custom key mappings and deleted default LazyVim keymaps
  - `autocmds.lua`: Autocmd group `ButtarsCustomAutocmds` with auto-save and cursor behavior
- **lua/plugins/**: Individual plugin configuration files (one plugin per file)
- **after/ftplugin/**: Filetype-specific settings (go.lua sets makeprg to "mage")
- **snippets/**: Custom snippet files for mini.snippets

### Key Architectural Patterns

1. **Plugin Organization**: Each plugin configuration is in its own file under `lua/plugins/`, not nested subdirectories. Plugin files return a table with plugin spec(s).

2. **Aggressive Auto-saving**: The `AutoSave()` function in `autocmds.lua` saves modified buffers on multiple events (CursorHold, BufLeave, FocusLost, WinLeave, VimLeave). Swapfiles are disabled in favor of this approach.

3. **Dynamic Cursor Behavior**: Autocmds toggle `cursorline`, `cursorcolumn`, and `relativenumber` based on editing mode and window focus. In insert mode, cursorcolumn and relativenumber are disabled.

4. **Completion System**: Uses blink.cmp with custom keymap behavior:
   - Tab/Shift-Tab for navigation
   - Enter only accepts if item is explicitly selected (not pre-selected)
   - Custom handling for visual mode movement (Ctrl-j/k) that checks if blink is visible

5. **Go Development**:
   - Uses ray-x/go.nvim plugin with custom keymaps under `<leader>G`
   - Mage is set as the default makeprg for Go files
   - Extensive Go-specific commands (GoAddTag, GoFillStruct, GoBuild, GoAddTest, etc.)

## Development Commands

### Formatting
```bash
# Format all Lua files using stylua (indent: 2 spaces, column width: 100)
stylua .
```

### Testing Changes
After modifying configuration files, restart NeoVim or reload the specific module to test changes.

## Important Configuration Details

### Python Host
The config attempts to use `uv` to find the Python interpreter, falling back to `~/.venv/bin/python` if available.

### Clipboard
System clipboard integration is configured but OSC52 clipboard code is commented out. Use `<leader>y` and `<leader>p` for explicit clipboard operations.

### Formatters (conform.nvim)
- **Go**: Uses golines, goimports, gofumpt, gofmt in sequence
- **JavaScript**: Uses standardjs (preferred), then prettierd/prettier
- **All files**: trim_whitespace and typos run on all filetypes

### LSP Configuration
- Inlay hints are disabled by default
- Diagnostics use rounded borders for floating windows

### Disabled LazyVim Keymaps
Many default LazyVim keymaps are explicitly deleted in `keymaps.lua` (buffer navigation, Alt-based movement, etc.). Check the `vim.keymap.del()` calls before adding LazyVim features that might conflict.

## Working with This Configuration

1. **Adding Plugins**: Create a new file in `lua/plugins/` that returns a plugin spec table
2. **Modifying Keymaps**: Add custom keymaps to `lua/config/keymaps.lua` - be aware of deleted defaults
3. **Filetype Settings**: Add filetype-specific behavior to `after/ftplugin/{filetype}.lua`
4. **Snippets**: Add snippets to `snippets/` directory (loaded by mini.snippets)
5. **Auto-commands**: Add to the `ButtarsCustomAutocmds` group in `autocmds.lua`

## Claude Code Integration

The config includes the `coder/claudecode.nvim` plugin with keymaps under `<leader>a`:
- `<leader>ac`: Toggle Claude Code
- `<leader>as`: Send visual selection to Claude (visual mode) or add file to context (file tree)
- `<leader>af`: Focus Claude window
- `<leader>ar`: Resume Claude session
- `<leader>aC`: Continue Claude conversation
- `<leader>aa`: Accept diff
- `<leader>ad`: Deny diff
