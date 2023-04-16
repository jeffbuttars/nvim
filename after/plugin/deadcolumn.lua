-- https://github.com/Bekaboo/deadcolumn.nvim
local opts = {
    scope = 'visible',  -- line, buffer, visible, cursor
    modes = { 'i', 'ic', 'ix', 'R', 'Rc', 'Rx', 'Rv', 'Rvc', 'Rvx', 'n' },
    blending = {
        threshold = 0.75,
        colorcode = '#000000',
        hlgroup = {
            'Normal',
            'background',
        },
    },
    warning = {
        alpha = 0.4,
        colorcode = '#FF0000',
        hlgroup = {
            'Error',
            'background',
        },
    },
}

require('deadcolumn').setup(opts) -- Call the setup function
