-- LSP Zero setup

local lsp = require("lsp-zero").preset({})

local function code_action_organizes_imports(code_action_obj)
    if code_action_obj.kind == "source.organizeImports" then
        -- vim.print("TRUE CA OBJ:", code_action_obj)
        return true
    end

    -- vim.print("FALSE CA OBJ:", code_action_obj)
    return false
end

local function code_action_fixes_all(code_action_obj)
    if code_action_obj.kind == "source.fixAll" then
        -- vim.print("TRUE CA OBJ:", code_action_obj)
        return true
    end

    -- vim.print("FALSE CA OBJ:", code_action_obj)
    return false
end

local function format_filter(format_obj)
    vim.print("FMT OBJ NAME:", format_obj.name)
    if format_obj.name == 'ruff_lsp' then
        vim.print("FMT OBJ:", format_obj)
    end
    return true
end

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "eslint" then
        vim.cmd.LspStop("eslint")
        return
    end

    lsp.default_keymaps({ buffer = bufnr })

    -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "c-]", function()
        vim.lsp.buf.definition()
    end, opts)

    vim.keymap.set("n", "c-i", function()
        vim.lsp.buf.implementation()
    end, opts)

    vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
    end, opts)

    vim.keymap.set("n", "<leader>ca", function()
        vim.lsp.buf.code_action()
    end, opts)

    -- vim.keymap.set("n", "<leader>vrr", function()
    --     vim.lsp.buf.references()
    -- end, opts)

    -- vim.keymap.set("n", "<leader>vrn", function()
    --     vim.lsp.buf.rename()
    -- end, opts)

    vim.keymap.set("n", "<C-k>", function()
        vim.lsp.buf.signature_help()
    end, opts)

    if client.supports_method("textDocument/formatting") then
        vim.keymap.set("n", "<leader>f", function()

            vim.lsp.buf.format()
            -- vim.lsp.buf.code_action({ filter = code_action_organizes_imports, apply = true })
            -- vim.lsp.buf.code_action({filter = code_action_fixes_all, apply=true})

            -- vim.lsp.buf.format({filter = format_filter})
            -- vim.lsp.buf.format({ async=true })
        end, opts)
    end

    -- LSP key map for formatting a buffer
end)

-- Mason integration
require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = { 'jedi_language_server', 'bashls', 'lua_ls', 'tsserver', 'rust_analyzer' },

    handlers = {
        lsp.default_setup,
        lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
        end,
    },
})


-- Cofigure nvim-cmp and lspconfig directly now
require("buttars.cmp")
require("buttars.lspconfig")

-- Diagnositcs display setup
-- maybe put diagnostics setup in a different file?
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md#diagnostics
-- https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.config()
vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    severity_sort = true, -- defaulted to false
    signs = true,
    update_in_insert = false,
})

-- show diagnostics popup when we're chillin in normal mode
local MyLSPGroup = vim.api.nvim_create_augroup("MyCustomAutocmds", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
    pattern = "*",
    callback = function()
        vim.diagnostic.open_float(0, { focusable = false, scope = "line" })
    end,
    group = MyLSPGroup,
})
