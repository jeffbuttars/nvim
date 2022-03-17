" ssort.vim
" Author: Jeff Buttars
" Created: Mon Mar 26 23:27:53 2018 -0700
" Requires: Vim Ver7.0+
" Version:  1.2
"
" Documentation:
"   This plugin formats Python files.
"
" History:
"  1.0:
"    - initial version
"  1.1:
"    - restore cursor/window position after formatting
"  1.2:
"    - use autoload script

if v:version < 700 || !has('python3')
    func! __SSORT_MISSING()
        echo "The ssort.vim plugin requires vim7.0+ with Python 3.6 support."
    endfunc
    command! SSort :call __SSORT_MISSING()
    command! SSortUpgrade :call __SSORT_MISSING()
    finish
endif

if exists("g:load_ssort")
  finish
endif

let g:load_ssort = "py1.0"
if !exists("g:ssort_virtualenv")
  if has("nvim")
    let g:ssort_virtualenv = "~/.local/share/nvim/ssort"
  else
    let g:ssort_virtualenv = "~/.vim/ssort"
  endif
endif

command! SSort :call ssort#SSort(<f-args>)
command! SSortUpgrade :call ssort#SSortUpgrade()
