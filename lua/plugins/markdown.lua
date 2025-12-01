return {
  {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.g.mkdp_auto_close = 0

      -- set to 1, the preview server is available to others in your network.
      -- By default, the server listens on localhost (127.0.0.1)
      -- default: 0
      vim.g.mkdp_open_to_the_world = 1

      -- set to 1, echo preview page URL in command line when opening preview page default is 0
      vim.g.mkdp_echo_preview_url = 1

      -- vim.g.mkdp_browser = "/usr/bin/firefox"

      -- options for Markdown rendering
      -- mkit: markdown-it options for rendering
      -- katex: KaTeX options for math
      -- uml: markdown-it-plantuml options
      -- maid: mermaid options
      -- disable_sync_scroll: whether to disable sync scroll, default 0
      -- sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
      --   middle: means the cursor position is always at the middle of the preview page
      --   top: means the Vim top viewport always shows up at the top of the preview page
      --   relative: means the cursor position is always at relative position of the preview page
      -- hide_yaml_meta: whether to hide YAML metadata, default is 1
      -- sequence_diagrams: js-sequence-diagrams options
      -- content_editable: if enable content editable for preview page, default: v:false
      -- disable_filename: if disable filename header for preview page, default: 0
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
  },
  {
    "yousefhadder/markdown-plus.nvim",
    ft = "markdown",
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {

      code = {
        sign = true,
        width = "full",
      },
      heading = {
        enabled = true,
        sign = true,
        -- icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
    },
  },
}
