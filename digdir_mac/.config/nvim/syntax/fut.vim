syntax case match

syn match Number "\v<([+-]?(0x[0-9a-fA-F]+|[0-9]+)([ui](8|16|32|64))?)>"

syn match float "\v(([0-9]+\.[0-9]+|[0-9]+f(32|64))(f(32|64))?)"
syn match float "\v([eE][\+\-]?[0-9]+)"

syn keyword conditional if then else
syn keyword Statement loop with entry for while do in local type val
syn keyword keyword concat zip unzip unsafe
syn keyword FutharkBinding def let entry nextgroup=FutIdentifier skipwhite skipempty
syn keyword PreProc module open import nextgroup=FutIdentifier skipwhite skipempty
syn keyword FutharkCase match case

syn keyword function zip zip2 zip3 zip4 zip5 unzip unzip2 unzip3 unzip4 unzip5
syn keyword function length null head last tail init take drop
syn keyword function sized
syn keyword function split reverse concat rotate
syn keyword function iota indices
syn keyword function replicate rep
syn keyword function copy manifest
syn keyword function flatten flatten_3d flatten_4d unflatten unflatten_3d unflatten_4d
syn keyword function transpose
syn keyword function and or
syn keyword function foldl foldr
syn keyword function tabulate tabulate_2d tabulate_3d
syn keyword function r32 t32 r64 t64
syn keyword function not
syn keyword function opaque trace break
syn keyword function jvp2 vjp2 jvp vjp
syn keyword function flip curry uncurry
syn keyword function const id
syn keyword function iterate iterate_until iterate_while
syn keyword function map map1 map2 map3 map4 map5
syn keyword function reduce reduce_comm scan
syn keyword function hist reduce_by_index reduce_by_index_2d reduce_by_index_3d
syn keyword function filter partition partition2
syn keyword function all any
syn keyword function spread scatter scatter_2d scatter_3d


syn keyword boolean true false

syn match FutIdentifier "[a-zA-Z_][a-zA-Z0-9_']*" skipwhite contained contains=NONE

syn keyword type i8 i16 i32 i64 u8 u16 u32 u64 int real bool char f16 f32 f64

syn keyword typedef type

syn match constant /'.'/

syn match FutharkAssigment "\v\="
syn match FutharkOperator  "\(+\|-\|*\|/\|>\|<\|%\|!\|&\||\|\^\)"
syn match FutharkOperator  "\(++\|==\|!=\|>->\|<-<\||>\|<|\)" containedin=FutharkLambdaOperator

" Literally the same, just with parenthesis
syn match FutharkLambdaOperator "(\ *\(++\|==\|!=\|>->\|<-<\||>\|<|\)\ *)"
syn match FutharkLambdaOperator "(\ *\(+\|-\|*\|/\|>\|<\|%\|!\|&\||\|^\)\ *)"
syn match FutharkLambdaOperator "(\ *\(\.[1-9][0-9]*\)\ *)"
syn match FutharkLambdaOperator /)\.[1-9][0-9]*/ms=s+1

syn region string start=/"/ skip=/\\"/ end=/"/ keepend excludenl

syn match comment "--.*$"

hi def link FutIdentifier Function

hi def link FutharkBinding Statement
hi def link number constant
hi def link FutharkOperator operator
hi def link FutharkLambdaOperator operator
hi def link FutharkCase Keyword
