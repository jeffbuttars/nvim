-- packer first
require("buttars.startup.packer")

require("buttars.startup.keymaps")
require("buttars.startup.autocmds")
require("buttars.startup.ultisnips")

if vim.g.neovide then
    require("buttars.startup.neovide")
end
