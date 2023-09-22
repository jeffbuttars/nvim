-- base set of autocommands for vim events

-- local function SetColorColumn(ccol)
--     if not vim.b["longLineMatchID"] then
--         vim.b.longLineMatchID = 0
--     end
--
--     vim.fn.clearmatches()
--
--     if ccol == 0 or vim.opt.buftype:get() ~= "" or vim.fn.expand("%") == "" or vim.opt.buftype:get() == "log" then
--         vim.opt_local.colorcolumn = "0"
--         vim.opt.textwidth = 0
--
--         return
--     end
--
--     local num_matches = #vim.fn.getmatches()
--     if num_matches < 1 or vim.b.longLineMatchID == 0 or vim.opt.colorcolumn ~= ("" .. (ccol + 1)) then
--         -- echo "SetColorColumn applying" b:longLineMatchID "" a:ccol "\%>".a:ccol."v.\+"
--         vim.opt.colorcolumn = ccol .. ""
--         vim.opt.textwidth = ccol - 1
--         vim.b.longLineMatchID = vim.fn.matchadd("OverColLimit", "\\%>" .. ccol .. "v.\\+", -1)
--     end
-- end

local function AutoSave(args)
    -- print("AutoSave ", args)
    -- close the preview window if it's visible
    -- and the pop up menu is not visible, but not if
    -- we're in a preview window.
    if vim.fn.pumvisible() == 0 and vim.opt.buftype:get() == "" then
        vim.api.nvim_command("pclose")
    end

    if (not vim.opt.modified:get()) or (not vim.api.nvim_buf_get_option(0, "modifiable")) or vim.opt.readonly:get() then
        -- print(
        -- 	"Not Saved " .. vim.fn.expand("%"),
        -- 	args.event,
        -- 	not vim.opt.modified:get(),
        -- 	not vim.api.nvim_buf_get_option(0, "modifiable"),
        -- 	vim.opt.readonly:get(),
        -- 	(not vim.opt.modified:get()) or (not vim.api.nvim_buf_get_option(0, "modifiable")) or vim.opt.readonly:get()
        -- )
        return
    end

    if vim.fn.expand("%") ~= "" then
        if not vim.api.nvim_buf_get_option(args.buf, "modified") then
            -- print("Not Saved " .. vim.fn.expand("%") .. " Unmodified")
            return
        end

        vim.api.nvim_buf_call(args.buf, function()
            vim.api.nvim_cmd({ cmd = "write", args = {}, bang = true }, {})
            print("Saved " .. vim.fn.expand("%"))
        end)
    end
end

local OperatorDefinedAutoCmds = vim.api.nvim_create_augroup("OperatorDefinedAutoCmds", { clear = true })

-- AutoSave often
vim.api.nvim_create_autocmd({ "CursorHold", "BufLeave", "FocusLost", "WinLeave", "VimLeave" }, {
    pattern = "*",
    callback = AutoSave,
    group = OperatorDefinedAutoCmds,
    desc = "AutoSave current buffer",
})

-- Need to make this _not_ change the quickfix size.
vim.api.nvim_create_autocmd({ "VimResized" }, {
    pattern = "*",
    callback = vim.lsp.buf.format,
    group = OperatorDefinedAutoCmds,
})

vim.api.nvim_create_autocmd(
    { "QuickFixCmdPost" },
    { pattern = "*grep*", command = "cwindow", group = OperatorDefinedAutoCmds }
)

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--     pattern = { "python", "sh", "javascript", "java", "c", "lua" },
--     callback = function()
--         SetColorColumn(vim.g.max_line_length)
--     end,
--     group = OperatorDefinedAutoCmds,
-- })

-- Only use cursorline/cursorcolumn in normal mode
-- set linenumbers on by default
-- When in insert mode, show linear numbers
-- When not in insert mode, show current line number with relative numbers
-- And last of all, only be relative in the buffer we're editing.
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    pattern = "*",
    callback = function()
        vim.opt.cursorline = true
        vim.opt.cursorcolumn = true
        vim.opt.relativenumber = true
    end,
    group = OperatorDefinedAutoCmds,
})

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    pattern = "*",
    callback = function()
        vim.opt.cursorline = false
        vim.opt.cursorcolumn = false
        vim.opt.relativenumber = false
    end,
    group = OperatorDefinedAutoCmds,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "WinLeave" }, {
    pattern = "*",
    callback = function()
        vim.opt.relativenumber = false
    end,
    group = OperatorDefinedAutoCmds,
})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "WinEnter" }, {
    pattern = "*",
    callback = function()
        vim.opt.relativenumber = true
    end,
    group = OperatorDefinedAutoCmds,
})

--  When editing a file, always jump to the last known cursor position.
--  Don't do it when the position is invalid or when inside an event handler
--  (happens when dropping a file on gvim).
--  Also don't do it when the mark is in the first line, that is the default
--  position when opening a file.
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = "*",
    callback = function()
        if vim.fn.line("'\"") and vim.fn.line("'\"") <= vim.fn.line("$") then
            -- vim.api.nvim_cmd("normal! g`\"")
            vim.api.nvim_cmd({ cmd = "normal", args = {'g`"'}, bang = true }, {})
        end
    end,
    group = OperatorDefinedAutoCmds,
})

