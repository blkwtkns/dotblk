"                                _
"                               (_)
"          _ __   ___  _____   ___ _ __ ___
"         | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
"         | | | |  __/ (_) \ V /| | | | | | |
"         |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"
" My rendtion of Jabba's config, (credit: Jabba Laci (jabba.laci@gmail.com));
" Jabba's repo: https://github.com/jabbalaci/dotfiles/blob/master/nvim/init.vim
"
" Place of this configuration file:
"   ~/.config/nvim/init.vim
"
" HQ:
"   * https://neovim.io
"   * https://neovim.io/news/archive/ (news)
" Docs:
"   * https://neovim.io/doc/user/ (from basic to advanced)
"   * :h nvim
"   * Nice config articles:
"     http://sts10.github.io/blog/2016/02/12/best-of-my-vimrc/
"
" Most recent (bleedind edge) info on commits:
"   * https://github.com/neovim/neovim/wiki/Following-HEAD
"
" Installation (Ubuntu):
"   The HQ suggests a PPA that contains the development version:
"     * https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu
"
"   $ sudo add-apt-repository -y ppa:neovim-ppa/unstable
"   $ sudo apt-get update && sudo apt-get install -y neovim
"   $ pip install --user neovim
"
"   $ mkdir -p ~/.config/nvim
"   $ ln -s ~/.vimrc ~/.config/nvim/init.vim
"
"   If you want to build Neovim from source, here are the steps:
"   1) Visit https://github.com/neovim/neovim and find the tagged version you need.
"      Download the zip, uncompress it, and enter the project folder.
"   2) Install the dependencies:
"      $ sudo apt-get install libtool autoconf automake cmake libncurses5-dev g++
"   3) $ make cmake
"      $ make test
"      $ sudo make install
"   On all platforms (update this package frequently):
"     $ sudo pip2/pip3 install neovim -U
" Links:
"   * https://github.com/greg-js/dotfiles
"   * http://vimcasts.org/ (vimcasts contains 68 free screencasts and 47 articles)
"   * http://vimawesome.com/ (list of awesome plugins)
"   * http://vim.spf13.com/ (it can give you ideas of must-have plugins)
"   * https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
"   * https://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/
" Notes:
"   * nvim --startuptime nvim.log    -> check what makes it slow to load
"   * :map H    -> What is mapped on H ?
"   * :verb set expandtab?    -> if expandtab is not OK, then find out who changed it for the last time (verbose)
"   * :set ft=json    -> treat the file as a json file (even if it has a different extension) [ft: filetype]
"

" <Leader>
let mapleader = ","
" <LocalLeader>
" let maplocalleader = "\\"

"
" Tips:
"   gx                -> open URL under cursor in your browser
"   :retab            -> replace TABs with 4 spaces
"   :set filetype?    -> current filetype
"   :edit             -> reload the current file (if it was changed outside of vim)
"
" Help:
"   :h help-context    -> v_ (visual mode commands), etc.
"   :h i_CTRL-Y        -> What does Ctrl-y do in insert mode?
"
" Windows:
"   Ctrl+w =           -> equal size
"   Ctrl+w _           -> maximize window's height (my map: F11)
"
" Moving:
"   reposition the current line:
"     zt  -> zoom to top
"     zz  -> zoom to center
"     zb  -> zoom to bottom
"
" Variables:
"                   (nothing) In a function: local to a function; otherwise: global
"   |buffer-variable|    b:   Local to the current buffer.
"   |window-variable|    w:   Local to the current window.
"   |tabpage-variable|   t:   Local to the current tab page.
"   |global-variable|    g:   Global.
"   |local-variable|     l:   Local to a function.
"   |script-variable|    s:   Local to a |:source|'ed Vim script.
"   |function-argument|  a:   Function argument (only inside a function).
"   |vim-variable|       v:   Global, predefined by Vim.
"

" create the required directories {{{
    silent !mkdir ~/nvim.local > /dev/null 2>&1
    silent !mkdir ~/nvim.local/tmp > /dev/null 2>&1
    silent !mkdir ~/nvim.local/undo > /dev/null 2>&1
" }}}

if has("unix")
  let s:uname = system("uname")
  let g:python_host_prog = '/usr/bin/python2'
  let g:python3_host_prog = '/usr/bin/python3'
  if s:uname == "Darwin\n"
    let g:python_host_prog='/usr/bin/python'
    let g:python2_host_prog='/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'
  endif
endif

" Autoinstall vim-plug {{{
    " https://github.com/junegunn/vim-plug
    let s:vim_plug_dir=expand($HOME.'/.config/nvim/autoload')
    if !filereadable(s:vim_plug_dir.'/plug.vim')
        execute '!wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -P '.s:vim_plug_dir
        let s:install_plug=1
    endif
" }}}

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
" {{{
    " https://github.com/elzr/vim-json
    " indentLine conceals quotes in json files; this puts them back:
    let g:vim_json_syntax_conceal = 0
" }}}

" ====================================================================
" Completion
" ====================================================================
Plug 'Raimondi/delimitMate'
" {{{
    " This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.
    " We also need this plugin in a workaround below, which requires this plugin.
    " set matchpairs+=<:>         " show matching <> (html mainly) as well
    " !!! when specifying several file types, there is NO space between them !!!
    autocmd FileType html,vim set matchpairs+=<:>
" }}}

Plug 'valloric/MatchTagAlways'
" {{{
    " https://github.com/valloric/MatchTagAlways
    " highlight the XML/HTML tags that enclose your cursor location
" }}}

"Tern for vim
" Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }

" deoplete, a YouCompleteMe alternative {{{
    function! DoRemote(arg)
      UpdateRemotePlugins
    endfunction
    Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1

    "Deoplete Config
  if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
  endif
  " let g:deoplete#disable_auto_complete = 1
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

  " deoplete tab-complete
  inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
  " ,<Tab> for regular tab
  inoremap <Leader><Tab> <Space><Space>
  " tern
  " autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
" }}}


Plug 'tpope/vim-surround'
" Plug 'tpope/vim-repeat'
" {{{
" }}}

" ====================================================================
" Git
" ====================================================================
Plug 'tpope/vim-fugitive'
" {{{
" }}}

Plug 'airblade/vim-gitgutter'
" {{{
" }}}

" Plug 'Xuyuanp/nerdtree-git-plugin'
" {{{
" }}}

" ====================================================================
" Syntax
" ====================================================================
Plug 'neomake/neomake'
" {{{
    "neomake error
    " let g:neomake_verbose=3

    " run neomake on the current file on every write:
    autocmd! BufWritePost * Neomake

    " let g:neomake_javascript_jscs_maker = {
    " \ 'exe': 'jscs',
    " \ 'args': ['--no-color', '--preset', 'airbnb', '--reporter', 'inline', '--esnext'],
    " \ 'errorformat': '%f: line %l\, col %c\, %m',
    " \ }

    " install eslint via npm
    let g:neomake_javascript_enabled_makers = ['eslint']
    " let g:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
    " let g:neomake_javascript_eslint_exe=substitute(g:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

    let g:neomake_open_list = 2

    " Disable inherited syntastic
    let g:syntastic_mode_map = {
      \ "mode": "passive",
      \ "active_filetypes": [],
      \ "passive_filetypes": [] }

    let g:neomake_serialize = 1
    let g:neomake_serialize_abort_on_error = 1
    " setlocal makeprg=jscs\ %
    " setlocal errorformat=%-P%f,
    "                 \%A%>%\\s%\\?#%*\\d\ %m,%Z%.%#Line\ %l\\,\ Pos\ %c,
    "                 \%-G%f\ is\ OK.,%-Q

" }}}

Plug 'tyru/current-func-info.vim'

" ====================================================================
" Session management
" ====================================================================
Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'
" {{{
    " allows you to save and restore the current session (restart vim)
    " :SaveSession    -> save the session
    " :OpenSession    -> load the saved session
    let g:session_autosave = 'no'
    let g:session_autoload = 'no'
    let g:session_directory = '~/nvim.local/sessions'
" }}}


" ====================================================================
" Javascript
" ====================================================================
" extends syntax for with jQuery,backbone,etc.
Plug 'othree/javascript-libraries-syntax.vim'

Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" {{{
    " JavaScript and JSX highlighting
    "
    " Allow JSX in normal JS files
    let g:jsx_ext_required = 0
" }}}


" ====================================================================
" Appearance
" ====================================================================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
""{{{
    " https://github.com/vim-airline/vim-airline
    " let distro = system("cat /etc/issue | head -1 | cut -f 1 -d ' '")
    " if distro == "Manjaro\n"
    "     set termguicolors
    " else
    "     " Ubuntu
    "     set termguicolors
    "     " let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
    " endif
    " set termguicolors
    " also install the system package 'powerline-fonts'
    " let g:airline_powerline_fonts = 1
    " Enable the list of buffers
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    " Show just the filename
    " let g:airline#extensions#tabline#fnamemod = ':t'

    let g:airline#extensions#tabline#left_sep = ''
    " let g:python_host_prog='/usr/local/bin/python'
    let g:airline#extensions#tabline#left_alt_sep = '|'

    " Always display status line
    set laststatus=2


    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif

    let g:airline_symbols.space = "\ua0"

    let g:airline_theme = 'dark'
" }}}


" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END


Plug 'tomtom/tcomment_vim'
" {{{
    " http://vimawesome.com/plugin/tcomment
    " gcc    -> toggle current line (press . to toggle subsequent lines)
    " gc     -> toggle selected lines
    " Ctrl-/    -> also works but press it twice
" }}}
" ====================================================================

" Plug 'easymotion/vim-easymotion'
" {{{
    " http://vimawesome.com/plugin/easymotion
    " let g:EasyMotion_do_mapping = 0 " Disable default mappings
    " Turn on case insensitive feature
    " let g:EasyMotion_smartcase = 1
    " <Leader>w    -> search word
    " map <Leader>w <Plug>(easymotion-bd-w)
    " Jump to anywhere you want with minimal keystrokes, with just one key binding.
    " `s{char}{label}`
    " nmap s <Plug>(easymotion-overwin-f)
    " or
    " `s{char}{char}{label}`
    " Need one more keystroke, but on average, it may be more comfortable.
    " nmap <Leader>s <Plug>(easymotion-overwin-f2)

    " JK motions: motions (j: down, k: up, l: line, up and down)
    " map <Leader>j <Plug>(easymotion-j)
    " map <Leader>k <Plug>(easymotion-k)
    " map <Leader>l <Plug>(easymotion-bd-jk)
    " If you want to use more useful mappings, please see :h easymotion.txt for more detail.
" }}}

" Plugin outside ~/.config/nvim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
" {{{
    " Ctrl-f      -> find
    " :Files      -> find files recursively from the current dir.
    " :Files ~    -> find files recursively from the specified dir.
    " :Colors     -> browse and preview color schemes
    " :h fzf-vim-commands
    "let g:fzf_command_prefix = 'Fzf'
    " let g:fzf_action = {
    "       \ 'ctrl-s': 'split',
    "       \ 'ctrl-v': 'vsplit'
    "       \ }
    " ^ Enter: open in new buffer
    " let g:fzf_layout = { 'right': '50%' }
    " set splitbelow splitright
    " nnoremap <c-f> :FZF<cr>

    " Open in horizontal split
    " opens :Lines with some settings ('down')
    " nnoremap <silent> <c-l> :call fzf#vim#lines({
    " \   'down': '40%' })<cr>

    " " Open files in vertical horizontal split
    " nnoremap <silent> <Leader>v :call fzf#run({
    " \   'right': winwidth('.') / 2,
    " \   'sink':  'vertical botright split' })<cr>
" }}}

" Easy grep like searching - install ack-grep first
Plug 'mileszs/ack.vim'
" {{{
" ripgrep needs to be installed, use cargo(Rust)
let g:ackprg = 'rg -S --no-heading --vimgrep'
" }}}

Plug 'ctrlpvim/ctrlp.vim'
" {{{
    " https://github.com/ctrlpvim/ctrlp.vim

    if executable('rg')
      set grepprg=rg\ --color=never
      let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
      let g:ctrlp_use_caching = 0
    endif

    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    nnoremap <leader>ct :CtrlPTag<CR>
" }}}


" ====================================================================
" Haskell
" ====================================================================
" Plug 'dag/vim2hs'
" Plug 'bitc/vim-hdevtools'
"{{{
"au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
"au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
"}}}
Plug 'eagletmt/neco-ghc'
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }


" ====================================================================
" Python
" ====================================================================
" Plug 'fisadev/vim-isort'
" {{{
    " https://github.com/fisadev/vim-isort
    " $ sudo pip2/pip3 install isort -U
    " sort python imports using isort
    " select a block of imports with visual mode, and press Ctrl-i to sort them
" }}}

" ====================================================================
" Tags
" ====================================================================
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
" {{{
    " $ yaourt ctags                  # Manjaro
    " $ sudo apt-get install ctags    # Ubuntu
      nmap <Leader>tg :TagbarToggle<CR>
" }}}

" ====================================================================
" Terminal
" ====================================================================
"Plug 'kassio/neoterm'
" {{{
    " https://github.com/kassio/neoterm
    " let g:neoterm_position = 'vertical'
" }}}

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Add plugins to &runtimepath
" END

" ====================================================================
" Rust
" ====================================================================
" Plug 'rust-lang/rust.vim'
" {{{
    " https://github.com/rust-lang/rust.vim
" }}}

call plug#end()    " vim-plug


"############################################################################
"#  START: Blakes's own config :)
"############################################################################

" Allow hidden buffers
set hidden

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" ctags optimization
" Look for tags in current and above directories
" set tags=./tags;/,tags;/

"=========
" General
"=========

"Leader remap
"let mapleader=","

" Enable filetype plugins
filetype plugin on
filetype indent on

"Always show current position
set ruler

" Buffers
" nnoremap <leader>T :enew<cr>
nnoremap gl :bnext<CR>
nnoremap gh :bprevious<cr>
" nnoremap gd :bdelete<cr>
nnoremap <leader>bl :ls<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Numbering
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" absolute number is default
set number
" relative number for lines
set relativenumber

" function and key map to toggle absolute and relative numbering
" function! NumberToggle()
  " if(&relativenumber == 1)
    " set number
  " else
    " set relativenumber
  " endif
" endfunc

" nnoremap <C-n> :call NumberToggle()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" show location of cursor using a horizontal line.
" set cursorline
" autocmd InsertEnter * highlight CursorLine guifg=white guibg=blue ctermfg=white ctermbg=blue
" autocmd InsertLeave * highlight CursorLine guifg=white guibg=darkblue ctermfg=yellow ctermbg=darkblue

" keep cursor in the middle of the screen while scrolling up and down.
set scrolloff=999

" Sets how many lines of history VIM has to remember
set history=700

" Enable system clipboard
set clipboard=unnamedplus

"key time delays
set timeoutlen=1000
set ttimeoutlen=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Be smart when using tabs ;)
set smarttab

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


" Tab settings
set tabstop=2
set shiftwidth=2
set expandtab

" set nolist " list disables linebreak

" Prevent Vim from automatically inserting line
"   breaks in newly entered text
set textwidth=0
set wrapmargin=0

" Open split windows below / to the right
set splitbelow
set splitright

" Treat long lines as break lines (useful when moving around in them)
" map j gj
" map k gk
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Terminal mode
"
" Switch to normal mode
tnoremap <Leader><ESC> <C-\><C-n>

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Highlights all search hits
set hlsearch

" Toggle search highlighting
nnoremap <leader><space> :noh<CR>

" Character representation of whitespaces
set list listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

" Strips whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Set the color scheme
syntax enable
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
" set t_ut=
colorscheme gruvbox
" colorscheme solarized
set background=dark
let g:gruvbox_contrast_dark='hard'

highlight Normal ctermbg=None
highlight SpecialKey ctermfg=132 guifg=Cyan
" highlight NonText ctermfg=12 guifg=Blue

" Use the vim wildmenu for command completion
set wildmenu
set wildmode=longest:full,full

" Ignore files in the wildmenu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*node_modules*,*.jpg,*.png,*.svg,*.ttf,*.woff,*.woff3,*.eot

" HTML Autocomplete
set omnifunc=htmlcomplete#CompleteTags

""""""""""""""""""""""""""""""
" => Folding
""""""""""""""""""""""""""""""
"set fdm=indent
"set fdc=4
"set fdl=1
" augroup remember_folds
  " autocmd!
  " autocmd BufWinLeave *.* mkview
  " autocmd BufWinEnter *.* loadview
" augroup END


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
" set laststatus=2 (already set in airline config below)

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetypes
"
" Force *.md files to be recognized as markdown
" autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup file_types
    autocmd!
    autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.txt set filetype=markdown
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
    autocmd BufNewFile,BufRead *.less set filetype=less
    autocmd BufRead,BufNewFile *.js set ft=javascript syntax=javascript
    autocmd BufRead,BufNewFile *.ts set ft=typescript syntax=typescript
    autocmd BufRead,BufNewFile *.es6 set ft=javascript syntax=javascript
    autocmd BufRead,BufNewFile *.json set ft=json syntax=javascript
    autocmd BufRead,BufNewFile *.twig set ft=htmldjango
    autocmd BufRead,BufNewFile *.rabl set ft=ruby
    autocmd BufRead,BufNewFile *.jade set ft=jade
augroup END

" Stop Automatic insert of comment leader when hitting <Enter> in insert mode
" or hitting 'o' or 'O' in Normal mode
au FileType * set fo-=r fo-=o

"Omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

"Haskell
augroup NeomakeHaskell
  autocmd!
  autocmd! BufWritePost *.hs Neomake
augroup END

" tern
" if exists('g:plugs["tern_for_vim"]')
"   let g:tern_show_argument_hints = 'on_hold'
"   let g:tern_show_signature_in_pum = 1
"   let g:tern_map_keys=1
"   autocmd FileType javascript setlocal omnifunc=tern#Complete
" endif

"function that clears all registers with ClearRegister command
function! ClearRegisters()
    let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="*+'
    let i=0
    while (i<strlen(regs))
        exec 'let @'.regs[i].'=""'
        let i=i+1
    endwhile
endfunction

command! ClearReg call ClearRegisters()

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


" mouse {{{
    " set mouse=a
    "
    " function! ToggleMouse()
    "   if &mouse == "a"
    "     set mouse=
    "     echo 'copy with mouse: ✔'
    "     set nonumber
    "   else
    "     set mouse=a
    "     echo 'copy with mouse: ✘'
    "     set number
    "   endif
    " endfunction

    " Ctrl-m also affects <cr> !!!,
    " so in Vim you can't map Ctrl-m
    " noremap M :call ToggleMouse()<cr>
" "}}}

" au BufNewFile,BufRead *.js set tabstop=2 softtabstop=2 shiftwidth=2
" au BufNewFile,BufRead *.html set tabstop=2 softtabstop=2 shiftwidth=2
" au BufNewFile,BufRead *.css set tabstop=2 softtabstop=2 shiftwidth=2

" don't change TABs in makefiles
" autocmd FileType make set noexpandtab

" disable automatic comment insertion
" autocmd FileType * setlocal formatoptions-=c  formatoptions-=r formatoptions-=o

" highlight the current line {{{
    " set cursorline
    " autocmd WinEnter * setlocal cursorline
    " autocmd WinLeave * setlocal nocursorline
" }}}


" when re-opening a file, jump back to the previous position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

"############################################################################
"#  Function keys
"############################################################################

"switch spell check on/off (grammar check)
" setlocal spell spelllang=en_us      "let's use English by default
" set nospell                         "by default spell is off

"change wrap
" noremap <F6> :set wrap!<cr>

"change number
" noremap <F7> :set number!<cr>

"############################################################################
"#  other
"############################################################################

" don't outdent hashes
" inoremap # #

"====[ Make the 81st column stand out ]==================== {{{
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\%101v', 100)    " I set it to 100
    call matchadd('ColorColumn', '\%121v', 100)   " column 120
    call matchadd('ColorColumn', '\%81v', 100)    " column 80
" }}}

" automatically change window's cwd to file's dir
" set autochdir

" remove trailing whitespaces {{{
    " autocmd BufWritePre *.txt :%s/\s\+$//e
    " autocmd BufWritePre *.py :%s/\s\+$//e
    " autocmd BufWritePre *.php :%s/\s\+$//e
    " autocmd BufWritePre *.java :%s/\s\+$//e
    " autocmd BufWritePre *.md :%s/\s\+$//e
    " autocmd BufWritePre *.h :%s/\s\+$//e
    " autocmd BufWritePre *.tex :%s/\s\+$//e
    " autocmd BufWritePre *.vim :%s/\s\+$//e
    " autocmd BufWritePre *.nfo :%s/\s\+$//e
" }}}

" when going back to a terminal, switch to insert mode automatically
" autocmd BufWinEnter,WinEnter term://* startinsert

" This makes the cursor a pipe in insert-mode, and a block in normal-mode.
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Avoid scrolling when switch buffers {{{
" tip from romainl on IRC #vim
" augroup save_and_restore_buffer
"     autocmd!
"     autocmd BufLeave * let b:winview = winsaveview()
"     autocmd BufEnter * if exists('b:winview') | call winrestview(b:winview) | endif
" augroup END
" }}}

" Google with (or without) search {{{
    function! Google(params)
        " echo a:params
        let url = "http://www.google.com/search?q=" . a:params
        exec 'silent !xdg-open "' . url . '"'
    endfunction

    " :Go search_term    -> google lookup of the search term
    command! -nargs=1 Go call Google(<f-args>)

    " :Google    -> open Google's search page
    command! Google exec 'silent !xdg-open http://www.google.com'
" }}}

" Firefox bookmarks (works with other browsers too) {{{
    function! Firefox(params)
        let d = {
        \ 'go': 'http://www.google.com',
        \ 'wp': 'https://en.wikipedia.org',
        \ 'red': 'http://www.reddit.com',
        \ 'py': 'http://www.reddit.com/r/python',
        \ 'prog': 'http://www.reddit.com/r/programming',
        \ 'vim': 'http://www.reddit.com/r/vim',
        \ 'nvim': 'http://www.reddit.com/r/neovim',
        \ 'hn': 'https://news.ycombinator.com',
        \ 'index': 'http://index.hu',
        \ 'hup': 'http://hup.hu',
        \ }
        if has_key(d, a:params)
            let url = d[a:params]
            exec 'silent !xdg-open "' . url . '"'
        else
            echo "bookmark not found"
      endif
    endfunction

    command! -nargs=1 FF call Firefox(<f-args>)
" }}}
