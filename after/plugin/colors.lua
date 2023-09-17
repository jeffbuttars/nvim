-- Solarized
-- --
-- -- Solarized setup
-- --
-- local color_scheme = "solarized-high"
-- vim.g.colors_name = "solarized"
-- vim.g.solarized_visibility = "high"
-- vim.g.solarized_statusline = "high"
-- vim.g.solarized_diffmode = "normal"
--
-- -- termtrans If you want to keep the transparency in your terminal (default: disabled)
-- -- To enable transparency
-- if vim.fn.has("gui_running") == 0 then
-- 	vim.g.solarized_termtrans = 0
-- else
-- 	vim.g.solarized_termtrans = 1
-- end

if vim.env.TERM_META == "dark" then
	vim.opt.background = "dark"
elseif vim.env.TERM_META == "light" then
	vim.opt.background = "light"
end

-- Rose Pine
local color_scheme = "rose-pine"

-- Set the colorscheme!
-- vim.g.colors_name = color_scheme
vim.cmd.colorscheme(color_scheme)

-- Make text that crosses the column limit standout
-- Deadcolumn plugin is handling this
-- vim.api.nvim_set_hl(0, "OverColLimit", { standout = true })
