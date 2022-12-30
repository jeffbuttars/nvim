-- Global settings first, then packer
require("buttars.initial_setup")
require("buttars.packer")

require("buttars.remap")

if vim.g.neovide then
    require("buttars.neovide")
end
