
" For all text files set 'textwidth' to 98 characters.
autocmd FileType text,txt setlocal textwidth=98

" More normal Vim tweaks.
" vertical: make a diff split vertical by default
" iwhite: ignore whitespace
" context: show 15 lines of context
set diffopt=filler,vertical,context:15
let g:html_diff_one_file = 1


" " We like italics in the terminal, so add some sauce to make sure we get it.
" set t_ZH=[3m
" set t_ZR=[23m
" highlight Comment cterm=italic

" NeoSolarized config
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

" let g:neosolarized_italic = 1
" END NeoSolarized config

" Setup color style, light or dark and cursorlines
if $TERM =~ '256' || $COLORTERM =~ 'gnome-terminal' || $TERM =~ 'screen'  || $TERM =~ 'xterm'
    try
        " Use a console friendly theme and force Vim to
        " use 256 colors if we think the console can handle it.
        " set t_Co=256
        if (has("termguicolors"))
            set termguicolors
        endif

        hi clear CursorLine

        if $TERM_META =~ 'dark'
            set background=dark
        endif

        " If it's a real tty, use elflord
        if $IS_REAL_TTY == 'true'
            colorscheme elflord
        else
            colorscheme NeoSolarized
        endif

        set cursorline
        set cursorcolumn
    catch /^Vim\%((\a\+)\)\=:E185/
        set notermguicolors
        set guicursor=
        colorscheme elflord
    endtry
else
    colorscheme elflord
endif

" set linenumbers on by default
" When in insert mode, show linear numbers
" When not in insert mode, show current line number with relative numbers
" And last of all, only be relative in the buffer we're editing.
set number

au InsertLeave * set number
au InsertLeave * set relativenumber

au InsertLeave * set number
au InsertEnter * set norelativenumber

au BufLeave,FocusLost,WinLeave * set norelativenumber
" au BufLeave,FocusLost,WinLeave * set number
au BufEnter,FocusGained,WinEnter * set relativenumber

" A cleaner vertical split
set fillchars=vert:\:

" Only use cursorline/cursorcolun in normal mode
autocmd InsertLeave * :set cursorline
autocmd InsertLeave * :set cursorcolumn

autocmd InsertEnter * :set nocursorline
autocmd InsertEnter * :set nocursorcolumn

" Automatically adjust the quickfix size
" Set to a ratio/percentag of the window
" the cursor is in when this is called.
" Also honor a minimum height so the QFW
" won't get to small. And if the calculated
" size is larger then there are lines to put 
" in it, only size QF to the number of items 
" available.
au FileType qf call AdjustQFWindowHeight()
function! AdjustQFWindowHeight()
    " get the current window, qf, number and height
    let thiswindow = winnr()
    let thiswindow_h = winheight(0)
    let qnr = winnr('$')
    " let qf_min_height = 5
    let list_len = len(getqflist())

    " Apply to both quickfix and location list windows. So if we
    " don't see much in the quickfix, look for a loclist.
    if list_len == 0
        let list_len = len(getloclist(qnr))
    endif

    " go the last open window and get it's size
    " and add it to the qf window size and account for the
    " extra line seperating the two
    exe "wincmd w"
    let wh = winheight(0) + thiswindow_h + 1
    exe "wincmd w"

    " Open the quick to approx 1/3 the size of it's
    " closest relative.
    let qf_height = max([3, wh/3])

    " If the QF list isn't big enough to fill the
    " new window size, shrink the window to the list.
    let qf_height = min([qf_height, list_len])
    " echoerr "window H: " . wh . ", qf_height " . qf_height . " qfl:" . list_len

    " let qf_height = max([qf_height, qf_min_height])
    " echoerr "window H: " . wh . ", qf_height " . qf_height

    exe "normal ". qnr . "\<C-W>w" 
    exe qf_height . "wincmd _"

    " Move the quickfix window to the bottom right
    " so it's always full length.
    exe "normal \<C-W>\<S-J>" 
endfunction

syntax on
