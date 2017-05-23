" for deoplete
fun! DoRemote(arg)
  UpdateRemotePlugins
endfun

call plug#begin('~/nvim.local/plugged')
" Remote support
" ====================================================================
" https://github.com/mhinz/neovim-remote
" $ sudo pip3 install neovim-remote -U
" ====================================================================


" Color schemes
" ====================================================================
Plug 'morhetz/gruvbox'
" Plug 'altercation/vim-colors-solarized'
" Plug 'tpope/vim-vividchalk'
" Plug 'tomasr/molokai'
" ====================================================================


" Visuals
" ====================================================================
" Plug 'ntpeters/vim-better-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'

" Vim global plugin for dragging virtual blocks. By Damien Conway.
" Select text in Visual Block mode (ctrl-v), use arrow keys to move it around!
" https://github.com/rdlugosz/vim-dragvisuals
" Plug 'zirrostig/vim-schlepp'
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
" Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'
" Plug 'shuber/vim-promiscuous'
Plug 'blkwtkns/vim-sesh'
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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug 'blkwtkns/fzf.vim'

" Easy grep like searching - install ack-grep first
Plug 'mileszs/ack.vim'
" Plug 'mhinz/vim-grepper'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'FelikZ/ctrlp-py-matcher'
" Plug 'tacahiroy/ctrlp-funky'
" check out
" Plug 'inside/vim-grep-operator'
" ====================================================================


" Haskell:
" ====================================================================
" Plug 'dag/vim2hs'
" Plug 'bitc/vim-hdevtools'
Plug 'eagletmt/neco-ghc'
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
" ====================================================================


" Elixir:
" ====================================================================
" Polyglot: A collection of language packs, loaded on demand
Plug 'sheerun/vim-polyglot'

Plug 'slashmili/alchemist.vim'
" Plug 'powerman/vim-plugin-AnsiEsc'
"
Plug 'c-brenn/phoenix.vim'
" Plug 'tpope/vim-projectionist'
" ====================================================================


" Tags
" ====================================================================
" Install ctags are exuberant ctags first
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'majutsushi/tagbar'
" ====================================================================


" Rust
" ====================================================================
" Plug 'rust-lang/rust.vim'
" ====================================================================


" Plugins to test
" ====================================================================
  Plug 'justinmk/vim-dirvish'
" Plug 'mkitt/tabline.vim'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'janko-m/vim-test'
" Plug 'xolox/vim-misc'
" Plug 'gregsexton/gitv'
" Plug 'jceb/vim-orgmode'
" Plug 'easymotion/vim-easymotion'
" Plug 'mbbill/undotree'

" show git history in vim
" Plug 'junegunn/gv.vim'

" Align all the stuff
" Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)

" Plug 'janko-m/vim-test'
" let test#strategy = "neovim"
" nmap <silent> <leader>rn :TestNearest<CR>
" nmap <silent> <leader>rf :TestFile<CR>
" nmap <silent> <leader>ra :TestSuite<CR>
" nmap <silent> <leader>rr :TestLast<CR>
" nmap <silent> <leader>rv :TestVisit<CR>
" ====================================================================

call plug#end()    " vim-plug
