# Design: Just recipes from subdirectories

Date: 2026-05-30
File affected: `lua/plugins/just.lua`

## Goal

Extend the `just.nvim` plugin config so recipes defined in **independent
justfiles under the current working directory** (not just the cwd justfile)
are discoverable and runnable. Two access surfaces: a catch-all picker and
auto-generated per-directory submenus. Best-effort — "just works" for whatever
justfiles happen to be present.

## Key constraints discovered

- `just.nvim`'s runner (`task_runner`, `init.lua:234-238`) hardcodes
  `cwd = vim.fn.getcwd()` and `command = "just"` with `args = {recipe, ...}`.
  There is **no API** to target a different justfile or working directory.
- `cwd` is captured **synchronously** at job-construction time, before the
  async job starts. So a window-local `lcd` into a subdir, immediately followed
  by `run_task_name(recipe)` and a cwd restore in the same tick, makes the
  spawned job use the subdir cwd while leaving everything else untouched.
  This lets subdir recipes reuse the full fidget + quickfix pipeline.
- `just.nvim` has a single global `async_worker` — **one task at a time**
  (which is why the fixed keys call `stop_current_task()` first). Subdir
  recipes inherit this model.
- `just` 1.34.0 supports `just --justfile <path> --working-directory <dir>
  --list --unsorted` for listing a specific justfile's recipes from elsewhere.

## Architecture

Three concerns, split out of today's single combined function:

### 1. Discovery

- Walk directories under cwd for `justfile` / `Justfile` / `.justfile`.
- Depth-limited (default **2**) and pruning junk dirs: `.git`, `node_modules`,
  `target`, `.venv`, `dist`, `build`, `.direnv` (extend as needed).
- For each justfile found, list its recipes via
  `just --justfile <path> --working-directory <dir> --list --unsorted`.
- Return a sorted list of entries:
  `{ dir = "frontend", path = "/abs/frontend/justfile", recipes = {"build","dev"} }`.
- **Cache** keyed by cwd; invalidate on `BufWritePost` of any justfile.
  (Removes the current per-`BufEnter` subprocess spawn.)

### 2. Runner

`run_recipe(dir, recipe)`:

1. Save current window cwd.
2. Window-local `lcd <dir>`.
3. `require("just").stop_current_task()`.
4. `require("just").run_task_name(recipe)`.
5. Restore cwd (same tick — job already captured its cwd at step 4).

Subdir recipes get identical UX to the local fixed keys: fidget progress,
quickfix-on-error, `stop_current_task` semantics.

The existing fixed local keys (`<leader>Jt/Jb/Js/Jk`) and `<leader>JJ`
(local-recipe select) are **unchanged**.

### 3. Keymaps — two surfaces over the discovery data

**Picker (catch-all):** new key **`<leader>Jp`** → `vim.ui.select` over a flat
list. Local recipes shown as `./recipe`, subdir recipes as `dir/recipe`:

```
./build        ./test        ./serve
frontend/build frontend/dev
backend/test   backend/migrate
```

Selecting dispatches through `run_recipe` (local entries via cwd, `dir == "."`).
`vim.ui.select` inherits the user's configured picker UI (snacks/telescope/etc).

**Per-directory submenus:** for each discovered subdir, auto-assign a letter and
register a which-key group `<leader>J<dirLetter>`, with each recipe under its own
letter: `<leader>J<dirLetter><recipeLetter>` → `run_recipe(dir, recipe)`.

- Letter allocation uses the existing first-char / uppercase-fallback logic, but
  against **one unified used-keys set** shared with the local dynamic keys and
  the reserved set (`J`, `t`, `b`, `s`, `k`). Subdir groups never clobber the
  fixed keys or each other.
- Allocation is **deterministic**: sort dirs and recipes before assigning, so
  letters do not reshuffle between redraws (preserves muscle memory).
- which-key descriptions carry real names (`➡️ frontend`, `frontend: build`) so
  arbitrary letters stay discoverable.

## Error handling & edge cases

- No justfiles found → picker and submenus simply empty. No error.
  (Preserves current behavior.)
- `just --list` failure on a malformed subdir justfile → skip that dir and emit
  a single `vim.notify` warning naming the file. Never silently swallowed
  (per global rules).
- Stale dynamic keys cleaned on rewalk, same as today's del-loop, extended to
  cover subdir group keys.
- Recursion depth and prune list are constants near the top of the file for
  easy tuning.

## Out of scope (YAGNI)

- `just` module / submodule support (`mod` imports, `--list-submodules`).
- Concurrent execution of multiple recipes (blocked by `just.nvim`'s single
  `async_worker`).
- Recipes that take arguments/parameters.
- Self-spawned terminal execution (interactive long-running recipes).
