return {
    {
    'stevearc/conform.nvim',
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = { "ruff_fix", "ruff_format", "black" },
                -- Use a sub-list to run only the first available formatter
                javascript = { { "prettierd", "prettier" } },
            },
        })

        -- Conform also provides a formatexpr, same as the LSP client:
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end
},
}
