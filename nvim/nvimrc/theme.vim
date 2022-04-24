
" general theming config, background, term, default theme and such.
" For colorscheme specific config, use the plugin config for the scheme


" try
"     " Use a console friendly theme and force Vim to
"     " use 256 colors if we think the console can handle it.
"     " set t_Co=256
"     if (has("termguicolors"))
"         set termguicolors
"     endif

"     hi clear CursorLine

"     " If it's a real tty, use elflord
"     if $IS_REAL_TTY == 'true'
"         colorscheme elflord
"     else
"         " Use TERM_META to select the light or dark theme
"         if $TERM_META =~ 'dark'
"             set background=dark
"         else
"             set background=light
"         endif
"     endif

"     set cursorline
"     set cursorcolumn
" catch /^Vim\%((\a\+)\)\=:E185/
"     set notermguicolors
"     set guicursor=
"     colorscheme elflord
" endtry
