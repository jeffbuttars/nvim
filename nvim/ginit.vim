" Neovim QT
" GuiFont Meslo LG M DZ for Powerline:h10
"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=light " or dark
colorscheme solarized_nvimqt

" Needed for nvim-gtk commands
source /usr/share/nvim-gtk/runtime/nvim_gui_shim.vim

" GuiFontFeatures PURS, cv17
" call rpcnotify(1, 'Gui', 'Font', 'DejaVu Sans Mono 12')

"GuiFont Hack Regular:h16
"GuiFont Meslo LG M DZ for Powerline:h10
"
GuiFont FuraCode Nerd Font Mono:h15

" call rpcnotify(1, 'Gui', 'Font', 'Hack Regular 16')
call rpcnotify(1, 'Gui', 'Font', 'FuraCode Nerd Font Mono 15')
" call rpcnotify(1, 'Gui', 'FontFeatures', 'PURS, cv17')

" Popup command line
 "call rpcnotify(1, 'Gui', 'Option', 'Cmdline', 1)

" enable native gtk clipboard support
let g:GuiInternalClipboard = 1
