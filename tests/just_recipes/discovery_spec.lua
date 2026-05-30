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
