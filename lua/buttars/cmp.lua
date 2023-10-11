-- Delcaration and some setup for nvim-cmp. This is meant to be required by lsp-zero 'after'
local butt_utils = require("buttars.utils")
local cmp = require("cmp")
local lspkind = require("lspkind")
-- local lsp_zero = require('lsp-zero')

require("cmp_nvim_ultisnips").setup({})

-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_insert = { behavior = cmp.SelectBehavior.Insert }
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp_formatting_kind_func = lspkind.cmp_format({
	mode = "symbol_text",
	maxwidth = 50,
	symbol_map = { Codeium = "" },
})

local cmp_formatting_source_name_map = {
	buffer = "Buf",
	cmdline = "Cmd",
	emoji = "Emoji",
	latex_symbols = "Latex",
	luasnip = "Snip",
	nvim_lsp = "LSP",
	nvim_lua = "Lua",
	path = "Path",
	spell = "Spell",
	tabnine = "T9",
	tags = "Tags",
	treesitter = "TS",
	ultisnips = "Snip",
	zsh = "Zsh",
	codeium = "Codeium",
	["html-css"] = "HTML/CSS",
}

local cmp_formatting_item_text = {
	Text = "Text",
	Method = "Meth",
	Function = "Func",
	Constructor = " Constructor",
	Field = "Field",
	Variable = "Var ",
	Class = "Cls ",
	Interface = "Interface",
	Module = "Mod ",
	Property = "Prop",
	Unit = "Unit",
	Value = "Val ",
	Enum = "Enum",
	Keyword = "KeyW",
	Snippet = "Snip",
	Color = "Colr",
	File = "File",
	Reference = "Ref ",
	Folder = "Dir ",
	EnumMember = "EnumMbr",
	Constant = "Const",
	Struct = "Struct",
	Event = "Event",
	Operator = "Oper",
	TypeParameter = "TypeParam",
	Codeium = "Codeium",
	Spell = "Spell",
	["HTML/CSS"] = "HTML/CSS",
}

-- See TJs config
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/after/plugin/completion.lua
cmp.setup({
	-- completion = {
	-- 	completeopt = { "menu", "menuone", "noselect" },
	-- },
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item(cmp_insert),
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_insert),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-y>"] = cmp.mapping(
			cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			}),
			{ "i", "c" }
		),
		-- ["<CR>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), { "i", "c" }),
		-- ["<CR>"] = cmp.mapping(
		-- 	cmp.mapping.confirm({
		-- 		behavior = cmp.ConfirmBehavior.Replace,
		-- 		select = false,
		-- 	}),
		-- 	{ "i", "c" }
		-- ),
		-- ["<CR>"] = cmp.mapping({
		-- 	i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
		-- 	c = function(fallback)
		-- 		if cmp.visible() then
		-- 			cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
		-- 		else
		-- 			fallback()
		-- 		end
		-- 	end,
		-- }),
		["<CR>"] = cmp.mapping({
			i = function(fallback)
				if cmp.visible() and cmp.get_active_entry() then
					cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
				else
					fallback()
				end
			end,
			s = cmp.mapping.confirm({ select = true }),
			-- c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		}),
		--
		-- ["<C-Space>"] = cmp.mapping.complete(),
		["<c-space>"] = cmp.mapping({
			i = cmp.mapping.complete(),
			c = function(
				_ --[[fallback]]
			)
				if cmp.visible() then
					if not cmp.confirm({ select = true }) then
						return
					end
				else
					cmp.complete()
				end
			end,
		}),

		["<C-e>"] = cmp.mapping.abort(),
		["<C-c>"] = cmp.mapping.abort(),

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
		-- ["<Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
		-- 		-- cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s", "c" }),
		--
		-- ["<S-Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s", "c" }),

		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
	}),

	-- sorting = {
	-- 	-- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
	-- 	comparators = {
	-- 		cmp.config.compare.offset,
	-- 		cmp.config.compare.exact,
	-- 		cmp.config.compare.score,
	--
	-- 		-- copied from cmp-under, but I don't think I need the plugin for this.
	-- 		-- I might add some more of my own.
	-- 		function(entry1, entry2)
	-- 			local _, entry1_under = entry1.completion_item.label:find("^_+")
	-- 			local _, entry2_under = entry2.completion_item.label:find("^_+")
	-- 			entry1_under = entry1_under or 0
	-- 			entry2_under = entry2_under or 0
	-- 			if entry1_under > entry2_under then
	-- 				return false
	-- 			elseif entry1_under < entry2_under then
	-- 				return true
	-- 			end
	-- 		end,
	--
	-- 		cmp.config.compare.kind,
	-- 		cmp.config.compare.sort_text,
	-- 		cmp.config.compare.length,
	-- 		cmp.config.compare.order,
	-- 	},
	-- },

	sources = {
		{ name = "codeium", keyword_length = 0, max_item_count = 5 },
		{ name = "ultisnips", keyword_length = 1, max_item_count = 5 },
		{ name = "nvim_lsp", keyword_length = 1, max_item_count = 10 },
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lua", keyword_length = 1, max_item_count = 5 },
		{ name = "buffer", keyword_length = 2, max_item_count = 5 },
		{ name = "path", keyword_length = 2, max_item_count = 5 },
		-- { name = "spell", keyword_length = 3, max_item_count = 5 },
		{
			name = "spell",
			keyword_length = 3,
			max_item_count = 5,
			option = {
				keep_all_entries = false,
				-- enable_in_context = function()
				-- 	return true
				-- end,
				enable_in_context = function()
					return require("cmp.config.context").in_treesitter_capture("spell")
				end,
			},
		},
		{
			name = "html-css",
			keyword_length = 2,
			max_item_count = 5,
			option = {
				file_extensions = { "css", "sass", "less" },
				enable_on = { "html", "htmldjango" },
				style_sheets = {
					-- example of remote styles, only css no js for now
					"https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
				},
			},
		},
	},
	formatting = {
		expandable_indicator = true,
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- print("entry source: ", vim.inspect(entry))
			local kind_fmt = cmp_formatting_kind_func(entry, vim_item)
			local strings = vim.split(kind_fmt.kind, "%s", { trimempty = true })
			local source_name = cmp_formatting_source_name_map[entry.source.name] or entry.source.name

			-- Left side of word (icon)
			kind_fmt.kind = strings[1]

			-- Right side of word
			kind_fmt.menu = " " .. cmp_formatting_item_text[strings[2]]
				or strings[2] .. " " .. butt_utils.icons["fa-long_arrow_left"] .. source_name
			-- print("KIND: ", vim.inspect(kind))
			return kind_fmt
		end,
	},
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
})

-- https://github.com/hrsh7th/cmp-cmdline
-- Command completion setup
cmp.setup.cmdline(":", {
	-- completion = { autocomplete = false },
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

cmp.setup.cmdline("/", {
	-- completion = { autocomplete = false },
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})
