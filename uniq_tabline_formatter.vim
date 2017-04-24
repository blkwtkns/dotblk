" here is how you can define a 'foo' formatter:
" create a file in the dir autoload/airline/extensions/tabline/formatters/
" called foo.vim >

" Create airline extension that shows default formatting for active tab,
" but only tab number and buffer number specifics for inactive tabs

" Ref function! airline#extensions#tabline#tabs#get() for intel
fun! airline#extensions#tabline#formatters#uniq_tabline_formatter#format(bufnr, buffers)
  let uniq_buf = bufnr('%')
  let uniq_tab = tabpagenr()
  let buffers = tabpagebuflist(uniq_tab)
  return fnamemodify(bufname(a:bufnr), ':t')
endfun
let g:airline#extensions#tabline#formatter = 'uniq_tabline_formatter'
