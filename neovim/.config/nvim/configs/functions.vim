" Show contents of registers and paste selected into the buffer
function! Reg()
  reg
  echo "Register: "
  let char = nr2char(getchar())
  if char != "\<Esc>"
    execute "normal! \"".char."p"
  endif
  redraw
endfunction

command! -nargs=0 Reg call Reg()


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

set colorcolumn=0
let s:color_column_old = 101

fun! s:ToggleColorColumn()
    if s:color_column_old == 0
        let s:color_column_old = &colorcolumn
        windo let &colorcolumn = 0
    else
        windo let &colorcolumn=s:color_column_old
        let s:color_column_old = 0
    endif
endfun

command! -nargs=0 ToggleColorColumn call <SID>ToggleColorColumn()

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
" fun! Firefox(params)
"   let d = {
"         \ 'go': 'http://www.google.com',
"         \ 'wp': 'https://en.wikipedia.org',
"         \ 'red': 'http://www.reddit.com',
"         \ 'py': 'http://www.reddit.com/r/python',
"         \ 'prog': 'http://www.reddit.com/r/programming',
"         \ 'vim': 'http://www.reddit.com/r/vim',
"         \ 'nvim': 'http://www.reddit.com/r/neovim',
"         \ 'hn': 'https://news.ycombinator.com',
"         \ 'index': 'http://index.hu',
"         \ 'hup': 'http://hup.hu',
"         \ }
"   if has_key(d, a:params)
"     let url = d[a:params]
"     exec 'silent !xdg-open "' . url . '"'
"   else
"     echo "bookmark not found"
"   endif
" endfun
"
" command! -nargs=1 FF call Firefox(<f-args>)
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

" Needs testing, found on reddit
function! OpenChangedFiles()
    only " Close all windows, unless they're modified

    let status = system('git status -s | grep "^ \?\(M\|A\)" | cut -d " " -f 3')
    let filenames = split(status, "\n")
    let topdir = split(system('git rev-parse --show-toplevel'), "\n")[0]

    if len(filenames) < 1
        let status = system('git show --pretty="format:" --name-only')
        let filenames = split(status, "\n")
    endif

    exec "edit " . topdir . "/" . filenames[0]

    for filename in filenames[1:]
        if len(filenames) > 4
            exec "tabedit " . topdir . "/" . filename
        else
            exec "sp " . topdir . "/" . filename
        endif
    endfor
endfunction

" function! Quit_netrw()
"     for i in range(1, bufnr('$'))
"         if buflisted(i)
"             if getbufvar(i, '&filetype') == "netrw"
"                 silent exe 'bwipeout ' . i
"             endif
"         endif
"     endfor
" endfunction

fun! VexToggle(dir)
  if exists("t:vex_buf_nr")
    call VexClose()
  else
    call VexOpen(a:dir)
  endif
endfun

fun VexOpen(dir)
  let g:netrw_browse_split=4    " open files in previous window
  let vex_width = 25

  execute "Vexplore " . a:dir
  let t:vex_buf_nr = bufnr("%")
  wincmd H

  call VexSize(vex_width)
endf

fun! VexClose()
  let cur_win_nr = winnr()
  let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )

  1wincmd w
  close
  unlet t:vex_buf_nr

  execute (target_nr - 1) . "wincmd w"
  call NormalizeWidths()
endf

fun! VexSize(vex_width)
  execute "vertical resize" . a:vex_width
  set winfixwidth
  call NormalizeWidths()
endf

" vim-dirvish specific functions
fun! DirvToggle(dir)
  if exists("t:dirv_buf_nr")
    call DirvClose()
  else
    call DirvOpen(a:dir)
  endif
endfun

fun DirvOpen(dir)
  let dirv_width = 15
  1wincmd w

  if a:dir == "" 
    exe 'Vexplore %:p'.repeat(':h',v:count1)
  else
    exe "Vexplore " . a:dir
  endif

  let t:dirv_buf_nr = bufnr("%")
  wincmd H

  call DirvSize(dirv_width)
endf

fun! DirvClose()
  let cur_win_nr = winnr()
  let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )

  1wincmd w
  close
  unlet t:dirv_buf_nr

  execute (target_nr - 1) . "wincmd w"
  call NormalizeWidths()
endf

fun! DirvSize(dirv_width)
  execute "vertical resize" . a:dirv_width
  set winfixwidth
  call NormalizeWidths()
endf

fun! NormalizeWidths()
  let eadir_pref = &eadirection
  set eadirection=hor
  set equalalways! equalalways!
  let &eadirection = eadir_pref
endf

" ====================================================================
" Global variables and setup
" ====================================================================
fun! Find_versioning_dir(path)
  let l:path = a:path
  let l:prev = ''
  while l:path !=# prev
    let l:dir = l:path . '/.git'
    let l:type = getftype(l:dir)
    if l:type ==# 'dir' && isdirectory(l:dir.'/objects') && isdirectory(l:dir.'/refs') && getfsize(l:dir.'/HEAD') > 10
      let l:reldir = get(readfile(l:dir), 0, '')
      return simplify(l:path . '/' . l:reldir[8:])
    elseif l:type ==# 'file'
      let l:reldir = get(readfile(l:dir), 0, '')
      if l:reldir =~# '^gitdir: '
        return simplify(l:path . '/' . l:reldir[8:])
      end
    end
    let l:prev = l:path
    let l:path = fnamemodify(l:path, ':h')
  endwhile
  return ''
endf
