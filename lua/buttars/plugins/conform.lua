return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "codespell", "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "ruff_fix", "black" },
					htmldjango = { "djlint" },
					html = { "htmlbeautifier" },

					-- For some reason this version creates an empty file
					-- python = { "ruff_fix", "fuff_format", "black" },
					-- Use a sub-list to run only the first available formatter
					javascript = { { "standardjs", "prettierd", "prettier" } },
                    css = { "stylelint" },
					bash = { { "shfmt", "beautysh" } },
					sh = { { "shfmt", "beautysh" } },
					json = { "jq" },
					yaml = { "yamlfix" },
					c = { "clang_format" },
					-- Use the "*" filetype to run formatters on all filetypes.
					["*"] = { "codespell" },
					-- Use the "_" filetype to run formatters on filetypes that don't
					-- have other formatters configured.
					["_"] = { "trim_whitespace" },
					-- zig = { "zigfmg" },
				},
			})

			-- Conform also provides a formatexpr, same as the LSP client:
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

			vim.keymap.set({ "n", "x" }, "<leader>f", function()
				-- require("conform").format({ bufnr = args.buf, lsp_fallback = true })
				require("conform").format({ lsp_fallback = true, async = false })
			end, { noremap = true })
		end,
	},
}
