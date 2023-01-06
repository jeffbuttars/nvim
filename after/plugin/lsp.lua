-- LSP Zero setup
local lsp = require("lsp-zero")
local butt_cmp = require("buttars.cmp")
local butt_utils = require("buttars.utils")

-- Diagnositcs display setup
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"sumneko_lua",
	"rust_analyzer",
})

-- Fix Undefined global 'vim'
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- setup our preferred cmp setup
lsp.setup_nvim_cmp({
	mapping = lsp.defaults.cmp_mappings(butt_cmp.mappings),
	sources = butt_cmp.sources,
	formatting = butt_cmp.formatting,
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

lsp.set_preferences({
	suggest_lsp_servers = true,
	sign_icons = {
		error = butt_utils.signs.error,
		warn = butt_utils.signs.warn,
		hint = butt_utils.signs.hint,
		info = butt_utils.signs.information,
		other = butt_utils.signs.other,
	},

	configure_diagnostics = {
		underline = true,
		virtual_text = false,
		signs = true,
		float = {
			show_header = true,
			source = "always",
			border = "rounded",
			focusable = false,
			severity_sort = true, -- defaulted to false
		},
		update_in_insert = false, -- defaulted to false
		severity_sort = true, -- defaulted to false
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	if client.name == "eslint" then
		vim.cmd.LspStop("eslint")
		return
	end

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
end)

lsp.nvim_workspace()
lsp.setup()

-- LSP key map for formatting a buffer
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end)
