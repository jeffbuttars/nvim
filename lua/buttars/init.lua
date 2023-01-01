-- Global settings first, then packer
require("buttars.initial_setup")
require("buttars.packer")

require("buttars.keymaps")
require("buttars.event")

if vim.g.neovide then
    require("buttars.neovide")
end
