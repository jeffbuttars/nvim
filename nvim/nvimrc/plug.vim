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

" function! DoRemote()
"   UpdateRemotePlugins
" endfunction

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
" Plug 'https://github.com/djdt/pyparens.nvim', { 'do': function('DoRemote') }
Plug 'https://github.com/djdt/pyparens.nvim'

Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/tpope/vim-eunuch.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
" Plug 'git://github.com/junegunn/vim-easy-align.git'
" Plug 'https://github.com/vim-ruby/vim-ruby'
" Plug 'https://github.com/tpope/vim-dispatch.git'
" Plug 'https://github.com/sjl/gundo.vim'
Plug 'https://github.com/Shougo/vimfiler.vim'
Plug 'https://github.com/will133/vim-dirdiff.git'
Plug 'https://github.com/Raimondi/delimitMate'
" Plug 'nginx.vim'
" Plug 'patchreview.vim'
" Plug 'jeffbuttars/neovim-doubletap', { 'do': function('DoRemote') }

Plug 'https://github.com/davidhalter/jedi-vim'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install tern', 'for': ['javascript', 'javascript.jsx'] }


" Java gets it's own completion plugin
Plug 'artur-shaik/vim-javacomplete2', { 'for': ['java']}

" (optional) javascript completion
Plug 'roxma/ncm-flow',  {'do': 'npm install'}
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'mhartington/nvim-typescript'
Plug 'jsfaint/gen_tags.vim'

" (optional) language server protocol framework
" Plug 'autozimu/LanguageClient-neovim', { 'do': function('DoRemote') }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" " (optional) php completion via LanguageClient-neovim
" Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}

" Automatically start language servers.
let g:LanguageClient_autoStart = 1
autocmd FileType php LanguageClientStart

Plug 'roxma/clang_complete'
" nvim-completion-manager
" Plug 'roxma/nvim-completion-manager', { 'do': function('DoRemote') }
Plug 'roxma/nvim-completion-manager'

" Plug 'https://github.com/w0rp/ale'
Plug 'https://github.com/neomake/neomake.git'

" Plug 'ternjs/tern_for_vim', { 'do': 'npm install tern', 'for': ['javascript', 'jsx', 'javascript.jsx'] }

" Keep builtin CSS completions up to date
Plug 'othree/csscomplete.vim'

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
" #### The pangloss plugin has a bug that is freezing Neovim, trying out the othree plugins for now
" #### the othree plugins may be to slow!!!!
"
" Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'mitermayer/vim-prettier', {
	\ 'do': 'yarn install', 
	\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }

" Plug 'chemzqm/vim-jsx-improve', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'mhinz/vim-startify'
" Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'https://github.com/plasticboy/vim-markdown.git'
Plug 'https://github.com/suan/vim-instant-markdown.git', { 'do': 'echo Run: npm install -g instant-markdown-d' }
" Plug 'jungomi/vim-mdnquery', { 'do': 'gem install --user-install mdn_query' }

" Solidity
Plug 'tomlion/vim-solidity'

" Colorschemes
"
" Solarized has been good to me. I plan to keep it a while
" Plug 'Solarized'
" Plug 'https://github.com/frankier/neovim-colors-solarized-truecolor-only.git'
" Plug 'https://github.com/lifepillar/vim-solarized8'
Plug 'iCyMind/NeoSolarized'
Plug 'https://github.com/MaxSt/FlatColor'

" NyaoVim Plugs
" Plug 'https://github.com/rhysd/nyaovim-markdown-preview'
" Plug 'https://github.com/rhysd/nyaovim-popup-tooltip'

call plug#end()
