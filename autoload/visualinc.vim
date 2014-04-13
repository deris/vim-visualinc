" visualinc - Increment or decrement number in Visual mode.
" Version: 0.0.1
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
      execute printf('''<,''>s/\d\+/\=submatch(0)+%d/g', realstep)
    else
      " TODO now only support linewise Visual mode.
    endif
  catch
    " do nothing
  finally
    normal! gv
  endtry
endfunction
"}}}

"}}}

" __END__ "{{{1
" vim: foldmethod=marker
