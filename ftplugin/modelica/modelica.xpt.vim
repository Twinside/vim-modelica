XPTemplate priority=lang

let s:f = g:XPTfuncs()

" use snippet 'varConst' to generate contant variables
" use snippet 'varFormat' to generate formatting variables
" use snippet 'varSpaces' to generate spacing variables

XPTinclude
      \ _common/common

XPT model " model ... equation ... end ... ;
model `modelname^`docstring...{{^ "`description^"`}}^
    `cursor^
equation
end `modelname^;

XPT class " class ... equation ... end ... ;
class `classname^`docstring...{{^ "`description^"`}}^
    `cursor^
equation
end `classname^;

XPT connector " connector ... end ... ;
connector `connectorname^`docstring...{{^ "`description^"`}}^
    `cursor^
end `connectorname^;

XPT record " record ... end ... ;
record `recordname^`docstring...{{^ "`description^"`}}^
    `cursor^
end `recordname^;

XPT typer " type ... = Real (unit=...)
type `typename^ = Real(`quantity...{{^quantity="`quantity^", `}}^unit="`unit^")

XPT while " while ... then ... end while;
while `cond^ loop
    `cursor^
end while;

XPT if " if ... then ... end if
if `cond^ then
    `cursor^
end if;

XPT block " block .... end .... ;
block `blockName^
    `cursor^
end `blockName^;

XPT package " package .... end .... ;
package `blockName^
    `cursor^
end `blockName^;

XPT forin " for ... in ... loop ... end loop;
for `var^ in `range^ loop
    `cursor^
end for;

XPT enum " type ... = enumeration ( ... )
type `typename^ = enumeration( `enumInfo^`...^, `subInfo^`...^)

XPT function " function ... algorithm ... end ... ;
function `functionName^
algorithm
end `functionName^;

