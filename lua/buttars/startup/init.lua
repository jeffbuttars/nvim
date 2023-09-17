-- Startup
-- packer first
-- require("buttars.startup.packer")

-- Keymaps, mapleader, before lazy.
require("buttars.startup.keymaps")
-- require("buttars.startup.lazy_nvim")

require("buttars.startup.autocmds")
require("buttars.startup.ultisnips")

if vim.g.neovide then
    require("buttars.startup.neovide")
end
