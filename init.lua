-- bootstrap lazy.nvim, LazyVim and your plugins

vim.g.lazyvim_blink_main = "1.*"
require("config.lazy")

if vim.g.neovide then
  require("config.neovide")
end
