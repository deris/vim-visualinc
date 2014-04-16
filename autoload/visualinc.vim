" visualinc - Increment or decrement number in Visual mode.
" Version: 0.1.0
" Copyright (C) 2014 deris0126
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}

" Public API {{{1
function! visualinc#increment() "{{{2
  call s:visual_increment(1)
endfunction
"}}}

function! visualinc#decrement() "{{{2
  call s:visual_increment(-1)
endfunction
"}}}

"}}}

" Private {{{1
function! s:visual_increment(step) "{{{2
  try
    let realstep = a:step * v:count1
    if visualmode() ==# 'V'
      call s:execute_with_ignore_exception(printf('''<,''>s/-\?\d\+/\=submatch(0)+%d/g', realstep))
    elseif visualmode() ==# 'v'
      let spos = getpos('''<')
      let epos = getpos('''>')
      if spos[1] == epos[1]
        call s:execute_with_ignore_exception(printf('%ds/\%%>%dc.\{-}\zs-\?\d\+\ze.*\%%<%dc/\=submatch(0)+%d/g', spos[1], spos[2]-1, epos[2]+2, realstep))
      elseif spos[1] < epos[1]
        call s:execute_with_ignore_exception(printf('%ds/\%%>%dc.\{-}\zs-\?\d\+/\=submatch(0)+%d/g', spos[1], spos[2]-1, realstep))
        let spos_next = spos[1] + 1
        let epos_prev = epos[1] - 1
        if spos_next <= epos_prev
          call s:execute_with_ignore_exception(printf('%d,%ds/-\?\d\+/\=submatch(0)+%d/g', spos_next, epos_prev, realstep))
        endif
        call s:execute_with_ignore_exception(printf('%ds/-\?\d\+\ze.*\%%<%dc/\=submatch(0)+%d/g', epos[1], epos[2]+2, realstep))
      else
        " do nothing
      endif
    elseif visualmode() ==# ''
      let spos = getpos('''<')
      let epos = getpos('''>')
      call s:execute_with_ignore_exception(printf('%d,%ds/\%%>%dc.\{-}\zs-\?\d\+\ze.*\%%<%dc/\=submatch(0)+%d/g', spos[1], epos[1], spos[2]-1, epos[2]+2, realstep))
    endif
  catch
    " do nothing
  finally
    normal! gv
  endtry
endfunction
"}}}

function! s:execute_with_ignore_exception(command) "{{{2
  try
    execute a:command
  catch
    " do nothing
  endtry
endfunction
"}}}

"}}}

" __END__ "{{{1
" vim: foldmethod=marker
