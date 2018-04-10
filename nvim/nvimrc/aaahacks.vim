" ## Hacks
" Little something from http://www.ibm.com/developerworks/linux/library/l-vim-script-5/index.html 
" Agressive auto saving
function! Autosave()

	" close the preview window if it's visible
	" and the pop up menu is not visible, but not if
    " we're in a preview window.
	if pumvisible() == 0 && &buftype == ''
		pclose
	endif

	if ! &modified || ! &modifiable || &readonly
		return
	endif

	if expand('%') != ""
		write
	endif
endfunction

" A more verbose pastetoggle
function! TogglePaste()
	if	&paste == 0
		set paste
		echo "Paste is ON!"
	else
		set nopaste
		echo "Paste is OFF!"
	endif
endfunction

" Map the <End> key to <Esc>
" This is do to my X1 gen 2 kbd layout
nmap <End> <ESC>
imap <End> <ESC>

" Allow toggling of paste/nopaste via F2
"set pastetoggle=<F2>
nmap <F2> <ESC>:call TogglePaste()<CR>
imap <F2> <ESC>:call TogglePaste()<CR>i

" No much going on here for Omni Completion. In the past there were all sorts of
" nasty hacks for this section.  
" When c-y is used to select a completion, enter normal mode after it's inserted.
" imap <c-y> <c-y><esc>
" function! CmplChooseNorm()
"     if pumvisible()
"         return "\<ESC>"
"     endif

"     return "\<C-Y>"
" endfunction
" imap <c-y> <c-r>=CmplChooseNorm()<cr>

"highlight OverColLimit term=inverse,bold cterm=bold ctermbg=red ctermfg=black gui=bold guibg=red guifg=black 
function! SetColorColumn(ccol)

	if ! exists("b:longLineMatchID")
		let b:longLineMatchID = 0
	endif
	set cursorcolumn

	if !exists('&colorcolumn')
		return
	endif

	call clearmatches()

	"echo "SetColorColumn " b:longLineMatchID "" a:ccol "\%>".a:ccol."v.\+"

	if a:ccol == 0 || &buftype != "" || expand('%') == '' || &buftype == "log"
		setlocal colorcolumn=0
		let &textwidth = (0)
        " echo "bailing out"
		return
	endif

	let l:mlist = getmatches()
	if len(l:mlist) < 1 || b:longLineMatchID == 0 || &colorcolumn != (a:ccol+1)
		" echo "SetColorColumn applying" b:longLineMatchID "" a:ccol "\%>".a:ccol."v.\+"
		let &colorcolumn = (a:ccol)
		let &textwidth = (a:ccol-1)
		let b:longLineMatchID=matchadd( "ErrorMsg", '\%>'.a:ccol.'v.\+', -1 )
	endif

endfunction
if ! exists("g:maxLineLength")
	let g:maxLineLength=100
endif

" helper function to toggle hex mode
function! ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" Open a shell command in a new window, the command supports shell completion
command! -complete=shellcmd -nargs=* R rightbelow vnew | r ! <args>

" Open a Quickfix window for the last search.
nnoremap <silent> ,/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Allow paste of visually selected without overwriting the copy register
" vnoremap <leader>p "_dP
vnoremap <s-p> "_dP

" "====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list


"====[ Swap : and ; to make colon commands easier to type ]======

" nnoremap  ;  :
" If you swap the other way, it breaks my NERDTree
" nnoremap  :  ;

" " runtime plugin/dragvisuals.vim

" Add the virtualenv's site-packages to vim path
python3 << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    py_vers = ['2.7', '3.0', '3.1', '3.2', '3.3', '3.4', '3.5', '3.6', '3.7', '3.8']
    for pv in py_vers:
        ipath = os.path.join(project_base_dir, 'lib', 'python' + pv, 'site-packages')
        if os.path.exists(ipath):
            vim.command('set path+=%s' % ipath )
            vim.command('silent! echo "Set venv path ' + ipath + '"')

    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    vim.command("let g:python3_host_prog = '" + os.path.join(project_base_dir, 'bin/python') + "'")
    execfile(activate_this, dict(__file__=activate_this))

    # Add tags if they are at the virtualenv dir
    tpath = os.path.abspath(os.path.join(project_base_dir, '..', 'tags'))
    if os.path.exists(tpath):
        vim.command('set tags+=' + tpath)
        # vim.command('echo "Set tag path ' + tpath + '"')
EOF

augroup MyAAAHacks
    autocmd CursorHold,BufLeave,FocusLost,WinLeave * :call Autosave()
    " Need to make this _not_ change the quickfix size.
    "autocmd VimResized * :wincmd =
    " Open the quickfix after running grep
    autocmd QuickFixCmdPost *grep* cwindow
    autocmd QuickFixCmdPost *grep* exe "normal \<cr>\<c-w>p"
    autocmd FileType python :call SetColorColumn(g:maxLineLength)
    autocmd FileType sh :call SetColorColumn(g:maxLineLength)
    autocmd FileType javascript :call SetColorColumn(g:maxLineLength)
    autocmd FileType java :call SetColorColumn(g:maxLineLength)
    autocmd FileType c :call SetColorColumn(g:maxLineLength)

    " Usage: prettier [opts] [filename ...]
    " 
    " Available options:
    "   --write              Edit the file in-place (beware!)
    "   --stdin              Read input from stdin
    "   --print-width <int>  Specify the length of line that the printer will wrap on. Defaults to 80.
    "   --tab-width <int>    Specify the number of spaces per indentation-level. Defaults to 2.
    "   --flow-parser        Use the flow parser instead of babylon
    "   --single-quote       Use single quotes instead of double
    "   --trailing-comma     Print trailing commas wherever possible
    "   --bracket-spacing    Put spaces between brackets. Defaults to true, set false to turn off
    " autocmd FileType javascript set formatprg=prettier\ --stdin\ --print-width=100\ --flow-parser\ --single-quote
augroup END


" https://bluz71.github.io/2017/06/28/current-treats-future-wants-of-neovim.html
" Make escape work in the Neovim terminal.
" tnoremap <Esc> <C-\><C-n>

" Make navigation into and out of Neovim terminal splits nicer.
" tnoremap <C-h> <C-\><C-N><C-w>h
" tnoremap <C-j> <C-\><C-N><C-w>j
" tnoremap <C-k> <C-\><C-N><C-w>k
" tnoremap <C-l> <C-\><C-N><C-w>l
