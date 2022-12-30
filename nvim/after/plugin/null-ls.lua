local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.code_actions.shellcheck,
		null_ls.builtins.completion.spell,
		null_ls.builtins.diagnostics.codespell,
		null_ls.builtins.diagnostics.cppcheck,
		null_ls.builtins.diagnostics.cpplint,
		null_ls.builtins.diagnostics.curlylint,
		null_ls.builtins.diagnostics.djlint,
		null_ls.builtins.diagnostics.dotenv_linter,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.diagnostics.jshint,
		null_ls.builtins.diagnostics.jsonlint,
		null_ls.builtins.diagnostics.luacheck,
		null_ls.builtins.diagnostics.markdownlint,
		-- null_ls.builtins.diagnostics.markdownlint_cli2
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.diagnostics.pydocstyle,
		null_ls.builtins.diagnostics.pylint,
		null_ls.builtins.diagnostics.ruff,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.diagnostics.sqlfluff.with({
			extra_args = { "--dialect", "postgres" }, -- change to your dialect
		}),
		null_ls.builtins.diagnostics.standardjs,
		null_ls.builtins.diagnostics.vint,
		null_ls.builtins.diagnostics.yamllint,
		null_ls.builtins.diagnostics.zsh,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.codespell,
		null_ls.builtins.formatting.deno_fmt, -- will use the source for all supported file types
		null_ls.builtins.formatting.deno_fmt.with({
			filetypes = { "markdown" }, -- only runs `deno fmt` for markdown
		}),
		null_ls.builtins.formatting.djhtml,
		null_ls.builtins.formatting.djlint,
		null_ls.builtins.formatting.eslint,
		null_ls.builtins.formatting.fixjson,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.jq,
		-- null_ls.builtins.formatting.lua_format,
		null_ls.builtins.formatting.markdown_toc,
		null_ls.builtins.formatting.nginx_beautifier,
		null_ls.builtins.formatting.pg_format,
		null_ls.builtins.formatting.prettier_standard,
		null_ls.builtins.formatting.ruff,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.sqlfluff.with({
			extra_args = { "--dialect", "postgres" }, -- change to your dialect
		}),
		null_ls.builtins.formatting.standardjs,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.tidy,
		null_ls.builtins.formatting.xmlformat,
		null_ls.builtins.formatting.xmllint,
		null_ls.builtins.formatting.yamlfmt,
		null_ls.builtins.hover.dictionary,
	},
})
