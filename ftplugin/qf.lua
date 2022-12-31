

-- Automatically adjust the quickfix size
-- Set to a ratio/percentag of the window
-- the cursor is in when this is called.
-- Also honor a minimum height so the QFW
-- won't get to small. And if the calculated
-- size is larger then there are lines to put
-- in it, only size QF to the number of items
-- available.
--
-- let &l:winheight = max([3, &lines/3])
vim.opt_local.winheight = math.floor(math.max(3, vim.opt.lines:get()/3))
