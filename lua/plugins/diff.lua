M = {}

function M.find_window_by_filetype(filetype)
  for i = 1, vim.fn.winnr("$") do
    local winid = vim.fn.win_getid(i)
    local bufnr = vim.api.nvim_win_get_buf(winid)
    if vim.bo[bufnr].filetype == filetype then
      return winid, bufnr
    end
  end
  return nil, nil
end

function M.focus_window(winid)
  if winid and vim.api.nvim_win_is_valid(winid) then
    vim.api.nvim_set_current_win(winid)
    return true
  end
  return false
end

function M.focus_explorer()
  local winid = M.find_window_by_filetype("codediff-explorer")
  return M.focus_window(winid)
end

-- AIDEV-NOTE: branch-vs-working diff has no built-in "create file missing in working tree".
-- Source side is a read-only codediff:// buffer; restore_entry only does unstaged/HEAD.
-- This writes the source-revision content of the explorer's selected file to disk.
function M.create_from_source()
  local accessors = require("codediff.ui.lifecycle.accessors")
  local git = require("codediff.core.git")

  local tabpage = vim.api.nvim_get_current_tabpage()
  local explorer = accessors.get_panel_name(tabpage) == "explorer"
    and accessors.get_panel_view(tabpage)
  if not explorer or not explorer.data.git_root then
    vim.notify("Not in a CodeDiff explorer", vim.log.levels.WARN)
    return
  end

  -- Only meaningful when the target side is the working tree (writable on disk).
  local data = explorer.data
  if data.target_revision and data.target_revision ~= "WORKING" then
    vim.notify(
      "Create-on-disk needs one side to be the working tree (use CodeDiff <branch>)",
      vim.log.levels.WARN
    )
    return
  end

  local source_rev = data.base_revision
  if not source_rev then
    vim.notify("No source revision in this session", vim.log.levels.WARN)
    return
  end

  local node = explorer.tree:get_node()
  if not node or not node.data or not node.data.path then
    vim.notify("No file selected in explorer", vim.log.levels.WARN)
    return
  end
  local rel = node.data.path
  local abs = data.git_root .. "/" .. rel

  if (vim.uv or vim.loop).fs_stat(abs) then
    vim.notify("File already exists: " .. rel, vim.log.levels.WARN)
    return
  end

  git.get_file_content(source_rev, data.git_root, rel, function(err, lines)
    vim.schedule(function()
      if err then
        vim.notify(err, vim.log.levels.ERROR)
        return
      end
      vim.fn.mkdir(vim.fn.fnamemodify(abs, ":h"), "p")
      vim.fn.writefile(lines, abs)
      vim.notify("Created " .. rel .. " from " .. source_rev:sub(1, 8), vim.log.levels.INFO)
    end)
  end)
end

-- AIDEV-NOTE: buffer-local map in codediff explorer; <leader>Dc creates the selected
-- missing file on disk from the source revision (see M.create_from_source).
vim.api.nvim_create_autocmd("FileType", {
  pattern = "codediff-explorer",
  callback = function(args)
    vim.keymap.set("n", "<leader>Dc", M.create_from_source, {
      buffer = args.buf,
      silent = true,
      desc = "CodeDiff create file from source",
    })
    vim.schedule(function()
      for _, winid in ipairs(vim.fn.win_findbuf(args.buf)) do
        vim.wo[winid].number = true
        vim.wo[winid].relativenumber = true
      end
    end)
  end,
})

return {
  -- {
  --   "sindrets/diffview.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   cmd = {
  --     "DiffviewClose",
  --     "DiffviewFileHistory",
  --     "DiffviewFocusFiles",
  --     "DiffviewLog",
  --     "DiffviewOpen",
  --     "DiffviewRefresh",
  --     "DiffviewToggleFiles",
  --   },
  --   keys = {
  --     { "<leader>D", mode = "n", desc = "Diffview" },
  --     { "<leader>Dc", "<cmd>DiffviewClose<cr>", mode = "n", desc = "Diffview Close" },
  --     { "<leader>Df", "<cmd>DiffviewFocusFiles<cr>", mode = "n", desc = "Diffview Focus Files" },
  --     { "<leader>Dh", "<cmd>DiffviewFileHistory<cr>", mode = "n", desc = "Diffview File History" },

  --     { "<leader>Dm", "<cmd>DiffviewOpen main<cr>", mode = "n", desc = "Diffview Open <main>" },
  --     { "<leader>Do", "<cmd>DiffviewOpen<cr>", mode = "n", desc = "Diffview Open" },
  --     { "<leader>Dr", "<cmd>DiffviewRefresh<cr>", mode = "n", desc = "Diffview Refresh" },
  --     { "<leader>Dt", "<cmd>DiffviewToggleFiles<cr>", mode = "n", desc = "Diffview Toggle Files" },
  --   },
  -- },
  {
    "esmuellert/codediff.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = "CodeDiff",
    keys = {
      { "<leader>D", desc = "diff" },
      { "<leader>De", M.focus_explorer, mode = { "n" }, desc = "Diff Explorer focus" },
      { "<leader>DD", "<cmd>CodeDiff<cr>", mode = { "n" }, desc = "CodeDiff Explorer" },
      { "<leader>Dd", ":CodeDiff ", mode = { "n" }, desc = "Diff with ..." },
      { "<leader>Df", "<cmd>CodeDiff file HEAD<cr>", mode = { "n" }, desc = "Diff file to HEAD" },
      { "<leader>Dh", "<cmd>CodeDiff history<cr>", mode = { "n" }, desc = "History of Diffs" },
      {
        "<leader>Dm",
        "<cmd>CodeDiff main<cr>",
        mode = { "n" },
        desc = "CodeDiff Explorer to main",
      },
      {
        "<leader>DU",
        "<cmd>CodeDiff upstream/main<cr>",
        mode = { "n" },
        desc = "CodeDiff Explorer to upstream/main",
      },
      {
        "<leader>Db",
        function()
          require("snacks").picker.git_branches({
            -- AIDEV-NOTE: custom format strips commit/log suffix; shows current-marker + branch only.
            format = function(item)
              local marker = item.current and { " ", "SnacksPickerGitBranchCurrent" } or { "  " }
              if item.detached then
                return { marker, { "(detached HEAD)", "SnacksPickerGitDetached" } }
              end
              return { marker, { item.branch, "SnacksPickerGitBranch" } }
            end,
            -- AIDEV-NOTE: custom previewer; header + syntax-highlighted git log via Snacks renderer.
            preview = function(ctx)
              local item = ctx.item
              if not item then
                return
              end
              local ref = item.branch or "(detached HEAD)"
              local cwd = item.cwd or vim.uv.cwd()
              local function git(args)
                local out = vim.system({ "git", "-C", cwd, unpack(args) }):wait()
                return (out.stdout or ""):gsub("%s+$", "")
              end
              local full_ref = item.branch and git({ "rev-parse", "--symbolic-full-name", ref })
                or ""
              local upstream = item.branch
                  and git({ "for-each-ref", "--format=%(upstream:short)", "refs/heads/" .. ref })
                or ""

              local label_hl = "SnacksPickerDir"
              local branch_hl = item.current and "SnacksPickerGitBranchCurrent"
                or "SnacksPickerGitBranch"
              local lines = {
                { { "Branch:   ", label_hl }, { ref, branch_hl } },
                {
                  { "Ref:      ", label_hl },
                  { full_ref ~= "" and full_ref or "-", "SnacksPickerComment" },
                },
                {
                  { "Upstream: ", label_hl },
                  { upstream ~= "" and upstream or "-", "SnacksPickerGitBranch" },
                },
                {
                  { "Commit:   ", label_hl },
                  { item.commit or "-", "SnacksPickerGitCommit" },
                  { "  " },
                  { item.msg or "", "SnacksPickerGitMsg" },
                },
                { { string.rep("─", 60), "SnacksPickerComment" } },
                { { "" } },
              }

              local log = vim
                .system({
                  "git",
                  "-C",
                  cwd,
                  "--no-pager",
                  "log",
                  "--pretty=format:%h %s (%cr) <%an>",
                  "--abbrev-commit",
                  "--decorate",
                  "--color=never",
                  "-n",
                  "50",
                  item.commit,
                }, { text = true })
                :wait()

              for _, text in ipairs(vim.split(log.stdout or "", "\n", { plain = true })) do
                local commit, msg, date, author = text:match("^(%S+) (.*) %((.*)%) <(.*)>$")
                if commit then
                  lines[#lines + 1] = Snacks.picker.format.git_log({
                    idx = 1,
                    score = 0,
                    text = "",
                    commit = commit,
                    msg = msg,
                    date = date,
                    author = author,
                  }, ctx.picker)
                elseif text ~= "" then
                  lines[#lines + 1] = { { text } }
                end
              end

              local buf = ctx.preview:scratch()
              ctx.preview:set_title(ref)
              local ns = vim.api.nvim_create_namespace("snacks_branch_preview")
              Snacks.picker.highlight.render(buf, ns, lines)
              Snacks.util.wo(ctx.win, { breakindent = true, wrap = true, linebreak = true })
            end,
            confirm = function(picker, item)
              picker:close()
              if item and item.branch then
                vim.cmd("CodeDiff " .. item.branch)
              end
            end,
          })
        end,
        mode = { "n" },
        desc = "CodeDiff branch picker",
      },
      {
        "<leader>Dt",
        function()
          local picker = require("snacks").picker
          -- AIDEV-NOTE: explorer for tree nav (h/l/<BS>); <C-y> commits highlighted dir to callback.
          local function pick_dir(title, on_pick)
            picker.explorer({
              title = title,
              auto_close = false,
              actions = {
                pick_dir = function(self)
                  local dir = self:dir()
                  self:close()
                  if dir then
                    on_pick(dir)
                  end
                end,
              },
              win = { list = { keys = { ["<C-y>"] = "pick_dir" } } },
            })
          end

          pick_dir("From directory (<C-y> to select)", function(fromDir)
            pick_dir("To directory (<C-y> to select)", function(toDir)
              -- AIDEV-NOTE: relocate next qf to a left panel; once=true so it
              -- self-cleans after DiffTool's qf opens (sync or async).
              vim.api.nvim_create_autocmd("FileType", {
                pattern = "qf",
                once = true,
                callback = function()
                  vim.cmd("wincmd H")
                  -- AIDEV-NOTE: winfixwidth locks qf so `wincmd =` only
                  -- equalizes the diff panes, leaving qf at 70 cols.
                  local qf_win = vim.api.nvim_get_current_win()
                  vim.api.nvim_win_set_width(qf_win, 70)
                  vim.wo[qf_win].winfixwidth = true
                  vim.cmd("wincmd =")
                end,
              })

              -- AIDEV-NOTE: call the Lua API (not :DiffTool) so we can pass `ignore`; the command
              -- doesn't forward opts. diffr engine maps these to `diff -x GLOB` (basename globs,
              -- NOT regex). Respects the difftool.lua vendored/bundled toggle.
              require("difftool").open(fromDir, toDir, {
                ignore = {
                  ".git",
                  "node_modules",
                  ".venv",
                  "__pycache__",
                  ".ruff_cache",
                  ".mypy_cache",
                  ".pytest_cache",
                  "dist",
                  "build",
                  "*~",
                  "*.log",
                },
              })
            end)
          end)
        end,
        mode = { "n" },
        desc = "DiffTool diff dirs",
      },
    },

    opts = {
      explorer = {
        view_mode = "tree",
        width = 60,
      },
      -- Highlight configuration
      -- highlights = {
      --   -- Line-level: accepts highlight group names or hex colors (e.g., "#2ea043")
      --   line_insert = "DiffAdd", -- Line-level insertions
      --   line_delete = "DiffDelete", -- Line-level deletions
      --
      --   -- Character-level: accepts highlight group names or hex colors
      --   -- If specified, these override char_brightness calculation
      --   char_insert = nil, -- Character-level insertions (nil = auto-derive)
      --   char_delete = nil, -- Character-level deletions (nil = auto-derive)
      --
      --   -- Brightness multiplier (only used when char_insert/char_delete are nil)
      --   -- nil = auto-detect based on background (1.4 for dark, 0.92 for light)
      --   char_brightness = nil, -- Auto-adjust based on your colorscheme
      --
      --   -- Conflict sign highlights (for merge conflict views)
      --   -- Accepts highlight group names or hex colors (e.g., "#f0883e")
      --   -- nil = use default fallback chain
      --   conflict_sign = nil, -- Unresolved: DiagnosticSignWarn -> #f0883e
      --   conflict_sign_resolved = nil, -- Resolved: Comment -> #6e7681
      --   conflict_sign_accepted = nil, -- Accepted: GitSignsAdd -> DiagnosticSignOk -> #3fb950
      --   conflict_sign_rejected = nil, -- Rejected: GitSignsDelete -> DiagnosticSignError -> #f85149
      -- },
      -- highlights = {
      --   line_insert = "CodeDiffLineInsert", -- Line-level insertions
      --   line_delete = "CodeDiffLineDelete", -- Line-level deletions
      --   char_insert = "CodeDiffCharInsert",
      --   char_delete = "CodeDiffCharDelete",
      --   diff_filler = "CodeDiffFiller",
      -- }
    },
  },
  {
    "undont/differ.nvim",
    build = "make go-build",
    config = function()
      require("differ").setup({
        layout = "split", -- "stacked" | "split", toggleable per-view
        context = math.huge, -- fold threshold; math.huge = whole file, no folds
        wrap = true, -- soft-wrap long lines in the diff view
        diff_counter = true, -- "hunk K/N" counter in the diff window's winbar
        cursorline_tint = true, -- tint the cursor line by add/remove so the change
        -- kind reads under the cursor; false = plain neutral
        deep_diff = {
          enabled = true,
          granularity = "word", -- "word" | "char"
          similarity_threshold = 0.5, -- line-pairing cutoff for word-level diffing
        },
        comments = { -- pr review threads
          inline = true,
          collapsed = false,
        },
        panel = { -- file panel default placement/size; `:Differ panel`
          -- and the runtime Panel.current() setters override per-session
          position = "left", -- "bottom" | "top" | "left" | "right"
          height = 9, -- top/bottom
          width = 35, -- left/right
          listing = "tree", -- "tree" | "name"
          progress = true, -- "file K/N" position meter in the panel winbar
        },
        history = { -- log/history sidebar default placement/size
          position = "bottom",
          height = 10, -- top/bottom
          width = 40, -- left/right
        },
        merge = { -- merge tool pane layout; no per-invocation override
          layout = "default", -- "default" (ours | theirs) | "diff4" (adds base)
        },
        keymaps = { -- one flat action -> lhs table, shared across the diff,
          -- a value is a string, a list of strings, or false to disable. override globally
          -- here, or scope to one surface via a diff/panel/history/merge = {...} subtable
          next_hunk = "]c", -- diff, panel, history
          prev_hunk = "[c",
          next_file = "]f", -- diff; panel/history step the selection
          prev_file = "[f",
          first_file = "gg", -- panel/history: jump to the first/last file or commit
          last_file = "G",
          next_section = "]]", -- panel: sections (Staged/Unstaged); history: commits
          prev_section = "[[",
          scroll_down = "f", -- all three (shadows native f/b; set false to restore)
          scroll_up = "b",
          select = { "<CR>", "o" }, -- panel, history
          help = "g?", -- panel, history
          toggle_listing = "i", -- panel: toggle tree / name
          close_node = "c", -- panel: collapse the dir under the cursor; history: the commit
          close_all = "C", -- panel/history: collapse every dir / commit
          open_all = "O", -- panel/history: expand every dir / commit
          stage = "s",
          unstage = "u", -- diff (hunk-level), panel (file-level)
          stage_all = "S",
          unstage_all = "U",
          more_context = "d=",
          less_context = "d-", -- diff
          edit_file = "df", -- diff: edit-in-review; pr diff: worktree split beside the pinned diff
          goto_file = "de", -- diff: open the real file and end the session; pr diff: zoom-edit in a tab instead
          discard = "X", -- diff (revert a hunk), panel (discard a file)
          refresh = "R", -- panel
          toggle_fold = "za", -- history (range mode)
          close = "dc", -- diff/panel/history: end the session
          toggle_panel = "dd", -- diff/panel: hide/show the file panel sidebar
          toggle_layout = "dl", -- diff: flip stacked / split
          -- pr review (pr diff + panel)
          toggle_viewed = "<Tab>", -- pr panel: flip the github viewed checkbox
          next_unviewed = "]u",
          prev_unviewed = "[u", -- pr panel + diff
          next_thread = "]t",
          prev_thread = "[t", -- pr diff
          comment = "ga", -- pr diff: comment on the line (normal) or selection (visual)
          reply = "gp", -- pr diff: reply to the thread under the cursor
          delete_comment = "gx", -- pr diff: delete the latest comment of the thread
          toggle_thread = "gc", -- pr diff: collapse/expand the thread under the cursor
          resolve_thread = "gr", -- pr diff: resolve/unresolve the thread under the cursor
          overview = "go", -- pr diff + panel: back to the PR overview home
          review_submit = "gS", -- pr: submit the pending review
          review_discard = "gD", -- pr: discard the pending review and its drafts
          -- merge tool, bound on the result buffer
          next_conflict = "]x",
          prev_conflict = "[x",
          choose_ours = "<leader>co",
          choose_theirs = "<leader>ct",
          choose_base = "<leader>cb",
          choose_all = "<leader>ca", -- take both (ours then theirs)
          choose_none = "<leader>cx", -- drop the conflict region
        },
        relative_dates = false, -- "3 days ago" instead of YYYY-MM-DD wherever a date shows
        base = nil, -- base branch for `base`/`log base`; nil auto-detects origin/HEAD
        sidecar_bin = nil, -- override the go sidecar path
        command_alias = nil, -- extra :command(s) routing to :Differ, e.g. "D" or { "D", "Df" }
      })
    end,
  },
}
