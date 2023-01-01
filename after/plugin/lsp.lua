require("cmp_nvim_ultisnips").setup({})
local cmp = require("cmp")
local lsp = require("lsp-zero")
-- local lspkind = require("lspkind")
local butt_utils = require("buttars.utils")

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

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),

	--  Following is for  C-j/k completion/jumping with ultisnips
	["<C-j>"] = cmp.mapping(function(fallback)
		cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
	end, {
		"i",
		"s", --[[ "c" (to enable the mapping in command mode) ]]
	}),
	["<C-k>"] = cmp.mapping(function(fallback)
		cmp_ultisnips_mappings.jump_backwards(fallback)
	end, {
		"i",
		"s", --[[ "c" (to enable the mapping in command mode) ]]
	}),
	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
		else
			fallback()
		end
	end, { "i", "s" }),
})

local MyLSPGroup = vim.api.nvim_create_augroup("MyCustomAutocmds", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	pattern = "*",
	callback = function()
		vim.diagnostic.open_float(0, { focusable = false, scope = "line" })
	end,
	group = MyLSPGroup,
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	sources = {
		{ name = "nvim_lsp", keyword_length = 1 },
		{ name = "ultisnips", keyword_length = 1 },
		{ name = "buffer", keyword_length = 2 },
		{ name = "path" },
		{ name = "nvim_lua" },
		{ name = "nvim_lsp_signature_help" },
	},
	-- formatting = {
	-- 	format = lspkind.cmp_format({
	-- 		-- mode = "symbol",
	-- 		maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
	-- 		ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
	--
	-- 		-- The function below will be called before any actual modifications from lspkind
	-- 		-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
	-- 		before = function (entry, vim_item)
	-- 		    return vim_item
	-- 		end
	-- 	}),
	-- },
	-- formatting = {
 --        expandable_indicator = true,
	-- 	fields = { "kind", "abbr", "menu" },
	-- 	format = function(entry, vim_item)
	-- 		local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
	-- 		local strings = vim.split(kind.kind, "%s", { trimempty = true })
	-- 		kind.kind = " " .. strings[1] .. " "
	-- 		kind.menu = "    " .. strings[2] .. ""
	--
	-- 		return kind
	-- 	end,
	-- },
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
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.lsp.buf.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.lsp.buf.got_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.lsp.buf.got_prev()
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
	-- vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
	vim.keymap.set("n", "<C-k>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

lsp.nvim_workspace()
lsp.setup()

-- -- https://github.com/hrsh7th/cmp-cmdline
-- -- START --
-- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
--   sources = {
--     { name = 'buffer' }
--   }
-- })
--
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--     sources = cmp.config.sources(
--         {
--             { name = 'path' }
--         },
--         {
--             { name = 'cmdline' }
--         }
--     )
-- })

-- Need to force in the UltiSnips config for cmp after the lsp-zero setup.
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
})

-- LSP key maps for
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end)
