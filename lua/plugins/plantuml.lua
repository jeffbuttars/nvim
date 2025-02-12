return {
  {
    "weirongxu/plantuml-previewer.vim",
    dependencies = {
      "tyru/open-browser.vim",
      "aklt/plantuml-syntax",
    },

    init = function()
      vim.g["plantuml_previewer#plantuml_jar_path"] = "/usr/share/java/plantuml/plantuml.jar"
    end,
  },

  -- Optional for puml syntax highlighting:
  {
    "aklt/plantuml-syntax",
    lazy = true,
    ft = "plantuml",
  },
}
