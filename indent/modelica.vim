" Vim indent file
" Language:         Modelica
" Maintainer:       Vincent B.
" Latest Revision:  

"if exists("b:did_indent")
  "finish
"endif
"let b:did_indent = 1

setlocal indentexpr=GetModelicaIndent()
setlocal indentkeys=<return>
setlocal cinwords=if,else,when,elsewhen,package,model,equation,protected
setlocal autoindent
" setlocal smartindent

let s:incrementing_keyword = '^\s*\(\(partial\|encapsulated\)\s*\)*\(when\|if\|package\|model\|connector\|for\|function\|operator\)\s'
let s:split_keyword        = '^\s*\(else\|elseif\|elsewhen\|equation\|protected\|algorithm\)\>'
let s:decrementing_keyword = '^\s*\(end\)\>'

fun! s:FetchIndentCount() "{{{
    if &shiftwidth == 0
        return &tabstop
    endif

    return &shiftwidth
endfunction "}}}

function! GetModelicaIndent()
  let indentIncrement = s:FetchIndentCount()
  let lnum = prevnonblank(v:lnum - 1)
  if lnum == 0
    return 0
  endif

  let ind = indent(lnum)
  let line = getline(lnum)

  if line =~ s:incrementing_keyword || line =~ s:split_keyword
    let ind += indentIncrement
  endif

  let this_line = getline(v:lnum)
  if this_line =~ s:split_keyword || this_line =~ s:decrementing_keyword
    let ind -= indentIncrement
  endif

  return ind
endfunction

