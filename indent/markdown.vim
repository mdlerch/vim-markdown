if exists("b:did_indent") | finish | endif
let b:did_indent = 1

setlocal indentexpr=GetMdIndent()

if exists("*GetMdIndent") | finish | endif

function GetMdIndent()
  let pline = getline(v:lnum - 1)
  let cline = getline(v:lnum)
  if prevnonblank(v:lnum - 1) < v:lnum - 1 || cline =~ '^\s*[-\+\*]\s' || cline =~ '^\s*\d\+\.\s\+'
    return indent(v:lnum)
  " elseif pline =~ '^\s*[-\+\*]\s'
  "   return indent(v:lnum - 1) + 2
  " elseif pline =~ '^\s*\d\+\.\s\+'
  "   return indent(v:lnum - 1) + 3
  endif
  return indent(prevnonblank(v:lnum - 1))
endfunction

