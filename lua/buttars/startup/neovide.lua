-- https://github.com/Kethku/neovide/wiki/Configuration

-- Font
-- let g:neovide_cursor_vfx_mode = "railgun"
-- let g:neovide_cursor_vfx_mode = "torpedo"
-- let g:neovide_cursor_vfx_mode = "sonicboom"
-- let g:neovide_cursor_vfx_mode = "ripple"
-- let g:neovide_cursor_vfx_mode = "wireframe"
-- let g:neovide_cursor_vfx_mode = "pixiedust"
--
-- https://neovide.dev/faq.html
-- Adjust the font size while running
vim.g.gui_font_default_size = 14
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "FiraCode Nerd Font Mono"

local RefreshGuiFont = function()
  -- vim.opt.guifont = string.format("%s:h%s",vim.g.gui_font_face, vim.g.gui_font_size)
  vim.opt.guifont = {vim.g.gui_font_face, string.format(":h%s", vim.g.gui_font_size)}
end

local ResizeGuiFont = function(delta)
  vim.g.gui_font_size = vim.g.gui_font_size + delta
  RefreshGuiFont()
end

local ResetGuiFont = function()
  vim.g.gui_font_size = vim.g.gui_font_default_size
  RefreshGuiFont()
end

-- Call function on startup to set default value
ResetGuiFont()
vim.g.neovide_cursor_trail_length = 0.1
vim.g.neovide_cursor_animation_length = 0


-- vim.g.neovide_transparency=0.9
vim.g.neovide_refresh_rate = 60

-- Setting g:neovide_floating_blur_amount_x and g:neovide_floating_blur_amount_y controls the blur radius on the respective axis for floating windows.
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

-- set guifont=FiraCode\ Nerd\ Font\ Mono:style=Medium\\,Regular:h24
-- vim.opt.guifont = {"FiraCode Nerd Font Mono", ":h10"}


-- Keymaps
local opts = { noremap = true, silent = true }

vim.keymap.set({'n', 'i'}, "<C-=>", function() ResizeGuiFont(1)  end, opts)
vim.keymap.set({'n', 'i'}, "<C-->", function() ResizeGuiFont(-1) end, opts)
