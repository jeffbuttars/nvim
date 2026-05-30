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
