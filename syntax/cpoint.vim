if exists('b:current_syntax') && b:current_syntax == 'cpoint'
  finish
endif

" Highlight long strings.
syn sync minlines=100

" A lot inspired from the rust syntax : https://github.com/rust-lang/rust.vim/blob/master/syntax/rust.vim

syn keyword   cpointConditional match if else
syn keyword   cpointRepeat loop while for
syn keyword   cpointTypedef type nextgroup=cpointIdentifier skipwhite skipempty
syn keyword   cpointStructure struct union nextgroup=cpointIdentifier skipwhite skipempty
syn keyword   cpointKeyword     break
syn keyword   cpointKeyword     func nextgroup=cpointFuncName skipwhite skipempty
syn keyword   cpointKeyword     var
syn keyword   cpointKeyword     return
syn keyword   cpointStorage     const

syn match     cpointIdentifier  contains=cpointIdentifierPrime "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn match     cpointFuncName    "\%(r#\)\=\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained

syn keyword   cpointType        u8 u16 u32 u64 u128 float double
syn keyword   cpointType        i8 i16 i32 i64 i128

syn keyword   cpointBoolean     true false

syn match     cpointFuncCall    "\w\(\w\)*("he=e-1,me=e-1

" syn match     cpointFuncCall    "\w\(\w\)*::<"he=e-3,me=e-3 " foo::<T>(); (function call with generic)

syn match     cpointOperator     display "\%(+\|-\|/\|*\|=\|\|>\|<\|%\)=\?"

syn match     cpointOperator     display "&&\|||"

syn match     cpointDecNumber   display "\<[0-9][0-9_]*\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="

syn region cpointFoldBraces start="{" end="}" transparent fold

hi def link cpointDecNumber       cpointNumber


hi def link cpointRepeat        Conditional
hi def link cpointConditional   Conditional

hi def link cpointTypedef       Keyword

hi def link cpointStructure     Keyword

hi def link cpointKeyword       Keyword

hi def link cpointStorage       StorageClass

hi def link cpointIdentifier    Identifier

hi def link cpointFuncName      Function

hi def link cpointType          Type

hi def link cpointBoolean       Boolean

hi def link cpointFuncCall      Function

hi def link cpointOperator      Operator


hi def link cpointNumber        Number

if !exists('b:current_syntax')
  let b:current_syntax = 'cpoint'
endif