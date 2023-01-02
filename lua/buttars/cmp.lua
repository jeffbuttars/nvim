local butt_utils = require("buttars.utils")
local cmp = require("cmp")
local lspkind = require("lspkind")

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
local cmp_formatting_kind_func = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })

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
}

return {
	mappings = {
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
		end, { "i", "s", "c" }),
	},
	sources = {
		{ name = "ultisnips", keyword_length = 2 },
		{ name = "nvim_lsp", keyword_length = 2 },
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lua" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "path", keyword_length = 3 },
	},

	-- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
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
}
