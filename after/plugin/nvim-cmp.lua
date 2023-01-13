-- Nvim CMP setup

local butt_cmp = require("buttars.cmp")

-- Also setup the UltiSnips cmp integration
require("cmp_nvim_ultisnips").setup({})

-- https://github.com/hrsh7th/cmp-cmdline
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
butt_cmp.cmp.setup.cmdline("/", butt_cmp.cmd_mappings["/"])

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
butt_cmp.cmp.setup.cmdline(":", butt_cmp.cmd_mappings[":"])

-- UltiSnips setup for cmp
butt_cmp.cmp.setup({
    experimental = butt_cmp.experimental,
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
})
