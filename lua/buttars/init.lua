-- Startup init, then plugins, then the rest
require("buttars.startup")

-- Initialize Lazy and load the plugins specs
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("buttars.plugins")


-- If we're using neovide, loads it's config
if vim.g.neovide then
    require("buttars.neovide")
end
