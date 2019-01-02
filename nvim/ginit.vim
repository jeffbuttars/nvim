" Neovim QT
" GuiFont Meslo LG M DZ for Powerline:h10
"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=light " or dark
colorscheme solarized_nvimqt

" GuiFontFeatures PURS, cv17
" call rpcnotify(1, 'Gui', 'Font', 'DejaVu Sans Mono 12')

"GuiFont Hack Regular:h16
"GuiFont Meslo LG M DZ for Powerline:h10

call rpcnotify(1, 'Gui', 'Font', 'Hack Regular 16')

" Popup command line
 call rpcnotify(1, 'Gui', 'Option', 'Cmdline', 1)
