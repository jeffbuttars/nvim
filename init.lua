-- bootstrap lazy.nvim, LazyVim and your plugins
--
-- set guifont=FiraCode\ Nerd\ Font\ Mono:style=Medium\\,Regular:h24
-- vim.opt.guifont = { "FiraCode Nerd Font Mono", ":h18" }
-- vim.g.gui_font_size = 18

-- vim.opt.guifont = "FiraCode Nerd Font Mono,Hack Nerd Font Mono,Monospace:h18"

require("config.lazy")

if vim.g.neovide then
  require("config.neovide")
end
