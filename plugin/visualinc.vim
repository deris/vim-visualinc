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

if exists('g:loaded_visualinc')
  finish
endif

vnoremap <silent> <Plug>(visualinc-increment)  :<C-u>call visualinc#increment()<CR>
vnoremap <silent> <Plug>(visualinc-decrement)  :<C-u>call visualinc#decrement()<CR>

if !hasmapto('<Plug>(visualinc-increment)', 'v')
  vmap <C-a>  <Plug>(visualinc-increment)
endif
if !hasmapto('<Plug>(visualinc-decrement)', 'v')
  vmap <C-x>  <Plug>(visualinc-decrement)
endif

let g:loaded_visualinc = 1

" __END__
" vim: foldmethod=marker
