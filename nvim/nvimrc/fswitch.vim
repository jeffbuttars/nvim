
"
" The mappings used to do the good work
"
" com! FSHere       :call FSwitch('%', '')
" com! FSRight      :call FSwitch('%', 'wincmd l')
" com! FSSplitRight :call FSwitch('%', 'let curspr=&spr | set nospr | vsplit | wincmd l | if curspr | set spr | endif')
" com! FSLeft       :call FSwitch('%', 'wincmd h')
" com! FSSplitLeft  :call FSwitch('%', 'let curspr=&spr | set nospr | vsplit | if curspr | set spr | endif')
" com! FSAbove      :call FSwitch('%', 'wincmd k')
" com! FSSplitAbove :call FSwitch('%', 'let cursb=&sb | set nosb | split | if cursb | set sb | endif')
" com! FSBelow      :call FSwitch('%', 'wincmd j')
" com! FSSplitBelow :call FSwitch('%', 'let cursb=&sb | set nosb | split | wincmd j | if cursb | set sb | endif')

 nmap <c-s> <ESC>:FSHere<CR>
 imap <c-s> <ESC>:FSHere<CR>
