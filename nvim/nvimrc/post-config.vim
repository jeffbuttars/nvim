" "[concisionandconcinnity.blogspot.com](http://concisionandconcinnity.blogspot.com/2009/07/vim-part-ii-matching-pairs.html)
" " The above URL also has good stuff for autoclosing matching pairs, like ().
" "One of the nicer minor features of TextMate is its treatment of highlighted text.
" "If you have something highlighted and type a, it replaces the text, like other editors.
" "If you type (, however, it wraps the selected text in parentheses.
" "This is enormously useful. Luckily, it's very easy to recreate in Vim:
" vnoremap ((  <ESC>`>a)<ESC>`<i(<ESC>
" vnoremap ))  <ESC>`<i(<ESC>`><right>a)<ESC>
" vnoremap {{  <ESC>`>a}<ESC>`<i{<ESC>
" vnoremap }}  <ESC>`<i{<ESC>`><right>a}<ESC>
" vnoremap [[  <ESC>`>a]<ESC>`<i[<ESC>
" vnoremap ]]  <ESC>`<i[<ESC>`><right>a]<ESC>
" " If allow " here, it messes up register selection
" " So we use "" instead, and it works.
" vnoremap ""  <ESC>`>a"<ESC>`<i"<ESC>
" vnoremap ''  <ESC>`>a'<ESC>`<i'<ESC>
" vnoremap ``  <ESC>`>a`<ESC>`<i`<ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" From an idea by Michael Naumann
"You press * or # to search for the current visual selection !! Really useful
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
" End From an idea by Michael Naumann
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open Quickfix selections in existing buffer
set switchbuf=uselast,useopen


" " Little something from http://www.ibm.com/developerworks/linux/library/l-vim-script-5/index.html
" " Agressive auto saving
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

" Map the <End> key to <Esc>
" This is do to my X1 gen 2 kbd layout
" nmap <End> <ESC>
" imap <End> <ESC>

highlight OverColLimit term=inverse,bold cterm=bold ctermbg=red ctermfg=black gui=bold guibg=red guifg=black
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

" Allow paste of visually selected without overwriting the copy register
" THIS NEEDS WORK!
vnoremap <s-p> "_dP

augroup MyCustomConfigs
    autocmd CursorHold,BufLeave,FocusLost,WinLeave * :call Autosave()
    " Need to make this _not_ change the quickfix size.
    "autocmd VimResized * :wincmd =
    " Open the quickfix after running grep
    autocmd QuickFixCmdPost *grep* cwindow
    " autocmd QuickFixCmdPost *grep* exe "normal \<cr>\<c-w>p"
    autocmd FileType python :call SetColorColumn(g:maxLineLength)
    autocmd FileType sh :call SetColorColumn(g:maxLineLength)
    autocmd FileType javascript :call SetColorColumn(g:maxLineLength)
    autocmd FileType java :call SetColorColumn(g:maxLineLength)
    autocmd FileType c :call SetColorColumn(g:maxLineLength)
augroup END

" " Example config from lsp docs
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

" Show lsp virtual text on cursor hold
augroup lsp
    autocmd!
    autocmd CursorHold * lua vim.diagnostic.open_float(0, {focusable = false, scope = "line"})
    " autocmd CursorHold * lua vim.lsp.buf.document_highlight()
augroup END

"
"
" " https://bluz71.github.io/2017/06/28/current-treats-future-wants-of-neovim.html
" " Make escape work in the Neovim terminal.
" " tnoremap <Esc> <C-\><C-n>
"
" " Make navigation into and out of Neovim terminal splits nicer.
" " tnoremap <C-h> <C-\><C-N><C-w>h
" " tnoremap <C-j> <C-\><C-N><C-w>j
" " tnoremap <C-k> <C-\><C-N><C-w>k
" " tnoremap <C-l> <C-\><C-N><C-w>l

" https://github.com/nickjj/dotfiles/blob/769402bc839e11f7b0a8a37664391a899b03021b/.vimrc#L328-L332
" Move 1 more lines up or down in normal and visual selection modes.
" nnoremap K :m .-2<CR>==
" nnoremap J :m .+1<CR>==
" vnoremap K :m '<-2<CR>gv=gv
" vnoremap J :m '>+1<CR>gv=gv

" For all text files set 'textwidth' to 98 characters.
autocmd FileType text,txt setlocal textwidth=98

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
set fillchars=vert:\│

" Only use cursorline/cursorcolun in normal mode
autocmd InsertLeave * :set cursorline
autocmd InsertLeave * :set cursorcolumn

autocmd InsertEnter * :set nocursorline
autocmd InsertEnter * :set nocursorcolumn
