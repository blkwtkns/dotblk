"                                _
"                               (_)
"          _ __   ___  _____   ___ _ __ ___
"         | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
"         | | | |  __/ (_) \ V /| | | | | | |
"         |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"
" My rendtion of Jabba's config, (credit: Jabba Laci (jabba.laci@gmail.com));
" last change: 2016.11.11. (yyyy.mm.dd.)
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
    let g:python_host_prog='/usr/local/bin/python'
    let g:python2_host_prog='/usr/local/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'
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

" call plug#begin('~/nvim.local/plugged')
call plug#begin('~/nvim.local/plugged')
" BEGIN


" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

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
" Beautifier
Plug 'maksimr/vim-jsbeautify'
"jsbeautify Config

"{{{
let g:config_Beautifier = {}
let g:config_Beautifier['js'] = {}
let g:config_Beautifier['js'].indent_size = '2'
let g:config_Beautifier['css'] = {}
let g:config_Beautifier['css'].indent_size = '2'
let g:config_Beautifier['html'] = {}
let g:config_Beautifier['html'].indent_size = '2'
" for file beautification
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" for range beautification
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
"}}}

" Plug 'Yggdroot/indentLine'
" let g:indentLine_char = '¦'

Plug 'nathanaelkane/vim-indent-guides'
" {{{
  " :h indent-guide
  " <Leader>ig    -> toggle indent guide on/off
  let g:indent_guides_enable_on_vim_startup = 0
  let g:indent_guides_guide_size = 1
" }}}

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
    " viw    -> visually select the current word
    nnoremap <space> viw
    " select the text, press s and type in the surrounding character / tag
    " cs'"    -> (DON'T select the text) change ' to "
    " ds"     -> (DON'T select the text) delete surrounding "
    " dst     -> (DON'T select the text) delete surrounding tags (for ex. <q> and </q>)
    " cs'<q>  -> (DON'T select the text) change ' to <q>...</q>
    " cst'    -> (DON'T select the text) change surrounding tag to '
    " select text, s ]    -> surround with [ and ] (no space)
    " ----------
    " the s was deprecated and mapped to S (capital s)
    " this is how to go back to the old behaviour:
    " vmap s S

    " vim-repeat: https://github.com/tpope/vim-repeat
    " However, I didn't understand how to use it...
    " But here I found an excellent example:
    " http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/

    " here are some own surroundings that are more intuitive for me
    " nnoremap <silent> <Plug>SurroundWordWithApostrophe  viw<esc>a'<esc>hbi'<esc>lel
    "     \ :call repeat#set("\<Plug>SurroundWordWithApostrophe", v:count)<cr>
    " nmap <Leader>'  <Plug>SurroundWordWithApostrophe
    "
    " nnoremap <silent> <Plug>SurroundWordWithQuote  viw<esc>a"<esc>hbi"<esc>lel
    "     \ :call repeat#set("\<Plug>SurroundWordWithQuote", v:count)<cr>
    " nmap <Leader>"  <Plug>SurroundWordWithQuote
    "
    " nnoremap <silent> <Plug>SurroundWordWithBacktick  viw<esc>a`<esc>hbi`<esc>lel
    "     \ :call repeat#set("\<Plug>SurroundWordWithBacktick", v:count)<cr>
    " nmap <Leader>`  <Plug>SurroundWordWithBacktick
    "
    " vnoremap <Leader>'  <esc>`<i'<esc>`>la'<esc>
    " vnoremap <Leader>"  <esc>`<i"<esc>`>la"<esc>
    " vnoremap <Leader>`  <esc>`<i`<esc>`>la`<esc>
" }}}

" ====================================================================
" Git
" ====================================================================
Plug 'tpope/vim-fugitive'
" {{{
" }}}

" Plug 'airblade/vim-gitgutter'
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


" ====================================================================
" Buffers
" ====================================================================
" Plug 'vim-scripts/BufOnly.vim'
" {{{
    " :BufOnly closes all buffers except the current one
" }}}


" ====================================================================
" Formatter
" ====================================================================
" Plug 'Chiel92/vim-autoformat'
" {{{
    " https://github.com/Chiel92/vim-autoformat
    " Usage:
    "   1) :Autoformat    -> entire file
    "   2) select a region and then :Autoformat    -> format just the region
    " for json, html, css, javascript:
    "   $ sudo npm install -g js-beautify
    " noremap <F5> :Autoformat<cr>
" }}}

" Plug 'avakhov/vim-yaml'
" {{{
    " https://github.com/avakhov/vim-yaml
    " indent yaml
" }}}


" ====================================================================
" Navigation
" ====================================================================
Plug 'scrooloose/nerdtree'
" {{{
    " noremap <F1> :call NERDTreeToggleAndFind()<cr>
    noremap <Leader>nt :NERDTreeToggle<cr>

    " function! NERDTreeToggleAndFind()
    "     if (exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1)
    "         execute ':NERDTreeClose'
    "     else
    "         execute ':NERDTreeFind'
    "     endif
    " endfunction

    " let g:NERDTreeQuitOnOpen = 1
    " let NERDTreeIgnore=['\.pyc$', '\~$']    " ignore files in NERDTree

    "let g:NERDTreeMinimalUI = 1
    "let g:NERDTreeHijackNetrw = 0
    "let g:NERDTreeWinSize = 31
    " let g:NERDTreeChDirMode = 2
    "let g:NERDTreeAutoDeleteBuffer = 1
    " let g:NERDTreeShowBookmarks = 1
    "let g:NERDTreeCascadeOpenSingleChildDir = 1
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1

    " Use compact syntax for prettified multi-line comments
    let g:NERDCompactSexyComs = 1

    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'
" }}}


" ====================================================================
" Commenting
" ====================================================================
" Plug 'scrooloose/nerdcommenter'
" {{{
    " Add spaces after comment delimiters by default
    " let g:NERDSpaceDelims = 1

    " Use compact syntax for prettified multi-line comments
    " let g:NERDCompactSexyComs = 1

    " Align line-wise comment delimiters flush left instead of following code indentation
    " let g:NERDDefaultAlign = 'left'

    " Add your own custom formats or override the defaults
    " let g:NERDCustomDelimiters = { 
    " \ 'javascript.jsx': { 'leftAlt': '/*', 'rightAlt': '*/', 'left': '{/*','right': '*/}' },
    " \ 'html': { 'left': '<!-- ', 'right': '-->', 'leftAlt': '/*','rightAlt': '*/' },
    " \}

    " Use alternative delimiters by default
    " let g:NERDAltDelims_js = 1

    " let NERD_jsx_alt_style=1
    " let NERD_html_alt_style=1
"}}} 

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

Plug 'ctrlpvim/ctrlp.vim'
" {{{
    " https://github.com/ctrlpvim/ctrlp.vim
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
" }}}

" Plug 'shougo/unite.vim' | Plug 'shougo/neomru.vim'
" {{{
    " Ctrl-p    -> since we are used to it
    " http://vimawesome.com/plugin/unite-vim
    " https://github.com/shougo/neomru.vim , this is required for file_mru
    " function! s:unite_settings()
    "    imap <buffer><tab>           <c-x><c-f>
    "    nmap <silent><buffer><esc>   :bd<cr>
    "    imap <buffer><c-p>   <Plug>(unite_select_previous_line)
    "    imap <buffer><c-n>   <Plug>(unite_select_next_line)
    "    inoremap <silent><buffer><expr> <C-s>     unite#do_action('split')
    "    inoremap <silent><buffer><expr> <C-v>     unite#do_action('vsplit')
    "    " for toggling (show / hide)
    "    " imap <silent><buffer><c-l>   <esc>:bd<cr>
    "    imap <silent><buffer><c-p>   <esc>:bd<cr>
    "    imap <F3>                    <esc>:bd<cr>
    " endfunction
    " custom mappings for the unite buffer
    " autocmd FileType unite call s:unite_settings()

    " nnoremap <c-p> :Unite file file_rec -start-insert -vertical -direction=botright<cr>

    "nnoremap <Leader>r :<C-u>Unite -start-insert file_rec<cr>
    " nnoremap <c-p> :Unite file file_rec buffer<cr>
    " nnoremap <c-l> :Unite line<cr>
    " noremap <F3> :Unite file_mru<cr>
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
    " nnoremap <F4> :TagbarToggle<cr>
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
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

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

set nolist " list disables linebreak

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
nnoremap <F3> :set hlsearch!<CR>

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

" Set the color scheme
syntax enable
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
set t_ut=
colorscheme gruvbox
" colorscheme solarized
set background=dark
let g:gruvbox_contrast_dark='hard'

highlight Normal ctermbg=None
" highlight NonText ctermbg=none

" Use the vim wildmenu for command completion
set wildmenu
set wildmode=longest:full,full

" Ignore files in the wildmenu
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.meteor/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*node_modules*,*.jpg,*.png,*.svg,*.ttf,*.woff,*.woff3,*.eot
",*public/css/*,*public/js*

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

" Status Line 
"{{{  
"}}}  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetypes
"
" Force *.md files to be recognized as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

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


" https://github.com/Shougo/neobundle.vim/issues/330
" {{{
    " call unite#filters#matcher_default#use(['matcher_fuzzy'])
    " call unite#custom#profile('default', 'context', {
    " \   'prompt': '» ',
    " \   'start_insert': 1,
    " \   'vertical': 1,
    " \   'direction': 'botright',
    " \   'ignorecase': 1
    " \ })
" }}}

" =================================================================================

" set scrolloff=2    " Show 2 lines of context around the cursor.
" set nostartofline
" ^^^ When 'on' the jump commands move the cursor to the first non-blank
" of the line.  When off the cursor is kept in the same column (if possible).

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


"VimTip 66: Transfer text between two Vim 'sessions' {{{
    " transfer/read and write one block of text between vim sessions
    " Usage:
    " `from' session:
    "     ma
    "     move to end-of-block
    "     xw
    "
    " `to' session:
    "     move to where I want block inserted
    "     xr
    "
    " nnoremap xr   :r $HOME/.vimxfer<cr>
    " nnoremap xR   :-r $HOME/.vimxfer<cr>
    " nnoremap xw   :'a,.w! $HOME/.vimxfer<cr>
    " vnoremap xr   c<esc>:r $HOME/.vimxfer<cr>
    " vnoremap xR   c<esc>:-r $HOME/.vimxfer<cr>
    " vnoremap xw   :w! $HOME/.vimxfer<cr>
" }}}

"VimTip 20: Are *.swp and *~ files littering your working directory? {{{
    " set backup
    " set backupext=~
    " set backupdir=~/nvim.local/tmp
    " set directory=~/nvim.local/tmp

    " let's add undo
    " set undofile
    " set undodir=~/nvim.local/undo
" }}}

" when re-opening a file, jump back to the previous position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" VimTip 305: make it easy to update/reload .vimrc {{{
    "src: source rc file
    "erc: edit rc file
    " nnoremap <Leader>src :source $MYVIMRC<cr>
    " nnoremap <Leader>erc :e $MYVIMRC<cr>
    " nnoremap <Leader>erc :vsplit $MYVIMRC<cr>
" }}}

" close (kill) window / buffer
" {{{
    " If you are in a split window, Ctrl-k closes the window.
    " If there is only one window (no split), Ctrl-k closes the current buffer.
    " This way you don't need to memorize two shortcuts for each operation.
    " function! CloseWindowOrBuffer()
    "     if winnr('$') > 1    " there is more than one window, i.e. there is a split
    "         call feedkeys("\<c-w>q")
    "     else
    "         call feedkeys(":bd\<cr>")
    "     endif
    " endfunction

    " nnoremap <c-k> :call CloseWindowOrBuffer()<cr>
    " inoremap <c-k> <Esc>:call CloseWindowOrBuffer()<cr>
" }}}

" split / buffers / windows {{{
    " noremap <c-x>\| :vsplit<cr>
    " noremap <c-x>\ :vsplit<cr>
    " noremap <c-x>/ :vsplit<cr>
    " noremap <c-x>- :split<cr>
    " noremap <c-x>3 :vsplit<cr>
    " noremap <c-x>1 :only<cr>
    " Ctrl-l is clear screen in bash but Ctrl-l was taken
    " so Alt-l is chosen to 'clear' the screen, i.e. keep the current window only
    " nnoremap <A-l> :only<cr>
    " maximize the current window (highest possible, then widest possible)
    " vertical to horizontal ( | -> -- )
    " noremap <c-w>-  <c-w>t<c-w>K
    " horizontal to vertical ( -- -> | )
    " noremap <c-w>\|  <c-w>t<c-w>H
    " noremap <c-w>\  <c-w>t<c-w>H
    " noremap <c-w>/  <c-w>t<c-w>H
    "noremap <F11>    <c-w>_<c-w>\|
    " function! ToggleWindow()
    "   if exists("w:maximized")
    "       call feedkeys("\<c-w>=", "n")
    "       unlet w:maximized
    "   else
    "       call feedkeys("\<c-w>_\<c-w>\|", "n")
    "       let w:maximized = 1
    "   endif
    " endfunction
    " noremap <F11>  :call ToggleWindow()<cr>
" }}}

" save current file {{{
    " noremap <c-x><c-s> <ESC>:w<cr>
    " inoremap <c-x><c-s> <ESC>:w<cr>i
" }}}

"############################################################################
"#  START: Jabba's own config :)
"############################################################################

"this way Y is more logical
" noremap Y y$

" VimTip 224: Shifting blocks visually
" vnoremap < <gv
" vnoremap > >gv

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
    " highlight ColorColumn ctermbg=magenta
    " call matchadd('ColorColumn', '\%101v', 100)    " I set it to 100
    "call matchadd('ColorColumn', '\%121v', 100)   " column 120
    "call matchadd('ColorColumn', '\%81v', 100)    " column 80
" }}}

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]====== {{{
    " exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
    " set list
" }}}

" (http://unlogic.co.uk/posts/vim-python-ide.html)
" Use l to toggle display of whitespace
" nnoremap <Leader>l :set list!<cr>
" And set some nice chars to do it with
"set listchars=tab:»\ ,eol:¬
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

" terminal emulator {{{
    " https://www.reddit.com/r/neovim/comments/3wqo0i/nvim_terminal/
    """""""""""""""
    " this way ESC-0 works in the terminal in Midnight Commander to quit mc:
    " tnoremap <esc><esc> <C-\><C-n>
    " Move between windows
    " tnoremap <A-left> <C-\><C-n><C-w>h
    " tnoremap <A-down> <C-\><C-n><C-w>j
    " tnoremap <A-up> <C-\><C-n><C-w>k
    " tnoremap <A-right> <C-\><C-n><C-w>l
    " nnoremap <A-left> <C-w>h
    " nnoremap <A-down> <C-w>j
    " nnoremap <A-up> <C-w>k
    " nnoremap <A-right> <C-w>l
    "
    " tnoremap <A-h> <C-\><C-n><C-w>h
    " tnoremap <A-j> <C-\><C-n><C-w>j
    " tnoremap <A-k> <C-\><C-n><C-w>k
    " tnoremap <A-l> <C-\><C-n><C-w>l
    " nnoremap <A-h> <C-w>h
    " nnoremap <A-j> <C-w>j
    " nnoremap <A-k> <C-w>k
    " nnoremap <A-l> <C-w>l

    " nnoremap <c-x>t :vsplit<cr>:term<cr>
    " nnoremap <c-x>T :split<cr>:term<cr>

    " function! Terminal(params)
    "     call feedkeys(":vsplit\<cr>:term\<cr>")
    "     call feedkeys(a:params . "\<cr>")
    " endfunction

    " :T cmd    -> open the cmd command in the terminal, e.g. :T mc    -> open mc
    " command! -nargs=1 T call Terminal(<f-args>)
" }}}

" centre the screen on the current search result {{{
    "nnoremap n nzz
    "nnoremap N Nzz
    " nnoremap * *zz
    " nnoremap # #zz
    " nnoremap g* g*zz
    " nnoremap g# g#zz
" }}}

"scroll half page left (CTRL-B) / right (CTRL-J) {{{
    " noremap  <c-b> zH
    " noremap! <c-b> zH
    " noremap  <c-j> zL
    " noremap! <c-j> zL
" }}}

"VimTip 38: Cursor one line at a time when :set wrap {{{
    " nnoremap j gj
    " nnoremap k gk
    " vnoremap j gj
    " vnoremap k gk
    " nnoremap <Down> gj
    " nnoremap <Up> gk
    " vnoremap <Down> gj
    " vnoremap <Up> gk
    " inoremap <Down> <C-o>gj
" }}}

" close window
" nnoremap <c-q> <c-w>q

"VimTip 163: Toggle Search Highlighting {{{
    " nnoremap <Leader>h :set cursorline! hlsearch!<cr>
    " nnoremap H :set cursorline! hlsearch!<cr>
"}}}

" scroll in the 'background' {{{
    " the cursor remains in the center and the text scrolls up/down
    " noremap <s-up>   kzz
    " noremap <s-down> jzz
" }}}

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
    " command! Google exec 'silent !xdg-open http://www.google.com'
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

" {{{
    function! CenterCursor()
        call feedkeys("zz")    " emulate these keypresses: zz (center line)
    endfunction

    " autocmd BufReadPre,FileReadPre * call CenterCursor()
" }}}

" filename / dirname of the current file {{{
    " copy result to the system clipboard and echo the result
    " the cb> prompt means the clipboard
    " *f*ile *n*ame, ex. init.vim
    " nnoremap <Leader>fn :let @+ = expand("%:t") \| echo 'cb> ' . @+<cr>
    " *f*ile *p*ath, ex. /home/user/nvim/init.vim
    " nnoremap <Leader>fp :let @+ = expand("%:p") \| echo 'cb> ' . @+<cr>
    " *d*irectory *p*ath, ex. /home/user/nvim
    " nnoremap <Leader>dp :let @+ = expand("%:p:h") \| echo 'cb> ' . @+<cr>
    " *d*irectory *n*ame, ex. nvim
    " nnoremap <Leader>dn :let @+ = expand("%:p:h:t") \| echo 'cb> ' . @+<cr>
" }}}

" {{{
    " from http://stackoverflow.com/a/9459366/232485
    function! HandleURL()
      let uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
      echo uri
      if uri != ""
        silent exec "!xdg-open '" . uri . "'"
      else
        echo "no URI found in line"
      endif
    endfunction

    nnoremap <Leader>u :call HandleURL()<cr>
" }}}

" some abbreviations {{{
    " iabbrev tubi    https://ubuntuincident.wordpress.com/
    " iabbrev pyadv   https://pythonadventures.wordpress.com/
" }}}

" exit insert, dd line, enter insert
" inoremap <c-d> <esc>ddi

" close empty buffers {{{
    " tip from http://stackoverflow.com/a/6561076/232485
    function! NrBufs()
        let i = bufnr('$')
        let j = 0
        while i >= 1
            if buflisted(i)
                let j+=1
            endif
            let i-=1
        endwhile
        return j
    endfunction

    function! CloseEmptyBuffers()
        if NrBufs() == 1
            return
        endif
        let [i, n; empty] = [1, bufnr('$')]
        while i <= n
            if bufexists(i) && bufname(i) == ''
                call add(empty, i)
            endif
            let i += 1
        endwhile
        if len(empty) > 0
            exe 'bdelete' join(empty)
        endif
    endfunction

    nnoremap <F8> :call CloseEmptyBuffers()<cr>
" }}}
