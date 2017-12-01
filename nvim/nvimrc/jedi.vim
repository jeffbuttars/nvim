" Jedi-vim sets 'completeopt' to `menuone,longest,preview` by default, if
" 'completeopt' is not changed from Vim's default.
" It also remaps <Ctrl-C> to <Esc> in insert mode.

" If you want to keep your own configuration, disable this setting.

" Options: 0 or 1
" Default: 1 (Set 'completeopt' and mapping as described above)
let g:jedi#auto_vim_configuration = 0

" Jedi-vim automatically starts completion upon typing a period in insert mode.

" However, when working with large modules, this can slow down your typing flow
" since you have to wait for jedi to parse the module and show the completion
" menu. By disabling this setting, completion is only started when you manually
" press the completion key.
" You need to also have `g:jedi#completions_enabled` enabled for this.

" Options: 0 or 1
" Default: 1 (Start completion on typing a period)
let g:jedi#popup_on_dot = 1

" Upon starting completion, jedi-vim can automatically select the first entry
" that pops up (without actually inserting it).

" This leads to a better typing flow: As you type more characters, the entries
" in the completion menu are narrowed down. If they are narrowed down enough,
" you can just press <Return> to insert the first match.

" Options: 0 or 1
" Default: 1 (Automatically select first completion entry)
let g:jedi#popup_select_first = 1

" Jedi-vim can display a small window detailing the arguments of the currently
" completed function and highlighting the currently selected argument. This can
" be disabled by setting this option to 0. Setting this option to 2 shows call
" signatures in the command line instead of a popup window.

" Options: 0, 1, or 2
" Default: 1 (Show call signatures window)

" Note: 'showmode' must be disabled for command line call signatures to be
" visible.

" Note: This setting is ignored if |g:jedi#auto_initialization| is set to 0. In
" that case, if you want to see call signatures, you have to set it up
" manually by calling a function in your configuration file: >

"     call jedi#configure_call_signatures()
let g:jedi#show_call_signatures = 1

