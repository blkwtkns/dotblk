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

" source all the files in configs
source ~/.config/nvim/configs/functions.vim
source ~/.config/nvim/configs/plugins.vim
source ~/.config/nvim/configs/settings.vim
source ~/.config/nvim/configs/mappings.vim
