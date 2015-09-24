
" For all text files set 'textwidth' to 98 characters.
autocmd FileType text,txt setlocal textwidth=98

" More normal Vim tweaks.
" vertical: make a diff split vertical by default
" iwhite: ignore whitespace
" context: show 15 lines of context
set diffopt=filler,vertical,context:15
let g:html_diff_one_file = 1

" Setup solarized colorscheme
let g:solarized_termcolors = 16
colorscheme solarized

" We like italics in the terminal, so add some sauce to make sure we get it.
set t_ZH=[3m
set t_ZR=[23m
highlight Comment cterm=italic

" Setup color style, light or dark and cursorlines
if $TERM =~ '256' || $COLORTERM =~ 'gnome-terminal' || $TERM =~ 'screen'  || $TERM =~ 'xterm'
	" Use a console friendly theme and force Vim to
	" use 256 colors if we think the console can handle it.
	" set t_Co=256
	hi clear CursorLine 

    set background=dark
    let g:lucius_style = "dark"

    if $TERM_META =~ 'white'
        set background=light
        let g:solarized_style = 'light'
        set nocursorline
    else
        let g:solarized_style = 'dark'
    endif

    " Weird fix for Terminology. Need to swap the 
    " light/dark versions
    if $TERMINOLOGY = '1'
        if $TERM_META =~ 'white'
            let g:solarized_style = 'dark'
        else
            let g:solarized_style = 'light'
        endif

        set background=light
    endif

	set cursorline
	set cursorcolumn
endif

" set linenumbers on by default
set number 
set relativenumber 

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
    let qf_height = min([qf_height, len(getqflist())])
    

    " echo "window H: " . wh . ", qf_height " . qf_height
    exe "normal ". qnr . "\<C-W>w" 
    exe qf_height . "wincmd _"


    " Move the quickfix window to the bottom right
    " so it's always full length.
    exe "normal \<C-W>\<S-J>" 
endfunction

syntax on
