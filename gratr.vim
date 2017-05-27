" syntax file for gratr parser generator
" https://svn.divms.uiowa.edu/repos/clc/projects/gratr2/
" maintainer: David Kelly
"

if exists('b:current_syntax')
  finish
endif

syntax keyword gratrKeyword Start Defined Syntactic Lexical Whitespace Rules Vars

syntax match gratrOperator "->" 
syntax match gratrOperator "=>" 

syntax match gratrProduction "\."

highlight link gratrKeyword Macro
highlight link gratrOperator Operator
highlight link gratrProduction Special

let b:current_syntax = 'gratr'
