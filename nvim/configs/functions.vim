" for deoplete
fun! DoRemote(arg)
  UpdateRemotePlugins
endfun


"function that clears all registers with ClearRegister command
fun! ClearRegisters()
  let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="*+'
  let i=0
  while (i<strlen(regs))
    exec 'let @'.regs[i].'=""'
    let i=i+1
  endwhile
endfun

command! ClearReg call ClearRegisters()


" mouse {{{
" fun! ToggleMouse()
"   if &mouse == "a"
"     set mouse=
"     echo 'copy with mouse: ✔'
"     set nonumber
"   else
"     set mouse=a
"     echo 'copy with mouse: ✘'
"     set number
"   endif
" endfun
" "}}}


" Google with (or without) search {{{
fun! Google(params)
  " echo a:params
  let url = "http://www.google.com/search?q=" . a:params
  exec 'silent !xdg-open "' . url . '"'
endfun

" :Go search_term    -> google lookup of the search term
command! -nargs=1 Go call Google(<f-args>)

" :Google    -> open Google's search page
command! Google exec 'silent !xdg-open http://www.google.com'
" }}}


" Firefox bookmarks (works with other browsers too) {{{
fun! Firefox(params)
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
endfun

command! -nargs=1 FF call Firefox(<f-args>)
" }}}


" function and key map to toggle absolute and relative numbering
" fun! NumberToggle()
" if(&relativenumber == 1)
" set number
" else
" set relativenumber
" endif
" endfun


fun! RenameFile() " Thanks to Gary Bernhardt & Ben Orenstein
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfun

" Make ctrl-h/j/k/l move between windows and auto-insert in terminals
fun! s:mapMoveToWindowInDirection(direction)
    fun! s:maybeInsertMode(direction)
        stopinsert
        execute "wincmd" a:direction

        if &buftype == 'terminal'
            startinsert!
        endif
    endfun

    execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
                \ "<C-\\><C-n>"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
    execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
endfun
for dir in ["h", "j", "l", "k"]
    call s:mapMoveToWindowInDirection(dir)
endfor

