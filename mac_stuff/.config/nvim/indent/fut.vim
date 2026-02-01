setlocal indentexpr=FutharkIndent()

function! s:stripComment(line)
  if line =~ '^\s*--\(-*\s\+\|$\)'
    return ''
  else
    let l:stripped = split(a:line, '-- ')
    if len(l:stripped) > 1
      return substitute(l:stripped[0], '\s*$', '', '')
    else
      return line
    endif
  endif
endfunction


function! FutharkIndent()
  let l:thisline = getline(v:lnum)
  let prevlineno = prevnonblank(v:lnum)
  let l:prevline = getline(prevlineno)

  " Indent extra if matching these patterns
  if l:prevline =~ "=$" || l:prevline =~ "->$" || l:prevline =~ "do$"
    return indent(prevlineno) + &shiftwidth
  endif
  

  " IF HANDLING
  if l:prevline =~ '\C\<if\>'
    if l:prevline !~ '\C.*\<else\>'
    endif
  endif
  " if l:prevline !~ '\C\<if\>.*\<else\>'
  "   let l:s = match(l:prevline, '\C\<if\>.*\&.*\zs\<then\>')
  "   if l:s > 0
  "     return l:s
  "   endif
  "
  "   let l:s = match(l:prevline, '\C\<if\>')
  "   if l:s > 0
  "     return l:s + &shiftwidth
  "   endif
  "   let l:s = match(l:prevline, '\C\<else\>')
  "   if l:s > 0
  "     return l:s + &shiftwidth
  "   endif
  " endif


  " Else keep same level of indentation
  " else
  return indent(prevlineno)

  " endif
endfunction
