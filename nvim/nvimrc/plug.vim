"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ## Plugs
"
" We deal with our plugs first thing because later sections
" rely on them being available.
"
" #### [Pathogen](https://github.com/tpope/vim-pathogen)
" [Pathogen](https://github.com/tpope/vim-pathogen) is a
" nice package format for Vim _'packages'_.  
" [Vim Plug](https://github.com/junegunn/vim-plug)
" is our current package manager for Pathogen bundles.
"
"
" # Vim Plug initialization

" More or less 'borrowed' straight from the repo readme.

call plug#begin('~/.config/nvim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Place your Plugs here!

Plug 'https://github.com/Shougo/vimproc.vim', { 'do': 'make' }
Plug 'https://github.com/Shougo/unite.vim'
Plug 'https://github.com/klen/python-mode.git', { 'for': 'python' }
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/bling/vim-airline.git'
Plug 'https://github.com/bling/vim-bufferline.git'
Plug 'https://github.com/junegunn/rainbow_parentheses.vim'
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/tpope/vim-eunuch.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
" Plug 'git://github.com/junegunn/vim-easy-align.git'
" Plug 'https://github.com/neomake/neomake.git'
Plug 'w0rp/ale'
" Plug 'https://github.com/vim-ruby/vim-ruby'
" Plug 'https://github.com/tpope/vim-dispatch.git'
" Plug 'https://github.com/sjl/gundo.vim'
Plug 'https://github.com/Shougo/vimfiler.vim'
Plug 'https://github.com/will133/vim-dirdiff.git'
" Plug 'vim-indent-object'
" Plug 'nginx.vim'
" Plug 'patchreview.vim'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
" Plug 'jeffbuttars/neovim-doubletap', { 'do': function('DoRemote') }
Plug 'https://github.com/Raimondi/delimitMate'
Plug 'zchee/deoplete-jedi'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install tern', 'for': ['javascript', 'javascript.jsx'] }
" ES2015 code snippets (Optional)
" Plug 'epilande/vim-es2015-snippets'
" React code snippets
" Plug 'epilande/vim-react-snippets'
" Load Ultisnips last to make sure it has the <tab> map
Plug 'https://github.com/sirver/ultisnips'
Plug 'https://github.com/honza/vim-snippets'
Plug 'chrisbra/vim-diff-enhanced'
" Plug 'https://github.com/mhinz/vim-rfc'
" Plug 'https://github.com/vim-scripts/rfc-syntax'
Plug 'ryanoasis/vim-webdevicons'
" Plug 'hsanson/vim-android'
" Plug 'derekwyatt/vim-fswitch'
Plug 'yuttie/comfortable-motion.vim'
" JSON syntax
Plug 'https://github.com/elzr/vim-json.git'
" JS syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'chemzqm/vim-jsx-improve'
Plug 'mhinz/vim-startify'
" Plug 'mtth/scratch.vim'
" Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'https://github.com/plasticboy/vim-markdown.git'
Plug 'https://github.com/suan/vim-instant-markdown.git', { 'do': 'npm install -g instant-markdown-d' }
" Plug 'jungomi/vim-mdnquery', { 'do': 'gem install --user-install mdn_query' }
Plug 'artur-shaik/vim-javacomplete2'
Plug 'mpyatishev/vim-sqlformat'

" Tornado template syntax
" Plug 'https://github.com/vim-scripts/tornadotmpl.vim.git'

" Colorschemes
"
" Solarized has been good to me. I plan to keep it a while
" Plug 'Solarized'
Plug 'https://github.com/frankier/neovim-colors-solarized-truecolor-only.git'

call plug#end()