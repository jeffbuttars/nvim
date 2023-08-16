-- LSP Zero setup

local lsp = require("lsp-zero").preset({})

lsp.preset("recommended")

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
    severity_sort = true,     -- defaulted to false
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

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "eslint" then
        vim.cmd.LspStop("eslint")
        return
    end

    lsp.default_keymaps({buffer = bufnr})

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

    vim.keymap.set("n", "<leader>vca", function()
        vim.lsp.buf.code_action()
    end, opts)

    vim.keymap.set("n", "<leader>vrr", function()
        vim.lsp.buf.references()
    end, opts)

    vim.keymap.set("n", "<leader>vrn", function()
        vim.lsp.buf.rename()
    end, opts)

    vim.keymap.set("n", "<C-k>", function()
        vim.lsp.buf.signature_help()
    end, opts)

    -- LSP key map for formatting a buffer
    vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({
            timeout_ms = 1000,
            -- async=true
        })
    end, opts)

end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- -- TypeScript
-- require("lspconfig").tsserver.setup({})
-- require("lspconfig").eslint.setup({})

-- HTML / Emmet
lsp.configure("emmet_ls", {
    -- capabilities = vim.lsp.protocol.make_client_capabilities(),
    filetypes = {
        "css",
        "html",
        "htmldjango",
        "javascriptreact",
        "less",
        "sass",
        "scss",
        "typescriptreact",
    },
})

lsp.configure("pylsp", {
    pylsp = {
        -- configurationSources = {"black"},
        settings = {
            pylsp = {
                plugins = {
                    black = {
                        enabled = true
                    },
                    isort = {
                        enabled = true,
                        profile = "black"
                    },
                    jedi_completion = {
                        enabled = true
                        -- fuzzy = true
                    },
                    rope_autoimport = {
                        enabled = true
                    },
                    pycodestyle = {
                        enabled = false,
                        ignore = { 'W391' },
                        maxLineLength = 100
                    },
                }
            }
        },
   }
})


lsp.setup()

-- Ensure cmp setup happens after lsp_zero setup()
require("buttars.cmp")

-- setup our preferred cmp setup
-- 1.X style
-- lsp.setup_nvim_cmp({
--     completion = butt_cmp.completion,
--     mapping = lsp.defaults.cmp_mappings(butt_cmp.mappings),
--     sources = butt_cmp.sources,
--     formatting = butt_cmp.formatting,
-- })

-- local status, nvim_lsp = pcall(require, "lspconfig")
-- if (not status) then return end
--
-- nvim_lsp.tsserver.setup {
--   on_attach = lsp.on_attach,
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
--   cmd = { "typescript-language-server", "--stdio" }
-- }
