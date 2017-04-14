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

" Ack.vim
" ====================================================================
" vnoremap <silent> <Leader>g y:Ack! <C-r>=fnameescape(@")<CR><CR>
" nnoremap <Leader>g :Ack!<space>

" Native grep
" ====================================================================
command -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
nnoremap <Leader>g :Rg<space>
" grep visual selection
vnoremap <Leader>g y:Rg <C-r>=fnameescape(@")<CR><CR>:cw<CR>
" grep word under cursor
nnoremap <silent><Leader>gw :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" FZF
" ====================================================================
" nnoremap <Leader>F :F<space>

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
nnoremap bl :bnext<CR>
nnoremap bh :bprevious<cr>
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
nnoremap <leader>ss :SaveSession<space>
nnoremap <leader>rs :RestoreSession<space>

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

nnoremap <Leader>L :Lex<CR>
