" Exit insert mode
inoremap <Leader><Leader> <esc>

" Deoplete
" ====================================================================
" ,<Tab> for regular tab
inoremap <Leader><Tab> <Space><Space>

" TabComplete:
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" ====================================================================


" Native grep
" ====================================================================
" command -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
" nnoremap <Leader>r :Rg<space>
" " grep visual selection
" vnoremap <Leader>r y:Rg <C-r>=fnameescape(@")<CR><CR>:cw<CR>
" " grep word under cursor
" nnoremap <silent><Leader>rw :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" ====================================================================


" Ack.vim
" ====================================================================
vnoremap <silent><Leader>r y:Ack! <C-r>=fnameescape(@")<CR><CR>
nnoremap <Leader>r :Ack!<space>
" ====================================================================


" FZF
" ====================================================================
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fl :Lines<CR>

nnoremap <Leader>fg :Fg<CR>
nnoremap <silent> <Leader>FG       :Fg <C-R><C-A><CR>
xnoremap <silent> <Leader>fg       y:Fg <C-R>"<CR>

nnoremap <Leader>fm :Marks<cr>
nnoremap <Leader>fw :Windows<cr>
nnoremap <Leader>fc :Commands<cr>
nnoremap <Leader>fh :History<cr>
nnoremap <Leader>fG :GFiles<cr>
nnoremap <Leader>f? :GFiles?<cr>
" nnoremap <Leader>fgg :GGrep<cr>
" ====================================================================


" Ctrlp-funky
" ====================================================================
" nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
" nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" ====================================================================


" vim-schlepp
" ====================================================================
" vmap <unique> <up>    <Plug>SchleppUp
" vmap <unique> <down>  <Plug>SchleppDown
" vmap <unique> <left>  <Plug>SchleppLeft
" vmap <unique> <right> <Plug>SchleppRight
" ====================================================================


" Fugitive
" ====================================================================
nnoremap <leader>gs :Gstatus<CR>
" nnoremap <leader>gd :Gdiff<CR>
" nnoremap <leader>gb :Gblame<CR>
" nnoremap <leader>ga :Git add %:p<CR><CR>
" nnoremap <leader>gc :Gcommit -v -q<CR>
" nnoremap <leader>gt :Gcommit -v -q %:p<CR>
" nnoremap <leader>ge :Gedit<CR>
" nnoremap <leader>gr :Gread<CR>
" nnoremap <leader>gw :Gwrite<CR><CR>
" nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
" nnoremap <leader>gp :Ggrep<Space>
" nnoremap <leader>gm :Gmove<Space>
" nnoremap <leader>gb :Git branch<Space>
" nnoremap <leader>go :Git checkout<Space>
" nnoremap <leader>gps :Dispatch! git push<CR>
" nnoremap <leader>gpl :Dispatch! git pull<CR>
" ====================================================================


" Ctrlp
" ====================================================================
" nnoremap <leader>ct :CtrlPTag<CR>
" nnoremap <leader>b :CtrlPBuffer<CR>
" ====================================================================


" Tags
" ====================================================================
" tagbar
" nnoremap <Leader>tg :TagbarToggle<CR>
" ====================================================================


" Buffers
" ====================================================================
nnoremap gl :bnext<CR>
nnoremap gh :bprevious<cr>
nnoremap <Leader>bd :bp<cr>:bd#<CR>
nnoremap <Leader>bw :bp<cr>:bw#<CR>
" ====================================================================


" Terminal:
" ====================================================================
" Switch: to normal mode
tnoremap <Leader><ESC> <C-\><C-n>
" ====================================================================


" Sessions:
" ====================================================================
" blkwtkns/vim-sesh
" nnoremap <leader>ss :SaveSession<space><CR>
" nnoremap <leader>rs :RestoreSession<space><CR>
nnoremap <leader>ss :SaveSesh<space>
nnoremap <leader>sr :RestoreSesh<space>
" ====================================================================

" Misc:
" ====================================================================
" Move: selected blocks
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Highlighting:
" toggle search
nnoremap <leader><space> :noh<CR>
" toggle column
nnoremap <silent><leader>C :ToggleColorColumn<cr>

" Registers:
" check and choose
nnoremap <leader>R :Reg<CR>

" Google:
xnoremap <leader>FF y:Go<space><C-r>"<CR>

" Strip:
" whitespace
nnoremap <leader>sw :%s/\s\+$//<cr>:let @/=''<CR>

" nnoremap <C-n> :call NumberToggle()<cr>
" nnoremap M :call ToggleMouse()<cr>

" Linebreaks: Treating long lines(useful when moving around in them)
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

if g:stop_netrw == 1
  " vim-dirvish
  noremap <silent><Leader>l :call DirvToggle(getcwd())<CR>
  noremap <silent><Leader>L :call DirvToggle("")<CR>
else
  " netrw
  noremap <silent><Leader>l :call VexToggle(getcwd())<CR>
  noremap <silent><Leader>L :call VexToggle("")<CR>
endif
" ====================================================================
