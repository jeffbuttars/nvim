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
