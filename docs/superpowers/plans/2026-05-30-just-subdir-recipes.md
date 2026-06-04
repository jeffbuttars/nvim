# Just Subdir Recipes Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Discover recipes in independent justfiles under the cwd and make them runnable via a `vim.ui.select` picker and auto-generated per-directory which-key submenus, reusing `just.nvim`'s fidget+quickfix pipeline.

**Architecture:** Three focused Lua modules under `lua/just_recipes/` (discovery, runner, keymaps) wired together by the existing plugin spec in `lua/plugins/just.lua`. Pure logic (recipe parsing, deterministic letter allocation, flat-list formatting) is unit-tested with `plenary.busted`; runtime-coupled wiring (the `lcd` runner, keymaps, autocmd cache invalidation) is verified manually in nvim. Subdir recipes are executed by window-local `lcd` into the subdir immediately before calling `just.nvim`'s `run_task_name`, then restoring cwd — the async job captures its cwd synchronously, so the recipe runs against the subdir justfile while everything else is untouched.

**Tech Stack:** Lua, Neovim API (`vim.fs`, `vim.uv`/`vim.loop`, `vim.keymap`, `vim.ui.select`), `al1-ce/just.nvim`, `plenary.busted` (headless test runner), `stylua` (formatting).

---

## Design reference

Spec: `docs/superpowers/specs/2026-05-30-just-subdir-recipes-design.md`

## File Structure

- Create: `lua/just_recipes/discovery.lua` — find justfiles under cwd, list+parse their recipes, cache by cwd.
- Create: `lua/just_recipes/keymaps.lua` — pure helpers (letter allocation, flat-list build) + keymap/picker registration.
- Create: `lua/just_recipes/runner.lua` — `run_recipe(dir, recipe)` via the `lcd` trick.
- Modify: `lua/plugins/just.lua` — replace the inline dynamic-key logic with calls into the new modules; keep the fixed local keys and `opts` unchanged; add `<leader>Jp`.
- Create: `tests/minimal_init.lua` — plenary bootstrap for headless tests.
- Create: `tests/just_recipes/discovery_spec.lua` — tests for `parse_list` and `find_justfiles`.
- Create: `tests/just_recipes/keymaps_spec.lua` — tests for `allocate_letters` and `build_flat_list`.

**Conventions (match existing code):** stylua with 2-space indent, 100-col width. Lua module pattern `local M = {}` … `return M`. The dynamic-namespace prefix marker `➡️ ` is reused for which-key descriptions.

---

### Task 1: Test bootstrap

**Files:**
- Create: `tests/minimal_init.lua`

- [ ] **Step 1: Write the minimal init that puts this config and plenary on the runtimepath**

`tests/minimal_init.lua`:

```lua
-- Minimal init for headless plenary.busted runs.
-- Run all: nvim --headless --noplugin -u tests/minimal_init.lua \
--   -c "PlenaryBustedDirectory tests/ { minimal_init = 'tests/minimal_init.lua' }"
local config_root = vim.fn.fnamemodify(vim.fn.expand("<sfile>:p"), ":h:h")
vim.opt.runtimepath:prepend(config_root)

local plenary = vim.fn.stdpath("data") .. "/lazy/plenary.nvim"
vim.opt.runtimepath:prepend(plenary)

vim.cmd("runtime plugin/plenary.vim")
```

- [ ] **Step 2: Verify the bootstrap loads plenary**

Run:
```bash
cd ~/.config/nvim && nvim --headless --noplugin -u tests/minimal_init.lua \
  -c "lua print(require('plenary.busted') and 'plenary-ok')" -c "qa!"
```
Expected: prints `plenary-ok` (no error).

- [ ] **Step 3: Commit**

```bash
git add tests/minimal_init.lua
git commit -m "test: add plenary headless bootstrap"
```

---

### Task 2: Recipe-list parsing (pure)

**Files:**
- Create: `lua/just_recipes/discovery.lua`
- Test: `tests/just_recipes/discovery_spec.lua`

- [ ] **Step 1: Write the failing test**

`tests/just_recipes/discovery_spec.lua`:

```lua
local discovery = require("just_recipes.discovery")

describe("discovery.parse_list", function()
  it("extracts indented recipe names and drops the heading", function()
    local output = table.concat({
      "Available recipes:",
      "    build",
      "    test arg",
      "    serve",
    }, "\n")
    assert.are.same({ "build", "test", "serve" }, discovery.parse_list(output))
  end)

  it("skips group header lines and blanks", function()
    local output = table.concat({
      "Available recipes:",
      "    [build]",
      "    compile",
      "",
      "    lint",
    }, "\n")
    assert.are.same({ "compile", "lint" }, discovery.parse_list(output))
  end)

  it("returns empty table for empty or nil input", function()
    assert.are.same({}, discovery.parse_list(""))
    assert.are.same({}, discovery.parse_list(nil))
  end)
end)
```

- [ ] **Step 2: Run test to verify it fails**

Run:
```bash
cd ~/.config/nvim && nvim --headless --noplugin -u tests/minimal_init.lua \
  -c "PlenaryBustedFile tests/just_recipes/discovery_spec.lua" -c "qa!"
```
Expected: FAIL — `module 'just_recipes.discovery' not found`.

- [ ] **Step 3: Write minimal implementation**

`lua/just_recipes/discovery.lua`:

```lua
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
```

- [ ] **Step 4: Run test to verify it passes**

Run:
```bash
cd ~/.config/nvim && nvim --headless --noplugin -u tests/minimal_init.lua \
  -c "PlenaryBustedFile tests/just_recipes/discovery_spec.lua" -c "qa!"
```
Expected: PASS — 3 successes.

- [ ] **Step 5: Commit**

```bash
git add lua/just_recipes/discovery.lua tests/just_recipes/discovery_spec.lua
git commit -m "feat: parse just --list output into recipe names"
```

---

### Task 3: Justfile discovery walk (filesystem)

**Files:**
- Modify: `lua/just_recipes/discovery.lua`
- Test: `tests/just_recipes/discovery_spec.lua`

- [ ] **Step 1: Write the failing test**

Append to `tests/just_recipes/discovery_spec.lua`:

```lua
describe("discovery.find_justfiles", function()
  local root

  before_each(function()
    root = vim.fn.tempname()
    vim.fn.mkdir(root .. "/frontend", "p")
    vim.fn.mkdir(root .. "/backend/deep", "p")
    vim.fn.mkdir(root .. "/node_modules/pkg", "p")
    vim.fn.writefile({ "build:", "  echo f" }, root .. "/frontend/justfile")
    vim.fn.writefile({ "test:", "  echo b" }, root .. "/backend/Justfile")
    vim.fn.writefile({ "x:", "  echo d" }, root .. "/backend/deep/justfile")
    vim.fn.writefile({ "y:", "  echo n" }, root .. "/node_modules/pkg/justfile")
  end)

  after_each(function()
    vim.fn.delete(root, "rf")
  end)

  it("finds justfiles in subdirs up to max_depth, pruning junk dirs", function()
    local found = discovery.find_justfiles(root, { max_depth = 2 })
    local dirs = {}
    for _, e in ipairs(found) do
      table.insert(dirs, e.dir)
    end
    table.sort(dirs)
    -- frontend (depth 1) and backend (depth 1) included; backend/deep is
    -- depth 2 so included; node_modules pruned.
    assert.are.same({ "backend", "backend/deep", "frontend" }, dirs)
  end)

  it("respects max_depth = 1", function()
    local found = discovery.find_justfiles(root, { max_depth = 1 })
    local dirs = {}
    for _, e in ipairs(found) do
      table.insert(dirs, e.dir)
    end
    table.sort(dirs)
    assert.are.same({ "backend", "frontend" }, dirs)
  end)

  it("returns entries with absolute path and relative dir", function()
    local found = discovery.find_justfiles(root, { max_depth = 1 })
    for _, e in ipairs(found) do
      assert.is_truthy(e.path:match("^" .. vim.pesc(root)))
      assert.is_truthy(e.path:match("[Jj]ustfile$"))
    end
  end)
end)
```

- [ ] **Step 2: Run test to verify it fails**

Run:
```bash
cd ~/.config/nvim && nvim --headless --noplugin -u tests/minimal_init.lua \
  -c "PlenaryBustedFile tests/just_recipes/discovery_spec.lua" -c "qa!"
```
Expected: FAIL — `attempt to call field 'find_justfiles' (a nil value)`.

- [ ] **Step 3: Write minimal implementation**

Add to `lua/just_recipes/discovery.lua` above `return M`:

```lua
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
```

- [ ] **Step 4: Run test to verify it passes**

Run:
```bash
cd ~/.config/nvim && nvim --headless --noplugin -u tests/minimal_init.lua \
  -c "PlenaryBustedFile tests/just_recipes/discovery_spec.lua" -c "qa!"
```
Expected: PASS — all discovery tests succeed.

- [ ] **Step 5: Commit**

```bash
git add lua/just_recipes/discovery.lua tests/just_recipes/discovery_spec.lua
git commit -m "feat: walk subdirs for justfiles with depth limit and pruning"
```

---

### Task 4: Discovery aggregation + cache

**Files:**
- Modify: `lua/just_recipes/discovery.lua`

This task wires `find_justfiles` + `just --list` + `parse_list` into a cached
`discover()`. The `just` invocation is runtime-coupled (subprocess), so it is
verified manually rather than unit-tested.

- [ ] **Step 1: Add list_recipes, discover, and cache to discovery.lua**

Add above `return M`:

```lua
-- Run `just --list` against a specific justfile from its own directory.
-- Returns a list of recipe names (possibly empty). On failure, warns once
-- naming the file and returns {} — never silently swallowed.
function M.list_recipes(path, dir_abs)
  local cmd = {
    "just",
    "--justfile",
    path,
    "--working-directory",
    dir_abs,
    "--list",
    "--unsorted",
  }
  local output = vim.fn.system(cmd)
  if vim.v.shell_error ~= 0 then
    vim.notify("just_recipes: failed to list recipes in " .. path, vim.log.levels.WARN)
    return {}
  end
  return M.parse_list(output)
end

M._cache = nil

-- Discover subdir justfiles under cwd and their recipes. Cached by cwd until
-- invalidate() is called. Returns a sorted list of
-- { dir = <relpath>, path = <abspath>, recipes = { <name>, ... } }.
function M.discover()
  local cwd = vim.fn.getcwd()
  if M._cache and M._cache.cwd == cwd then
    return M._cache.entries
  end

  local entries = {}
  for _, jf in ipairs(M.find_justfiles(cwd)) do
    local dir_abs = vim.fn.fnamemodify(jf.path, ":h")
    local recipes = M.list_recipes(jf.path, dir_abs)
    if #recipes > 0 then
      table.insert(entries, { dir = jf.dir, path = jf.path, recipes = recipes })
    end
  end

  table.sort(entries, function(a, b)
    return a.dir < b.dir
  end)

  M._cache = { cwd = cwd, entries = entries }
  return entries
end

function M.invalidate()
  M._cache = nil
end
```

- [ ] **Step 2: Manual verification in nvim**

Create a throwaway tree and check discovery returns it:

Run:
```bash
cd ~/.config/nvim && nvim --headless --noplugin -u tests/minimal_init.lua \
  -c "lua local d=require('just_recipes.discovery'); print(vim.inspect(d.find_justfiles(vim.fn.getcwd())))" \
  -c "qa!"
```
Expected: prints a (possibly empty) Lua table of `{ dir, path }` entries with no errors. (Empty is fine if this repo has no subdir justfiles.)

- [ ] **Step 3: Commit**

```bash
git add lua/just_recipes/discovery.lua
git commit -m "feat: cache discovered subdir justfiles and their recipes"
```

---

### Task 5: Letter allocation (pure)

**Files:**
- Create: `lua/just_recipes/keymaps.lua`
- Test: `tests/just_recipes/keymaps_spec.lua`

- [ ] **Step 1: Write the failing test**

`tests/just_recipes/keymaps_spec.lua`:

```lua
local keymaps = require("just_recipes.keymaps")

describe("keymaps.allocate_letters", function()
  it("assigns first char, deterministically, skipping reserved", function()
    local reserved = { t = true, b = true, s = true, k = true, J = true }
    local got = keymaps.allocate_letters({ "frontend", "backend", "api" }, reserved)
    assert.are.same("f", got.frontend)
    assert.are.same("a", got.api)
    -- backend's "b" is reserved -> uppercase "B"
    assert.are.same("B", got.backend)
  end)

  it("falls back through the alphabet when first char and its upper are taken", function()
    local reserved = {}
    -- three items all starting with "x": x, X, then first free a..z
    local got = keymaps.allocate_letters({ "x1", "x2", "x3" }, reserved)
    assert.are.same("x", got.x1)
    assert.are.same("X", got.x2)
    assert.are.same("a", got.x3)
  end)

  it("does not reassign across calls given identical sorted input", function()
    local a = keymaps.allocate_letters({ "alpha", "beta" }, {})
    local b = keymaps.allocate_letters({ "alpha", "beta" }, {})
    assert.are.same(a, b)
  end)
end)
```

- [ ] **Step 2: Run test to verify it fails**

Run:
```bash
cd ~/.config/nvim && nvim --headless --noplugin -u tests/minimal_init.lua \
  -c "PlenaryBustedFile tests/just_recipes/keymaps_spec.lua" -c "qa!"
```
Expected: FAIL — `module 'just_recipes.keymaps' not found`.

- [ ] **Step 3: Write minimal implementation**

`lua/just_recipes/keymaps.lua`:

```lua
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

return M
```

- [ ] **Step 4: Run test to verify it passes**

Run:
```bash
cd ~/.config/nvim && nvim --headless --noplugin -u tests/minimal_init.lua \
  -c "PlenaryBustedFile tests/just_recipes/keymaps_spec.lua" -c "qa!"
```
Expected: PASS — 3 successes.

- [ ] **Step 5: Commit**

```bash
git add lua/just_recipes/keymaps.lua tests/just_recipes/keymaps_spec.lua
git commit -m "feat: deterministic single-char key allocation"
```

---

### Task 6: Flat picker list (pure)

**Files:**
- Modify: `lua/just_recipes/keymaps.lua`
- Test: `tests/just_recipes/keymaps_spec.lua`

- [ ] **Step 1: Write the failing test**

Append to `tests/just_recipes/keymaps_spec.lua`:

```lua
describe("keymaps.build_flat_list", function()
  it("prefixes local recipes with ./ and subdir recipes with dir/", function()
    local local_recipes = { "build", "test" }
    local entries = {
      { dir = "frontend", recipes = { "build", "dev" } },
      { dir = "backend", recipes = { "test" } },
    }
    local items = keymaps.build_flat_list(local_recipes, entries)
    local labels = {}
    for _, it in ipairs(items) do
      table.insert(labels, it.label)
    end
    assert.are.same({
      "./build",
      "./test",
      "frontend/build",
      "frontend/dev",
      "backend/test",
    }, labels)
  end)

  it("tags each item with its dir and recipe for dispatch", function()
    local items = keymaps.build_flat_list({ "build" }, {})
    assert.are.same(".", items[1].dir)
    assert.are.same("build", items[1].recipe)
  end)
end)
```

- [ ] **Step 2: Run test to verify it fails**

Run:
```bash
cd ~/.config/nvim && nvim --headless --noplugin -u tests/minimal_init.lua \
  -c "PlenaryBustedFile tests/just_recipes/keymaps_spec.lua" -c "qa!"
```
Expected: FAIL — `attempt to call field 'build_flat_list' (a nil value)`.

- [ ] **Step 3: Write minimal implementation**

Add to `lua/just_recipes/keymaps.lua` above `return M`:

```lua
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
```

Note: the `return M` already exists from Task 5 — replace the existing trailing
`return M` rather than adding a second one.

- [ ] **Step 4: Run test to verify it passes**

Run:
```bash
cd ~/.config/nvim && nvim --headless --noplugin -u tests/minimal_init.lua \
  -c "PlenaryBustedFile tests/just_recipes/keymaps_spec.lua" -c "qa!"
```
Expected: PASS — all keymaps tests succeed.

- [ ] **Step 5: Commit**

```bash
git add lua/just_recipes/keymaps.lua tests/just_recipes/keymaps_spec.lua
git commit -m "feat: build flat recipe list for picker"
```

---

### Task 7: The lcd-reuse runner

**Files:**
- Create: `lua/just_recipes/runner.lua`

Runtime-coupled (drives `just.nvim` + changes window cwd) → verified manually.

- [ ] **Step 1: Write the runner**

`lua/just_recipes/runner.lua`:

```lua
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
```

- [ ] **Step 2: Manual verification in nvim**

In a real session with a subdir justfile present (e.g. `frontend/justfile`
with a `build` recipe), open nvim at the project root and run:

```
:lua require("just_recipes.runner").run_recipe("frontend", "build")
```

Expected: the recipe runs (fidget shows progress / quickfix populates on error),
and afterward `:pwd` still reports the project root — not `frontend`.

- [ ] **Step 3: Commit**

```bash
git add lua/just_recipes/runner.lua
git commit -m "feat: run subdir recipes via lcd-reuse of just.nvim"
```

---

### Task 8: Picker + submenu registration

**Files:**
- Modify: `lua/just_recipes/keymaps.lua`

Adds the two registration entry points. Runtime-coupled (sets keymaps, opens
`vim.ui.select`) → verified manually.

- [ ] **Step 1: Add reserved set, picker, and register functions**

Add to `lua/just_recipes/keymaps.lua` above the final `return M`:

```lua
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
  return require("just_recipes.discovery").parse_list(output)
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

-- Remove previously-registered dynamic subdir keys for this buffer.
local function clear_dynamic_keys(buf)
  for _, map in ipairs(vim.api.nvim_buf_get_keymap(buf, "n")) do
    if map.lhs:match("^<[Ll]eader>J") and map.desc and map.desc:find(M.dynamic_ns, 1, true) then
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
```

- [ ] **Step 2: Manual verification in nvim**

With a subdir justfile present, open nvim at the project root:

```
:lua require("just_recipes.keymaps").register_submenus(0)
```
Then press `<leader>J` and confirm which-key shows a group per subdir, and
drilling in runs the recipe. Also:
```
:lua require("just_recipes.keymaps").open_picker()
```
Expected: a `vim.ui.select` list of `./recipe` and `dir/recipe` entries;
selecting one runs it.

- [ ] **Step 3: Commit**

```bash
git add lua/just_recipes/keymaps.lua
git commit -m "feat: subdir picker and per-directory which-key submenus"
```

---

### Task 9: Wire into the plugin spec

**Files:**
- Modify: `lua/plugins/just.lua`

Replace the inline discovery/dynamic-key code (lines 1-91 of the current file)
with module calls. Keep the plugin spec `opts` and the fixed local keys
unchanged. Add `<leader>Jp`.

- [ ] **Step 1: Replace the top-of-file logic and autocmd**

Replace everything from the start of `lua/plugins/just.lua` through the
`vim.api.nvim_create_autocmd(...)` block (the current lines 1-91, ending just
before `return {`) with:

```lua
local keymaps = require("just_recipes.keymaps")
local discovery = require("just_recipes.discovery")

-- Re-register subdir submenus on buffer enter; invalidate the discovery cache
-- when any justfile is written so new/removed recipes are picked up.
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  group = vim.api.nvim_create_augroup("JustDynamicKeys", { clear = true }),
  callback = function(args)
    local buf = args.buf
    if not vim.api.nvim_buf_is_valid(buf) then
      return
    end
    local name = vim.api.nvim_buf_get_name(buf)
    if args.event == "BufWritePost" and name:match("[Jj]ustfile$") then
      discovery.invalidate()
    end
    vim.schedule(function()
      keymaps.register_submenus(buf)
    end)
  end,
})
```

- [ ] **Step 2: Add the picker key to the `keys` table**

In the `keys = { ... }` table, immediately after the `<leader>JJ` entry
(the `choose a task` mapping, current lines 119-126), add:

```lua
      {
        "<leader>Jp",
        function()
          require("just_recipes.keymaps").open_picker()
        end,
        mode = { "n" },
        desc = "pick any recipe (local + subdirs)",
      },
```

- [ ] **Step 3: Format**

Run: `cd ~/.config/nvim && stylua lua/plugins/just.lua lua/just_recipes/`
Expected: no errors; files reformatted to 2-space / 100-col.

- [ ] **Step 4: Full manual smoke test in nvim**

Open nvim normally (full config) at a project root that has at least one subdir
justfile. Verify, in order:
1. `<leader>Jt`, `<leader>Jb`, `<leader>Js`, `<leader>Jk` — fixed local keys still work.
2. `<leader>JJ` — local recipe select still works.
3. `<leader>Jp` — picker lists local + subdir recipes; selecting runs one.
4. `<leader>J` then a subdir group letter — submenu lists that dir's recipes; running one works and `:pwd` is unchanged afterward.
5. Edit and save a subdir justfile (add a recipe) → the new recipe appears in
   the picker/submenu without restarting nvim.

Expected: all five pass.

- [ ] **Step 5: Run the full test suite**

Run:
```bash
cd ~/.config/nvim && nvim --headless --noplugin -u tests/minimal_init.lua \
  -c "PlenaryBustedDirectory tests/ { minimal_init = 'tests/minimal_init.lua' }" -c "qa!"
```
Expected: all discovery + keymaps specs PASS, exit code 0.

- [ ] **Step 6: Commit**

```bash
git add lua/plugins/just.lua
git commit -m "feat: wire subdir recipe discovery into just plugin spec"
```

---

## Self-Review

**Spec coverage:**
- Discovery (walk, depth, prune, list, cache, invalidate) → Tasks 2-4, autocmd in Task 9. ✓
- lcd-reuse runner preserving fidget+quickfix and cwd → Task 7. ✓
- Picker `<leader>Jp` over `./recipe` + `dir/recipe` via `vim.ui.select` → Tasks 6, 8, 9. ✓
- Per-directory which-key submenus, unified deterministic letter allocation vs reserved set → Tasks 5, 8. ✓
- Fixed local keys unchanged → Task 9 (explicitly preserved). ✓
- Error handling: no justfiles = silent empty (Tasks 4, 8); malformed justfile = single notify, never swallowed (Task 4 `list_recipes`); stale keys cleaned on rewalk (Task 8 `clear_dynamic_keys`). ✓
- Constants near top of file for tuning (depth, prune) → Task 3 (`M.prune_dirs`, default `max_depth`). ✓

**Type/name consistency:** `discovery.parse_list`, `find_justfiles`, `list_recipes`, `discover`, `invalidate`; `keymaps.allocate_letters`, `build_flat_list`, `open_picker`, `register_submenus`, `dynamic_ns`, `reserved`; `runner.run_recipe(dir, recipe)`. Entry shape `{ dir, path, recipes }` and item shape `{ label, dir, recipe }` used consistently across tasks. ✓

**Placeholder scan:** No TBD/TODO; every code step contains complete code; every test step shows assertions. ✓

**Out-of-scope confirmed absent:** no module/submodule support, no concurrent execution, no recipe arguments, no terminal-spawn path. ✓
