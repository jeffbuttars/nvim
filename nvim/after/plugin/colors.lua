
-- Rose Pine setup
require('rose-pine').setup({
    disable_background = true
})

function ColorMyStuff(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "None"  })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None"  })
end

ColorMyStuff()

-- Solarized setup
