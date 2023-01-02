-- LSP Zero setup
local cmp = require("cmp")
local lsp = require("lsp-zero")
-- local lspkind = require("lspkind")
local butt_cmp = require("buttars.cmp")
local butt_utils = require("buttars.utils")
-- local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }

-- local cmp_formatting_kind_func = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })
-- local cmp_formatting_source_name_map = {
-- 	buffer = "Buf",
-- 	cmdline = "Cmd",
-- 	emoji = "Emoji",
-- 	latex_symbols = "Latex",
-- 	luasnip = "Snip",
-- 	nvim_lsp = "LSP",
-- 	nvim_lua = "Lua",
-- 	path = "Path",
-- 	spell = "Spell",
-- 	tabnine = "T9",
-- 	tags = "Tags",
-- 	treesitter = "TS",
-- 	ultisnips = "Snip",
-- 	zsh = "Zsh",
-- }
--
-- local cmp_formatting_item_text = {
-- 	Text = "Text",
-- 	Method = "Meth",
-- 	Function = "Func",
-- 	Constructor = " Constructor",
-- 	Field = "Field",
-- 	Variable = "Var ",
-- 	Class = "Cls ",
-- 	Interface = "Interface",
-- 	Module = "Mod ",
-- 	Property = "Prop",
-- 	Unit = "Unit",
-- 	Value = "Val ",
-- 	Enum = "Enum",
-- 	Keyword = "KeyW",
-- 	Snippet = "Snip",
-- 	Color = "Colr",
-- 	File = "File",
-- 	Reference = "Ref ",
-- 	Folder = "Dir ",
-- 	EnumMember = "EnumMbr",
-- 	Constant = "Const",
-- 	Struct = "Struct",
-- 	Event = "Event",
-- 	Operator = "Oper",
-- 	TypeParameter = "TypeParam",
-- }

-- Diagnositcs display setup
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
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

-- local cmp_mappings = lsp.defaults.cmp_mappings({
-- 	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
-- 	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
-- 	["<C-y>"] = cmp.mapping.confirm({ select = true }),
-- 	["<C-Space>"] = cmp.mapping.complete(),
--
-- 	--  Following is for  C-j/k completion/jumping with ultisnips
-- 	["<C-j>"] = cmp.mapping(function(fallback)
-- 		cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
-- 	end, {
-- 		"i",
-- 		"s", --[[ "c" (to enable the mapping in command mode) ]]
-- 	}),
-- 	["<C-k>"] = cmp.mapping(function(fallback)
-- 		cmp_ultisnips_mappings.jump_backwards(fallback)
-- 	end, {
-- 		"i",
-- 		"s", --[[ "c" (to enable the mapping in command mode) ]]
-- 	}),
-- 	["<Tab>"] = cmp.mapping(function(fallback)
-- 		if cmp.visible() then
-- 			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
-- 		else
-- 			fallback()
-- 		end
-- 	end, { "i", "s", "c" }),
-- })

lsp.setup_nvim_cmp({
	mapping = lsp.defaults.cmp_mappings(butt_cmp.mappings),
    sources = butt_cmp.sources,
    formatting = butt_cmp.formatting,
	-- sources = {
	-- 	{ name = "ultisnips", keyword_length = 2 },
	-- 	{ name = "nvim_lsp", keyword_length = 2 },
	-- 	{ name = "nvim_lsp_signature_help" },
	-- 	{ name = "nvim_lua" },
	-- 	{ name = "buffer", keyword_length = 3 },
	-- 	{ name = "path", keyword_length = 3 },
	-- },

	-- -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
	-- formatting = {
	-- 	expandable_indicator = true,
	-- 	fields = { "kind", "abbr", "menu" },
	-- 	format = function(entry, vim_item)
	-- 		-- print("entry source: ", vim.inspect(entry))
	-- 		local kind_fmt = cmp_formatting_kind_func(entry, vim_item)
	-- 		local strings = vim.split(kind_fmt.kind, "%s", { trimempty = true })
	-- 		local source_name = cmp_formatting_source_name_map[entry.source.name] or entry.source.name
	--
	-- 		-- Left side of word (icon)
	-- 		kind_fmt.kind = strings[1]
	--
	-- 		-- Right side of word
	-- 		kind_fmt.menu = " " .. cmp_formatting_item_text[strings[2]]
	-- 			or strings[2] .. " " .. butt_utils.icons["fa-long_arrow_left"] .. source_name
	-- 		-- print("KIND: ", vim.inspect(kind))
	-- 		return kind_fmt
	-- 	end,
	-- },
})

local MyLSPGroup = vim.api.nvim_create_augroup("MyCustomAutocmds", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	pattern = "*",
	callback = function()
		vim.diagnostic.open_float(0, { focusable = false, scope = "line" })
	end,
	group = MyLSPGroup,
})

-- -- https://github.com/hrsh7th/cmp-cmdline
-- -- START --
-- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline("/", {
-- 	sources = {
-- 		{ name = "buffer" },
-- 	},
-- })
--
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(":", {
-- 	sources = cmp.config.sources({
-- 		{ name = "path" },
-- 	}, {
-- 		{ name = "cmdline" },
-- 	}),
-- })

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

	-- vim.keymap.set("n", "<leader>vws", function()
	-- 	vim.lsp.buf.workspace_symbol()
	-- end, opts)

	-- vim.keymap.set("n", "<leader>vd", function()
	-- 	vim.lsp.buf.open_float()
	-- end, opts)

	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)

	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)

	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)

	-- vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    --
	vim.keymap.set("n", "<C-k>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

lsp.nvim_workspace()
lsp.setup()

-- cmp.setup({
-- 	snippet = {
-- 		expand = function(args)
-- 			vim.fn["UltiSnips#Anon"](args.body)
-- 		end,
-- 	},
-- })

-- LSP key maps for formatting a buffer
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end)
