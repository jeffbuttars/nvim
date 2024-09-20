return {
  {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = false,
      columns = {
        "icon",
        "permissions",
        "size",
        -- "mtime",
      },
      -- Window-local options to use for oil buffers
      win_options = {
        wrap = false,
        signcolumn = "yes",
        cursorcolumn = true,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
      },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
