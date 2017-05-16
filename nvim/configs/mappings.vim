" Exit insert mode
inoremap <Leader><Leader> <esc>

" ====================================================================
" Deoplete
" ====================================================================
" ,<Tab> for regular tab
inoremap <Leader><Tab> <Space><Space>

" deoplete tab-complete
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()

" ====================================================================
" Grepping
" ====================================================================

" Native grep
" ====================================================================
" command -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
" nnoremap <Leader>r :Rg<space>
" " grep visual selection
" vnoremap <Leader>r y:Rg <C-r>=fnameescape(@")<CR><CR>:cw<CR>
" " grep word under cursor
" nnoremap <silent><Leader>rw :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Ack.vim
" ====================================================================
vnoremap <silent><Leader>r y:Ack! <C-r>=fnameescape(@")<CR><CR>
nnoremap <Leader>r :Ack!<space>

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

" vim-grepper - Determine how it befores buffer search
" ====================================================================
" nnoremap <leader>ab :Grepper -tool rg -buffers<cr>

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
" nnoremap <leader>gb :Gblame<CR>
" nnoremap <leader>gd :Gdiff<CR>
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
" Ctrlp-funky
" ====================================================================
" nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
" nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

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
" Terminal mode
" ====================================================================
" Switch to normal mode
tnoremap <Leader><ESC> <C-\><C-n>

" ====================================================================
" Commands
" ====================================================================
" See Save and Restore project functions in functions.vim
" WARNING: This saves only to default at the moment probably better
" to not include carriage return yet unitl resolved
" nnoremap <leader>ss :SaveSession<space><CR>
" nnoremap <leader>rs :RestoreSession<space><CR>
nnoremap <leader>ss :SaveSesh<space>
nnoremap <leader>sr :RestoreSesh<space>

" ====================================================================
" Misc
" ====================================================================
" Toggle search highlighting
nnoremap <leader><space> :noh<CR>

" google it
xnoremap <leader>FF y:Go<space><C-r>"<CR>

" Strips whitespace
nnoremap <leader>sw :%s/\s\+$//<cr>:let @/=''<CR>

" nnoremap <C-n> :call NumberToggle()<cr>
" nnoremap M :call ToggleMouse()<cr>

" Treat long lines as break lines (useful when moving around in them)
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
