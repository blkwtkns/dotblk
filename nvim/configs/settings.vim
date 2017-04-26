" 'elzr/vim-json'
" indentLine conceals quotes in json files; this puts them back:
let g:vim_json_syntax_conceal = 0

" ====================================================================
" Completion
" ====================================================================
" 'Raimondi/delimitMate'
autocmd FileType html,vim set matchpairs+=<:>

" 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

"Deoplete Config
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" tern
" autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
" }}}

" ====================================================================
" Syntax
" ====================================================================
" 'neomake/neomake'
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

    " install eslint via npm (or use jshint/jscs)
    let g:neomake_javascript_enabled_makers = ['eslint']
    " let g:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
    " let g:neomake_javascript_eslint_exe=substitute(g:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

    let g:neomake_open_list = 0

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

" ====================================================================
" Session management
" ====================================================================
" 'xolox/vim-misc' | 'xolox/vim-session'
" {{{
    " allows you to save and restore the current session (restart vim)
    " :SaveSession    -> save the session
    " :OpenSession    -> load the saved session
    " let g:session_autosave = 'no'
    " let g:session_autoload = 'no'
    " let g:session_directory = '~/nvim.local/sessions'
" }}}

" Homerolled plugin 'blkwtkns/vim-sesh'
" {{{

  " let g:session_directory = expand($HOME.'/nvim.local/sessions')
  " let g:session_meta = g:session_directory.'/'.'.metaseshrc'
  let g:session_autocmds = 0

" }}}

" ====================================================================
" Javascript
" ====================================================================
" 'mxw/vim-jsx'
" {{{
    " JavaScript and JSX highlighting
    "
    " Allow JSX in normal JS files
    let g:jsx_ext_required = 0
" }}}

" ====================================================================
" Appearance
" ====================================================================
" 'vim-airline/vim-airline' & 'vim-airline/vim-airline-themes'
" {{{
  " also install the system package 'powerline-fonts'
  " let g:airline_powerline_fonts = 1
  " Enable the list of buffers
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_nr_show = 1
  " Show just the filename
  " let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#show_splits = 1

  " let g:airline#extensions#tabline#tab_nr_type = 0 " # of splits (default)
  " let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
  let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number

  let g:airline#extensions#tabline#left_sep = ''
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
" Explore
" ====================================================================
" vim-dirvish
let g:loaded_netrwPlugin = 1
autocmd! FileType dirvish setlocal relativenumber
" command! -nargs=? -complete=dir Vexplore leftabove vsplit | vertical resize 25 | silent Dirvish <args>
" nnoremap - :Vexplore<CR>
command! VleftDirvish leftabove vsplit | vertical resize 25 | silent Dirvish <args>
nnoremap - :VleftDirvish<CR>

" Netrw
" let g:netrw_banner = 0
" let g:netrw_liststyle = 0
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

" Plugin outside ~/.config/nvim/plugged with post-update hook
" 'junegunn/fzf.vim'
"{{{
" ripgrep and fzf
" work on making the quickfix window similar to ack
" let g:fzf_action = {
"       \ 'ctrl-t': 'tab split',
"       \ 'ctrl-i': 'split',
"       \ 'ctrl-s': 'vsplit' }
" let g:fzf_layout = { 'down': '~20%' }
"
" let g:rg_command = '
"       \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
"       \ -g "*.{js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst}"
"       \ -g "!{.git,node_modules,vendor,build,yarn.lock,*.sty}/*" '
"
" command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

    " --column: Show column number
    " --line-number: Show line number
    " --no-heading: Do not show file headings in results
    " --fixed-strings: Search term as a literal string
    " --ignore-case: Case insensitive search
    " --no-ignore: Do not respect .gitignore, etc...
    " --hidden: Search hidden files and folders
    " --follow: Follow symlinks
    " --glob: Additional conditions for search (in this case ignore everything
    "  in the .git/ folder)
    " --color: Search color options
" }}}

" 'mileszs/ack.vim' Easy grep like searching - install ack-grep first
" {{{
" ripgrep needs to be installed, use cargo(Rust)
" let g:ackprg = 'rg -S --hidden --no-heading --vimgrep'
let g:ackprg = 'rg -S --no-heading --vimgrep'
" }}}

" 'mhinz/vim-grepper' - grep tool like ack.vim
" {{{
" let g:grepper = {}
" let g:grepper.tools = ['rg']
" }}}


" 'ctrlpvim/ctrlp.vim'
" {{{
if executable('rg')
  " set grepprg=rg\ -S\ --hidden\ --line-number\ --no-heading\ --vimgrep
  set grepprg=rg\ --no-heading\ --ignore-case\ --vimgrep
  set grepformat=%f:%l:%c:%m,%f:%l:%m

  " let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
  " let g:ctrlp_user_command = 'rg %s --files --hidden --color never'
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" Set delay to prevent extra search
" let g:ctrlp_lazy_update = 350

" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
" let g:ctrlp_clear_cache_on_exit = 0

" Set no file limit, we are building a big project
" let g:ctrlp_max_files = 0

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" set behavior for opening multiple files with <c-z> and <c-o>
let g:ctrlp_open_multiple_files = '1vj'

" let <c-o> and <c-y> accept one extra key arg for behavior
" let g:ctrlp_arg_map = 1

let g:ctrlp_working_path_mode = 'ra'

" set ctrlp window size
let g:ctrlp_match_window = 'min:1,max:999'
" }}}

" Ack.vim-esque quickfix mappings
aug autoquickfix
    au!
    " au QuickFixCmdPost [^l]* cwindow
    " au QuickFixCmdPost    l* lwindow
    au FileType qf wincmd J
    au FileType qf nnoremap <buffer> <CR> <CR><C-W>p 
    au FileType qf nnoremap <buffer> go <CR><C-W>p 
    au FileType qf nnoremap <buffer> t <C-W><CR><C-W>T
    au FileType qf nnoremap <buffer> T <C-W><CR><C-W>TgT<C-W>j
    au FileType qf nnoremap <buffer> o <CR>
    au FileType qf nnoremap <buffer> h <C-W><CR><C-W>K
    au FileType qf nnoremap <buffer> H <C-W><CR><C-W>K<C-W>b
    au FileType qf nnoremap <buffer> v <C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t
    au FileType qf nnoremap <buffer> gv <C-W><CR><C-W>H<C-W>b<C-W>J
    au FileType qf nnoremap <buffer> q <C-W>q
aug END

" Close quickfix window if no other buffers open
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" ====================================================================
" Haskell
" ====================================================================
" 'bitc/vim-hdevtools'
"{{{
"au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
"au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
"}}}

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" show location of cursor using a horizontal line.
set cursorline
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

" Character representation of whitespaces
set list listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2
syntax enable

" Set the color scheme
" if $COLORTERM == 'gnome-terminal'
"   set t_Co=256
" endif

" Set colorscheme
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif
if $TERM =~ "-256color"
  set t_Co=256
endif
set background=dark
silent! colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

highlight Normal ctermbg=None
highlight SpecialKey ctermfg=132 guifg=Cyan
" highlight NonText ctermfg=12 guifg=Blue
highlight TermCursor ctermfg=red guifg=red

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
" "}}}

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
