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

" This will be for restore function
" Make this return name, branch, and directory
" TODO: Track current session, view .dotfiles, allow session directory
" placement, allow particular sessions to be kept in actual project
fun! FindSession(...)
  let l:name = getcwd()
  " Check if located within a repo
  if !isdirectory(".git")
    let l:name = substitute(finddir(".git", ".;"), "/.git", "", "")
  end

  if l:name != ""
    let l:name = matchstr(l:name, ".*", strridx(l:name, "/") + 1)
    let l:branch = Gbranch_name()
    let l:dir = l:name . "/" . l:branch
    if a:0 == 0
      let l:name = l:name . '-' . l:branch
      let l:info = [l:dir, l:branch, l:name]
      return l:info
    else 
      let l:name = a:1
    end
  else
    let l:name = getcwd()
    let l:name = matchstr(l:name, ".*", strridx(l:name, "/") + 1)
    let l:dir = l:name
    if a:0 != 0 
      let l:name = a:1
    end
  end
  let l:info = [l:dir, l:name]
  return l:info
endfun

fun! RestoreSession(...)
  if a:0 == 0 || a:1 == ""
    let l:info = FindSession()
  else
    " TODO: TEST TEST TEST
    let l:arglen = len(a:1)

    if strpart(a:1, l:arglen - 4) == '.vim'
      let l:param = strpart(a:1, 0, l:arglen - 4)
    else
      let l:param = a:1
    end
    let l:info = FindSession(l:param)
  end

  if len(l:info) > 2
    let l:name = l:info[0] . '/' . l:info[2] . '.vim'
  else
    let l:name = l:info[0] . '/' . l:info[1] . '.vim'
  end

  if filereadable($HOME . "/nvim.local/sessions/" . l:name)
    " Allows for new sessions to be loaded and not overlap
     %bwipeout
    execute 'source ' . $HOME . "/nvim.local/sessions/" . l:name
  else
    echo 'No session found'
  end
endfun

fun! CreateSession(info)
    if !isdirectory($HOME . "/nvim.local/sessions/" . a:info[0])
      call mkdir($HOME . "/nvim.local/sessions/" . a:info[0], "p")
    endif
  if len(a:info) > 2
    return a:info[0] . '/' . a:info[2] . '.vim'
  else
    return a:info[0] . '/' . a:info[1] . '.vim'
  end
endfun

fun! SaveSession(...)
  if a:0 == 0 || a:1 == ""
    let l:arg = ""
    let l:info = FindSession()
  else
    " TODO: TEST TEST TEST
    let l:arglen = len(a:1)

    if strpart(a:1, l:arglen - 4) == '.vim'
      let l:param = strpart(a:1, 0, l:arglen - 4)
    else
      let l:param = a:1
    end
    let l:info = FindSession(l:param)
  end

  if len(l:info) > 2
    let l:name = l:info[0] . '/' . l:info[2] . '.vim'
  else
    let l:name = l:info[0] . '/' . l:info[1] . '.vim'
  end

  if filereadable($HOME . "/nvim.local/sessions/" . l:name)
    let l:choice = confirm("Overwrite session?", "&Yes\n&No", 1)
    if l:choice == 1
      let l:name = CreateSession(l:info)
    else
      return
    end
  else
    let l:name = CreateSession(l:info)
  end

  if l:name != ""
    " TODO: Need to save args first, then restore if deleted
    if(argc() > 0)
      execute 'argd *'
    end
    execute 'mksession! ' . $HOME . '/nvim.local/sessions/' . l:name
  else
    echo 'Session save halted'
  end
endfun

" command! -nargs=? SaveSession call SaveSession(<f-args>)
" command! -nargs=? RestoreSession call RestoreSession(<f-args>)

fun! SeshComplete(ArgLead, CmdLine, CursorPos)
  " return ['one', 'two', 'three']
    let l:info = FindSession()
    return map(split(glob($HOME . '/nvim.local/sessions/' . l:info[0] . '/' .'*.vim'), "\n"), 'fnamemodify(v:val, ":t")')
endfun

command! -nargs=* -complete=customlist,SeshComplete SaveSession call SaveSession(<f-args>)
command! -nargs=* -complete=customlist,SeshComplete RestoreSession call RestoreSession(<f-args>)

" Courtesy itchyny's vim-gitbranch - expand if fugitive dependency unwanted
fun! Gbranch_name() abort
  if get(b:, 'gitbranch_pwd', '') !=# expand('%:p:h') || !has_key(b:, 'gitbranch_path')
    call Gbranch_detect(expand('%:p:h'))
  end
  if has_key(b:, 'gitbranch_path') && filereadable(b:gitbranch_path)
    let l:branch = get(readfile(b:gitbranch_path), 0, '')
    if l:branch =~# '^ref: '
      return substitute(l:branch, '^ref: \%(refs/\%(heads/\|remotes/\|tags/\)\=\)\=', '', '')
    elseif l:branch =~# '^\x\{20\}'
      return l:branch[:6]
    end
  end
  return ''
endfun

fun! Gbranch_dir(path) abort
  let l:path = a:path
  let l:prev = ''
  while l:path !=# prev
    let l:dir = l:path . '/.git'
    let l:type = getftype(l:dir)
    if l:type ==# 'dir' && isdirectory(l:dir.'/objects') && isdirectory(l:dir.'/refs') && getfsize(l:dir.'/HEAD') > 10
      return l:dir
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
endfun

fun! Gbranch_detect(path) abort
  unlet! b:gitbranch_path
  let b:gitbranch_pwd = expand('%:p:h')
  let l:dir = Gbranch_dir(a:path)
  if l:dir !=# ''
    let l:path = l:dir . '/HEAD'
    if filereadable(l:path)
      let b:gitbranch_path = l:path
    end
  end
endfun

" command! GitBranch call Gbranch_name()

" Depends on fugitive plugin
" fun! GitInfo()
"   let l:git = fugitive#head()
"   if l:git != ''
"     return l:git
"   else
"     return ''
" endfun

" command! GitInfo call GitInfo()
" command! FindProj call FindSession()

" Restore and save sessions.
" if argc() == 0
  " autocmd VimEnter * call RestoreSession()
"   autocmd VimLeave * call SaveSession()
" end

