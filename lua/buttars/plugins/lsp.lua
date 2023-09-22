return {
    {
        "VonHeikemen/lsp-zero.nvim",
        -- branch = "v2.x",
        -- branch = "dev-v3",
        branch = "v3.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            { "luals/lua-language-server" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-nvim-lsp-signature-help" },
            { "hrsh7th/cmp-cmdline" },
            -- { "saadparwaiz1/cmp_luasnip" },
            { "tamago324/cmp-zsh",                   dependencies = { "Shougo/deol.nvim" } },

            -- Snippets
            -- { "L3MON4D3/LuaSnip" },  -- Supports UltiSnips style of snippets
            -- { "rafamadriz/friendly-snippets" },
            { "quangnguyen30192/cmp-nvim-ultisnips", dependencies = { "SirVer/ultisnips" } },
            { "SirVer/ultisnips" },
            { "honza/vim-snippets" },
            { "onsails/lspkind.nvim" },
        },
        config = function()
            -- LSP Zero setup

            local lsp_zero = require("lsp-zero").preset({})

            -- local function code_action_organizes_imports(code_action_obj)
            --     if code_action_obj.kind == "source.organizeImports" then
            --         -- vim.print("TRUE CA OBJ:", code_action_obj)
            --         return true
            --     end
            --
            --     -- vim.print("FALSE CA OBJ:", code_action_obj)
            --     return false
            -- end
            --
            -- local function code_action_fixes_all(code_action_obj)
            --     if code_action_obj.kind == "source.fixAll" then
            --         -- vim.print("TRUE CA OBJ:", code_action_obj)
            --         return true
            --     end
            --
            --     -- vim.print("FALSE CA OBJ:", code_action_obj)
            --     return false
            -- end
            --
            -- local function format_filter(format_obj)
            --     vim.print("FMT OBJ NAME:", format_obj.name)
            --     -- if format_obj.name == 'ruff_lsp' then
            --     --     vim.print("FMT OBJ:", format_obj)
            --     -- end
            --     return true
            -- end

            lsp_zero.on_attach(function(client, bufnr)
                -- local opts = { buffer = bufnr, remap = false }

                -- if client.name == "eslint" then
                --     vim.cmd.LspStop("eslint")
                --     return
                -- end

                lsp_zero.default_keymaps({ buffer = bufnr })

                -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "c-]", function()
                    vim.lsp.buf.definition()
                end, opts)

                vim.keymap.set("n", "c-i", function()
                    vim.lsp.buf.implementation()
                end, opts)

                -- vim.keymap.set("n", "K", function()
                --     vim.lsp.buf.hover()
                -- end, opts)

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

                -- vim.keymap.set({"n", "x"}, "<leader>f", function()
                --     vim.lsp.buf.format({async = false})
                -- end, opts)

                -- if client.supports_method("textDocument/formatting") then
                --     vim.keymap.set("n", "<leader>f", function()
                --         vim.lsp.buf.format()
                --         -- vim.lsp.buf.code_action({ filter = code_action_organizes_imports, apply = true })
                --         -- vim.lsp.buf.code_action({filter = code_action_fixes_all, apply=true})
                --
                --         -- vim.lsp.buf.format({filter = format_filter})
                --         -- vim.lsp.buf.format({ async=true })
                --     end, opts)
                -- end

                -- LSP key map for formatting a buffer
            end)

            lsp_zero.format_on_save({
                format_opts = {
                    async = false,
                },
                servers = {
                    ["pylsp"] = {"python"},
                }
            })

            -- Mason integration
            require('mason').setup({})
            require('mason-lspconfig').setup({
                -- Replace the language servers listed here
                -- with the ones you want to install
                ensure_installed = { 'jedi_language_server', 'bashls', 'lua_ls', 'tsserver' },

                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_ls_config = lsp_zero.nvim_lua_ls()
                        lua_ls_config.settings.Lua.workspace.ignoreDir = { ".git", ".upkg" }
                        require('lspconfig').lua_ls.setup(lua_ls_config)
                    end,
                },
            })


            -- Cofigure nvim-cmp and lspconfig directly, but breakout the configs
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
                    vim.diagnostic.open_float(0, { focusable = false, scope = "line", source = true })
                end,
                group = MyLSPGroup,
            })
        end
    },
}
