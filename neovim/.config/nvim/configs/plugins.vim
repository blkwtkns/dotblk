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
Plug 'https://github.com/morhetz/gruvbox'
" Plug 'https://github.com/altercation/vim-colors-solarized'
" Plug 'https://github.com/tpope/vim-vividchalk'
" Plug 'https://github.com/tomasr/molokai'
" ====================================================================


" Visuals
" ====================================================================
" Plug 'https://github.com/ntpeters/vim-better-whitespace'
Plug 'https://github.com/editorconfig/editorconfig-vim'
Plug 'https://github.com/elzr/vim-json'

" Vim global plugin for dragging virtual blocks. By Damien Conway.
" Select text in Visual Block mode (ctrl-v), use arrow keys to move it around!
" https://github.com/rdlugosz/vim-dragvisuals
" Plug 'https://github.com/zirrostig/vim-schlepp'
" ====================================================================


" Completion
" ====================================================================
Plug 'https://github.com/Raimondi/delimitMate'
Plug 'https://github.com/valloric/MatchTagAlways'
" Plug 'https://github.com/marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'https://github.com/Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'https://github.com/tpope/vim-surround'
" ====================================================================


" Git
" ====================================================================
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/airblade/vim-gitgutter'
" Plug 'https://github.com/mhinz/vim-signify'
Plug 'https://github.com/sodapopcan/vim-twiggy'
Plug 'https://github.com/tpope/vim-rhubarb'
Plug 'https://github.com/junegunn/gv.vim'
" ====================================================================

" Syntax
" ====================================================================
Plug 'https://github.com/w0rp/ale'
" Plug 'https://github.com/neomake/neomake'
Plug 'https://github.com/tyru/current-func-info.vim'
" ====================================================================


" Session management
" ====================================================================
" Plug 'https://github.com/xolox/vim-misc' | Plug 'https://github.com/xolox/vim-session'
" Plug 'https://github.com/shuber/vim-promiscuous'
Plug 'https://github.com/blkwtkns/vim-sesh', { 'branch': 'develop' }
" Plug 'https://github.com/blkwtkns/vim-sesh'
" ====================================================================


" Javascript
" ====================================================================
" extends syntax for with jQuery,backbone,etc.
Plug 'https://github.com/othree/javascript-libraries-syntax.vim'
Plug 'https://github.com/othree/yajs.vim', { 'for': 'javascript' }
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/mxw/vim-jsx'
" ====================================================================

" Markdown
" ====================================================================
" extends syntax for with jQuery,backbone,etc.
Plug 'https://github.com/tpope/vim-markdown'
" ====================================================================

" Appearance
" ====================================================================
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'

Plug 'https://github.com/tomtom/tcomment_vim'
" Plug 'https://github.com/easymotion/vim-easymotion'

" Plugin outside ~/.config/nvim/plugged with post-update hook
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/blkwtkns/fzf.vim', { 'branch': 'upstream-color' }

" Easy grep like searching - install ack-grep first
Plug 'https://github.com/mileszs/ack.vim'
" Plug 'https://github.com/mhinz/vim-grepper'
" Plug 'https://github.com/ctrlpvim/ctrlp.vim'
" Plug 'https://github.com/FelikZ/ctrlp-py-matcher'
" Plug 'https://github.com/tacahiroy/ctrlp-funky'
" check out
" Plug 'https://github.com/inside/vim-grep-operator'
" ====================================================================


" Haskell:
" ====================================================================
" Plug 'https://github.com/dag/vim2hs'
" Plug 'https://github.com/bitc/vim-hdevtools'
" Plug 'https://github.com/eagletmt/neco-ghc'
" Plug 'https://github.com/Shougo/vimproc.vim', {'do' : 'make'}
" Plug 'https://github.com/ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
" ====================================================================

" Clojure:
" ====================================================================
Plug 'https://github.com/guns/vim-clojure-static'
Plug 'https://github.com/tpope/vim-fireplace'
" ====================================================================


" Elixir:
" ====================================================================
" Polyglot: A collection of language packs, loaded on demand
" Plug 'https://github.com/sheerun/vim-polyglot'

" Plug 'https://github.com/slashmili/alchemist.vim'
" Plug 'https://github.com/powerman/vim-plugin-AnsiEsc'
"
" Plug 'https://github.com/c-brenn/phoenix.vim'
" Plug 'https://github.com/tpope/vim-projectionist'
" ====================================================================


" Tags
" ====================================================================
" Install ctags are exuberant ctags first
" Plug 'https://github.com/ludovicchabant/vim-gutentags'
" Plug 'https://github.com/majutsushi/tagbar'
" ====================================================================


" Rust
" ====================================================================
" Plug 'https://github.com/rust-lang/rust.vim'
" ====================================================================

" Elm
" ====================================================================
Plug 'https://github.com/ElmCast/elm-vim'
" ====================================================================

" Typescript
" ====================================================================
" Plug 'https://github.com/burnettk/vim-angular'
Plug 'https://github.com/leafgarland/typescript-vim'
" ====================================================================

" Snippets
" ====================================================================
" Track the engine.
Plug 'https://github.com/Shougo/neosnippet.vim'
Plug 'https://github.com/Shougo/neosnippet-snippets'

" Snippets are separated from the engine. Add this if you want them:
Plug 'https://github.com/honza/vim-snippets'
" ====================================================================

" Plugins to test
" ====================================================================
Plug 'https://github.com/justinmk/vim-dirvish'
" Plug 'https://github.com/metakirby5/codi.vim'
" Plug 'https://github.com/Shougo/vimshell.vim'
" Plug 'https://github.com/mkitt/tabline.vim'
" Plug 'https://github.com/christoomey/vim-tmux-navigator'
" Plug 'https://github.com/janko-m/vim-test'
" Plug 'https://github.com/xolox/vim-misc'
" Plug 'https://github.com/gregsexton/gitv'
" Plug 'https://github.com/jceb/vim-orgmode'
" Plug 'https://github.com/easymotion/vim-easymotion'
" Plug 'https://github.com/mbbill/undotree'
Plug 'https://github.com/simnalamburt/vim-mundo'

" Align all the stuff
" Plug 'https://github.com/junegunn/vim-easy-align'
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
