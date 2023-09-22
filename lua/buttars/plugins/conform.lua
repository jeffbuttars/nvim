return {
    {
    'stevearc/conform.nvim',
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = { "ruff_fix", "black" },

                -- For some reason this version creates an empty file
                -- python = { "ruff_fix", "fuff_format", "black" },
                -- Use a sub-list to run only the first available formatter
                javascript = { { "prettierd", "prettier" } },
            },
        })

        -- Conform also provides a formatexpr, same as the LSP client:
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

        vim.keymap.set({"n", "x"}, "<leader>f", function()
            -- require("conform").format({ bufnr = args.buf, lsp_fallback = true })
            require("conform").format({ lsp_fallback = true, async = false })
        end, opts)
    end
},
}
