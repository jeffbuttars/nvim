-- https://github.com/Kethku/neovide/wiki/Configuration

-- let g:neovide_cursor_vfx_mode = "railgun"
-- let g:neovide_cursor_vfx_mode = "torpedo"
-- let g:neovide_cursor_vfx_mode = "sonicboom"
-- let g:neovide_cursor_vfx_mode = "ripple"
-- let g:neovide_cursor_vfx_mode = "wireframe"
-- let g:neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_cursor_trail_length = 0.1

-- vim.g.neovide_transparency=0.9
vim.g.neovide_refresh_rate = 60

-- Setting g:neovide_floating_blur_amount_x and g:neovide_floating_blur_amount_y controls the blur radius on the respective axis for floating windows.
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

-- set guifont=FiraCode\ Nerd\ Font\ Mono:style=Medium\\,Regular:h24
vim.opt.guifont = {"FiraCode Nerd Font Mono", ":h12"}
