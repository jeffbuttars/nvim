
" #### NeoSolarized config
" default value is "normal", Setting this option to "high" or "low" does use the
" same Solarized palette but simply shifts some values up or down in order to
" expand or compress the tonal range displayed.
let g:neosolarized_contrast = "normal"

" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
let g:neosolarized_visibility = "normal"

" I make vertSplitBar a transparent background color. If you like the origin solarized vertSplitBar
" style more, set this value to 0.
let g:neosolarized_vertSplitBgTrans = 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined or italicized
" typefaces, simply assign 1 or 0 to the appropriate variable. Default values:
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1
" END NeoSolarized config

try
    " Use a console friendly theme and force Vim to
    " use 256 colors if we think the console can handle it.
    " set t_Co=256
    if (has("termguicolors"))
        set termguicolors
    endif

    hi clear CursorLine

    " If it's a real tty, use elflord
    if $IS_REAL_TTY == 'true'
        colorscheme elflord
    else
        " Use TERM_META to select the light or dark theme
        if $TERM_META =~ 'dark'
            set background=dark
            " let g:gruvbox_contrast_dark = 'medium'
            let g:airline_theme='solarized_flood'
        else
            set background=light
            let g:airline_theme='solarized'
            " let g:gruvbox_contrast_dark = 'soft'
        endif

        colorscheme solarized
        " colorscheme NeoSolarized
        " colorscheme solarized8
        " colorscheme gruvbox
    endif

    set cursorline
    set cursorcolumn
catch /^Vim\%((\a\+)\)\=:E185/
    set notermguicolors
    set guicursor=
    colorscheme elflord
endtry

