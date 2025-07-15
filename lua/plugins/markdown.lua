return {
  {
    "iamcco/markdown-preview.nvim",
    opts = function(_, _)
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_open_to_the_world = 1
      vim.g.mkdp_echo_preview_url = 1
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
