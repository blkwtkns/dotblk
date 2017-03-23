" ====================================================================
" Deoplete
" ====================================================================
" ,<Tab> for regular tab
inoremap <Leader><Tab> <Space><Space>

" deoplete tab-complete
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()

" ====================================================================
" Ack
" ====================================================================
" vnoremap <Leader>a y:Ack! <C-r>=fnameescape(@")<CR><CR>
" nnoremap <Leader>a :Ack!<space>

" ====================================================================
" vim-grepper
" ====================================================================
nnoremap <leader>g :Grepper -tool rg<cr>
nnoremap <leader>gw :Grepper -tool rg -cword -noprompt<cr>
nnoremap <leader>gb :Grepper -tool rg -buffers<cr>
" nmap <leader>gs <plug>(GrepperOperator)<cr>
xmap <leader>gv <plug>(GrepperOperator)<cr>

" ====================================================================
" Fugitive
" ====================================================================
nnoremap <space>gs :Gstatus<CR>
" nnoremap <space>ga :Git add %:p<CR><CR>
" nnoremap <space>gc :Gcommit -v -q<CR>
" nnoremap <space>gt :Gcommit -v -q %:p<CR>
" nnoremap <space>gd :Gdiff<CR>
" nnoremap <space>ge :Gedit<CR>
" nnoremap <space>gr :Gread<CR>
" nnoremap <space>gw :Gwrite<CR><CR>
" nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
" nnoremap <space>gp :Ggrep<Space>
" nnoremap <space>gm :Gmove<Space>
" nnoremap <space>gb :Git branch<Space>
" nnoremap <space>go :Git checkout<Space>
" nnoremap <space>gps :Dispatch! git push<CR>
" nnoremap <space>gpl :Dispatch! git pull<CR>

" ====================================================================
" Ctrlp
" ====================================================================
nnoremap <leader>ct :CtrlPTag<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

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

" ====================================================================
" Terminal mode
" ====================================================================
" Switch to normal mode
tnoremap <Leader><ESC> <C-\><C-n>


" ====================================================================
" Misc
" ====================================================================
" Toggle search highlighting
nnoremap <leader><space> :noh<CR>

" Strips whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" nnoremap <C-n> :call NumberToggle()<cr>
" nnoremap M :call ToggleMouse()<cr>

" Treat long lines as break lines (useful when moving around in them)
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
