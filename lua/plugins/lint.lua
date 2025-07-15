return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        golangcilint = {
          cmd = "golangci-lint",
          append_fname = false,
          stream = "stdout",
          args = {
            "run",
            "--enable=revive",
            "--output.json.path=stdout",
            -- Overwrite values possibly set in .golangci.yml
            "--output.text.path=",
            "--output.tab.path=",
            "--output.html.path=",
            "--output.checkstyle.path=",
            "--output.code-climate.path=",
            "--output.junit-xml.path=",
            "--output.teamcity.path=",
            "--output.sarif.path=",
            "--issues-exit-code=0",
            "--show-stats=false",
            -- Get absolute path of the linted file
            "--path-mode=abs",
            function()
              return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
            end,
          },
        },
      },
    },
  },
}
