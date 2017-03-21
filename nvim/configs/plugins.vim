" BEGIN
call plug#begin('~/nvim.local/plugged')
" ====================================================================
" Remote support
" ====================================================================
" {{{
    " https://github.com/mhinz/neovim-remote
    " $ sudo pip3 install neovim-remote -U
" }}}

" ====================================================================
" Color schemes
" ====================================================================
" Gruvbox
Plug 'morhetz/gruvbox'

" ====================================================================
" Visuals
" ====================================================================
" Plug 'ntpeters/vim-better-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'

" ====================================================================
" Completion
" ====================================================================
Plug 'Raimondi/delimitMate'
Plug 'valloric/MatchTagAlways'
" Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'tpope/vim-surround'

" ====================================================================
" Git
" ====================================================================
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" ====================================================================
" Syntax
" ====================================================================
Plug 'neomake/neomake'
Plug 'tyru/current-func-info.vim'

" ====================================================================
" Session management
" ====================================================================
Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'

" ====================================================================
" Javascript
" ====================================================================
" extends syntax for with jQuery,backbone,etc.
Plug 'othree/javascript-libraries-syntax.vim'

Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" ====================================================================
" Appearance
" ====================================================================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tomtom/tcomment_vim'
" Plug 'easymotion/vim-easymotion'

" Plugin outside ~/.config/nvim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" Easy grep like searching - install ack-grep first
" Plug 'mileszs/ack.vim'
Plug 'mhinz/vim-grepper'
Plug 'ctrlpvim/ctrlp.vim'

" ====================================================================
" Haskell
" ====================================================================
" Plug 'dag/vim2hs'
" Plug 'bitc/vim-hdevtools'
Plug 'eagletmt/neco-ghc'
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

" ====================================================================
" Tags
" ====================================================================
" Install ctags are exuberant ctags first
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" ====================================================================
" Rust
" ====================================================================
" Plug 'rust-lang/rust.vim'

call plug#end()    " vim-plug