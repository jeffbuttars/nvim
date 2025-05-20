# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This repository contains a customized NeoVim configuration based on LazyVim. It includes various plugins and customizations for improved code editing, language server support, and user experience. The configuration is structured using Lua and follows the LazyVim organization pattern.

## Code Structure

- `init.lua`: Entry point that bootstraps the configuration
- `lua/config/`: Core configuration files
  - `lazy.lua`: Plugin manager setup and plugin imports
  - `options.lua`: NeoVim options and settings
  - `keymaps.lua`: Custom keybindings
  - `autocmds.lua`: Automatic commands and event handlers
- `lua/plugins/`: Plugin-specific configurations

## Key Features

1. **Plugin Management**: Uses lazy.nvim for plugin management with a modular structure
2. **Auto-saving**: Files are automatically saved on cursor hold, buffer leave, and other events
3. **Cursor Highlighting**: Dynamic cursor line/column highlighting based on editing mode
4. **LLM Integration**: Configuration for Claude Code and other AI assistants

## Working with the NeoVim Configuration

When making changes to the NeoVim configuration, ensure you:

1. Follow the existing code style and structure
2. Test changes in NeoVim before committing
3. Keep plugin configurations modular in separate files under `lua/plugins/`
4. Use meaningful variable names as per user instructions

## Commands

### Linting and Formatting
```lua
-- Run stylua formatter (Lua)
stylua .
```

### Common Key Mappings
- `<leader>s`: Search and replace current word
- `<leader>fx`: Make current file executable
- `<leader>y`: Copy to system clipboard
- `<leader>p`: Paste from system clipboard
- Visual mode double character enclosures: `((`, `{{`, `[[`, `""`, `''`, `