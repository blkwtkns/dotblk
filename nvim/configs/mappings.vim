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
vnoremap <Leader>rg y:Ack <C-r>=fnameescape(@")<CR><CR>
nnoremap <Leader>rg :Ack<space>

" ====================================================================
" Ctrlp
" ====================================================================
nnoremap <leader>ct :CtrlPTag<CR>
nnoremap <leader>bl :CtrlPBuffer<CR>

" ====================================================================
" Tags
" ====================================================================
" tagbar
nnoremap <Leader>tg :TagbarToggle<CR>

" ====================================================================
" Buffers
" ====================================================================
nnoremap gl :bnext<CR>
nnoremap gh :bprevious<cr>

" Treat long lines as break lines (useful when moving around in them)
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

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

