return {
  {
    "iamcco/markdown-preview.nvim",
    opts = function(_, opts)
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = { server = "http://localhost:9999/plantuml", imageFormat = "png" },
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 0,
        toc = {},
      }
    end,
    -- init = function()
    -- options for Markdown rendering
    -- mkit: markdown-it options for rendering
    -- katex: KaTeX options for math
    -- uml: markdown-it-plantuml options
    -- maid: mermaid options
    -- disable_sync_scroll: whether to disable sync scroll, default 0
    -- sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
    --   middle: means the cursor position is always at the middle of the preview page
    --   top: means the Vim top viewport always shows up at the top of the preview page
    --   relative: means the cursor position is always at relative positon of the preview page
    -- hide_yaml_meta: whether to hide YAML metadata, default is 1
    -- sequence_diagrams: js-sequence-diagrams options
    -- content_editable: if enable content editable for preview page, default: v:false
    -- disable_filename: if disable filename header for preview page, default: 0
    -- vim.g.mkdp_preview_options = {
    --   mkit = {},
    --   katex = {},
    --   uml = { server = "https://localhost:9999/plantuml" },
    --   maid = {},
    --   disable_sync_scroll = 0,
    --   sync_scroll_type = "middle",
    --   hide_yaml_meta = 1,
    --   sequence_diagrams = {},
    --   flowchart_diagrams = {},
    --   content_editable = false,
    --   disable_filename = 0,
    --   toc = {},
    -- }
    -- end,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      -- You will not need this if you installed the
      -- parsers manually
      -- Or if the parsers are in your $RUNTIMEPATH
      "nvim-treesitter/nvim-treesitter",

      "nvim-tree/nvim-web-devicons",
    },
  },
}
