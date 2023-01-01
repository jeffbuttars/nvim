-- Global settings first, then packer
require("buttars.initial_setup")
require("buttars.packer")

require("buttars.keymaps")
require("buttars.autocmds")
require("buttars.ultisnips")

if vim.g.neovide then
    require("buttars.neovide")
end
